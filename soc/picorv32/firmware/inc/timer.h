#ifndef TIMER_H
#define TIMER_H
//-------------------------------------------------------------
// A basic timer API based on the RISCV rdcycle register
//-------------------------------------------------------------
#include <stdint.h>
#include "settings.h"

// Convert microseconds to clock cycles
#define US_TO_CYCLES(usecs) (1LL*F_CLK*(usecs)/1000000)

// Delay in microseconds. Accurate starting from usecs=1
#ifdef SIMULATION
#define DELAY_US(usecs) ;
#else
#define DELAY_US(usecs) delayCycles( US_TO_CYCLES(usecs) - 45 )
#endif

// Delay in milliseconds
#define DELAY_MS(msecs) DELAY_US(msecs*1000)

// Returns number of CPU cycles since power up
uint32_t getCycles(void);

// Set timer ticks to zero
void resetTimer(void);

// Get timer ticks. This handles a single timer rollover just fine!
uint32_t getTimer(void);

// Block for `nCycles`, ~45 cycles overhead
void delayCycles( const uint32_t nCycles );

#endif
