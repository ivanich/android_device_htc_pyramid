/*
** Copyright 2014, LordNerevar
**
** Licensed under the Apache License, Version 2.0 (the "License"); 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
**
**     http://www.apache.org/licenses/LICENSE-2.0 
**
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
*/

/* Code needed to compile with gcc 4.8 */

#ifndef _RPC_FIXES_H
#define _RPC_FIXES_H 1

#include <string.h>
#include <arpa/inet.h>

#define UNUSED(x) (void)(x)

static inline uint32_t EXTRACT_32BITS(const void *p) {
    uint32_t t;
    memcpy(&t, p, sizeof(t));
    return ntohl(t);
}

#endif
