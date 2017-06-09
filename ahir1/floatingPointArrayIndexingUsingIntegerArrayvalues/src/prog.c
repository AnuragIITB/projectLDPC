#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include <math.h>
#include <fpu.h>
#include "prog.h"


uint16_t a[ORDER] ;
float b[ORDER] ;
float c[ORDER] ;
//
//-----------------------------------------------------------------------------------------------------------



inline void floatingPointArrayIndexingUsingIntegerArrayvalues()

{
	uint16_t K ;
	uint16_t constant1 = 1 ;
	for ( K = 0 ; K < ORDER ; K++)
	{
	uint16_t temp1 = a[K]- constant1 ;
	float temp2 = b[K];
	c[K] = (float) temp1 * temp2 ;
	float output = c[K];
	write_float32("write_output_c", K );
	}	
}


void top_daemon ()
{
	uint16_t I;
	for ( I = 0 ; I < ORDER ; I++)
	{
	uint16_t read_a = read_uint16("read_input_a");
	a[I] = read_a ;
	}
	
	uint16_t J ;
	for ( J = 0 ; J < ORDER ; J++)
	{
	float read_b = read_float32("read_input_b");
	b[J] = read_b ;
	}	
	
	floatingPointArrayIndexingUsingIntegerArrayvalues() ; 
	
}

