#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include <fpu.h>
#include "prog.h"


#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif

/*
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
*/
//
//
//-------------------------------------------------------------------------------------------------

uint16_t mem1[20,000];
uint16_t mem2[20,000];
uint16_t mem3[20,000];
uint16_t mem4[20,000];
uint16_t maxNitr = 0    ;
float   ebbyNodb = 0.0   ; 




void initInputs()
{
	int I;
	//
	// Populating mem with parity check matrix H11
	initMem(mem1) ;
	//
	// Populating mem2 with parity check matrix H12	
	initMem(mem2) ;
	//
	// Populating mem3 with parity check matrix H21	
	initMem(mem3) ;
	//
	// Populating mem4 with parity check matrix H22	
	initMem(mem4) ;
	//
	// reading maxinum number of iteration
	maxNitr = read_uint16("maxNitr_in"); 
	//
	// reading signal to noise power ration
	ebbyNodb = read_float32("ebbyNodb_in"); 
}

//
//
//--------------------------------------------------------------------

void initMem( uint16_t* mem )
{
int I;
	for(I = 0; I < 3; I++)
		mem[I] = read_uint16("matrix_in");  
		write_uint16("matrix_out",mem[I]);
	for(I = 0; I < (mem1[2]+mem1[0]) ; I++)
		{
		#ifndef SW
		__loop_pipelining_on__(256,2,0);
		#endif
		mem[I+3] = read_uint16("matrix_in");
		write_uint16("matrix_out",mem[I+3]);
		} 
}
//
//
//---------------------------------------------------------------------------

//
// reading the input parity check matrix in structure
void readMatrix( ParityCheckMatrix* pm_p , uint16_t* mem) 
{
	uint16_t nrows, ncols ;
	uint16_t ncol_ind ;

	pm_p->nrows = mem[0];
	pm_p->ncols = mem[1];
	pm_p->ncol_ind = mem[2];
	pm_p->col_ind = &(mem[3]) ;
	pm_p->row_ptr = &( mem[ (3+mem[2]) ] ) ;

	return 0;
}
//
//---------------------------------------------------------------------------------------------- 
void daemon ()
{
	initInputs() ; 
	
	ParityCheckMatrix pm11;
	ParityCheckMatrix pm12;
	ParityCheckMatrix pm21;
	ParityCheckMatrix pm22;
	//
	//	
	readMatrix( &pm11, mem1 );
	readMatrix( &pm12, mem2 );
	readMatrix( &pm21, mem3 );
	readMatrix( &pm22, mem4 );

}

