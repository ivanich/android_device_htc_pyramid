#define LOG_TAG "HTC_VECTOR_SHIM"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <utils/Log.h>

extern void _ZN7android10MemoryBaseC1ERKNS_2spINS_11IMemoryHeapEEEij(void*, void*, ssize_t, size_t);

void _ZN7android10MemoryBaseC1ERKNS_2spINS_11IMemoryHeapEEElj(void* obj, void* h, long o, unsigned int size) {
    _ZN7android10MemoryBaseC1ERKNS_2spINS_11IMemoryHeapEEEij(obj, h, o, size);
}
