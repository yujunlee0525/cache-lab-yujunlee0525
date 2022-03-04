// Yujun Lee, yujunl2
#include "cachelab.h"
#include <getopt.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

char *t;
unsigned long hitCount;
unsigned long missCount;
unsigned long evictionCount;
unsigned long dirtyBytes;
unsigned long dirtyEviction;

long h, v, s, S, E, b;

typedef struct {
    int stamp;
    int valid_bits;
    int dirty_bytes;
    long tag;
} cache_line;

cache_line **cache;

int setCache() {
    cache = malloc((int)sizeof(cache_line *) * (1 << s));
    if (cache == NULL)
        return -1;
    for (int i = 0; i < S; i++) {
        cache[i] = malloc((int)sizeof(cache_line) * 10000);
        if (cache[i] == NULL)
            return -1;
        for (int j = 0; j < E; j++) {
            cache[i][j].valid_bits = 0;
            cache[i][j].stamp = -1;
            cache[i][j].dirty_bytes = 0;
            cache[i][j].tag = INT_MIN;
        }
    }
    return 1;
}
void update_stamp() {
    for (int i = 0; i < S; i++) {
        for (int j = 0; j < E; j++) {
            if (cache[i][j].valid_bits == 1)
                cache[i][j].stamp++;
        }
    }
    return;
}

void update(long address, char operand, int size) {
    long i_set = ((address >> b)) & ((1 << s) - 1);
    long tagbits = (address >> (b + s));
    int stamp_max = -1;
    int stamp_max_i = -1;
    // Searches for matching tags
    for (int i = 0; i < E; i++) {
        if (cache[i_set][i].tag == tagbits) {
            // printf("hit: %li \n %li end\n",cache[i_set][i].tag);
            cache[i_set][i].stamp = 0;
            hitCount++;
            // checks if u need to set the dirty_bit
            if (operand == 'S') {
                if (cache[i_set][i].dirty_bytes == 0)
                    dirtyBytes++;
                cache[i_set][i].dirty_bytes = 1;
            }
            return;
        }
    }
    // No tag matches so searches for empty lines
    for (int i = 0; i < E; i++) {
        if (cache[i_set][i].valid_bits == 0) {
            cache[i_set][i].valid_bits = 1;
            cache[i_set][i].stamp = 0;
            cache[i_set][i].tag = tagbits;
            missCount++;
            if (operand == 'S') {
                if (cache[i_set][i].dirty_bytes == 0)
                    dirtyBytes++;
                cache[i_set][i].dirty_bytes = 1;
            }
            return;
        }
    }
    // No empty lines -> time for eviction
    for (int i = 0; i < E; i++) // looks for LRU
    {
        if (cache[i_set][i].stamp > stamp_max) {
            stamp_max = cache[i_set][i].stamp;
            stamp_max_i = i;
        }
    }
    // checks for dirty eviction
    if (cache[i_set][stamp_max_i].dirty_bytes == 1) {
        dirtyEviction++;
        dirtyBytes = dirtyBytes - 1;
        cache[i_set][stamp_max_i].dirty_bytes = 0;
    }
    // evict and load/store
    if (operand == 'S') {
        if (cache[i_set][stamp_max_i].dirty_bytes == 0)
            dirtyBytes++;
        cache[i_set][stamp_max_i].dirty_bytes = 1;
    }

    cache[i_set][stamp_max_i].valid_bits = 1;
    evictionCount++;
    missCount++;
    cache[i_set][stamp_max_i].tag = tagbits;
    cache[i_set][stamp_max_i].stamp = 0;
    return;
}

void perform_opt() {
    FILE *fp = fopen(t, "r"); // the trace file
    if (fp == NULL)
        exit(-1);

    char operand;
    long address;
    int size;
    while (fscanf(fp, "%c %lx, %d\n", &operand, &address, &size) > 0) {

        switch (operand) {
        case 'S':
            update(address, 'S', size);
            break;
        case 'L':
            update(address, 'L', size);
            break;
        }
        update_stamp();
    }
    // count_dirty();
    fclose(fp);
    for (int i = 0; i < S; i++) {
        free(cache[i]);
    }
    free(cache);
}
int main(int argc, char *argv[]) {
    h = 0;
    v = 0;
    hitCount = 0;
    missCount = 0;
    evictionCount = 0;
    dirtyBytes = 0;
    dirtyEviction = 0;
    int opt;
    // = getopt(argc, argv, "hvs:E:b:t:");
    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
        switch (opt) {
        case 'h':
            h = 1;
            break;
        case 'v':
            v = 1;
            break;
        case 's':
            s = atoi(optarg);
            break;
        case 'E':
            E = atoi(optarg);
            break;
        case 'b':
            b = atoi(optarg);
            break;
        case 't':
            t = optarg;
            break;
        default:
            break;
        }
    }
    if (s < 0 || E < 0 || b < 0 || t == NULL)
        return -1;
    S = 1 << s;

    int successful = setCache();
    if (successful == 1) {
        perform_opt();
    }
    csim_stats_t *stat = malloc(sizeof(csim_stats_t));

    stat->dirty_bytes = (dirtyBytes * (1 << b));
    stat->dirty_evictions = dirtyEviction * (1 << b);
    stat->evictions = evictionCount;
    stat->hits = hitCount;
    stat->misses = missCount;
    printSummary(stat);
    free(stat);
    return 0;
}
