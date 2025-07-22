/*
 * shared_mem.h
 *
 *  Created on: Jul 18, 2025
 *      Author: nicks
 */

#ifndef SHARED_MEM_H
#define SHARED_MEM_H
#include <stdint.h>

typedef struct {
  float buffer[16];
  int   flag;
} SharedMem_t;

// The mailbox lives at 0x3000_0000
#define SHARED_MEM_BASE  ((uintptr_t)0x30000000U)
#define SHARED_MEM       ((volatile SharedMem_t*)SHARED_MEM_BASE)

#endif
