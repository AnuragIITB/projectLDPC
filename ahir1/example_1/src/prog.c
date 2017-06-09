#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include <fpu.h>
#include "prog.h"


#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif

float ping_A[ORDER], ping_B[ORDER];
float pong_A[ORDER], pong_B[ORDER];

void Stage1()
{
	int I;
	while(1)
	{

		for(I=0; I < ORDER; I++)	
		{
#ifndef SW
			__loop_pipelining_on__(63,2,1);
#endif
			float a = read_float32("a_in");
			float b = read_float32("b_in");

			ping_A[I] = a;
			ping_B[I] = b;


		}

		// signal stage 2 to start ping.
		write_uint8("stage_1_to_stage_2",0);
		// get signal that pong is free
		uint8_t pong_free = read_uint8("stage_2_to_stage_1");

		for(I=0; I < ORDER; I++)	
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif

			float a = read_float32("a_in");
			float b = read_float32("b_in");

			pong_A[I] = a;
			pong_B[I] = b;


		}

		// signal stage-2 start work.
		write_uint8("stage_1_to_stage_2",1);
		// get signal that ping is free
		uint8_t ping_free = read_uint8("stage_2_to_stage_1");
	}
}


void Stage2 ()
{
	int I;
	float C;
	while(1)
	{

		// wait for ping full.
		uint8_t ping_full = read_uint8("stage_1_to_stage_2");
		// signal that pong is free
		write_uint8("stage_2_to_stage_1", 1);

		C = 0;
		for(I=0; I < ORDER; I++)
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			C += ping_A[I]*ping_B[I];
		}	
		write_float32("c_out", C);
		

		// wait for pong full.
		uint8_t pong_full = read_uint8("stage_1_to_stage_2");
		// signal that ping is free
		write_uint8("stage_2_to_stage_1", 0);

		C = 0;
		for(I=0; I < ORDER; I++)
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			C += pong_A[I]*pong_B[I];
		}	
		write_float32("c_out", C);
	}
}

