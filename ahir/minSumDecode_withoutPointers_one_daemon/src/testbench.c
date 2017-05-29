#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif

//------------------------------------------------------------------------------
void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

//
// reading the input parity check matrix in structure
void sendInputs(uint8_t maxNitr,float ebbyNo ) 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
#ifdef HW
		fprintf(stdout, "maxNitr = %d \n",maxNitr);
#endif
		//
		// write SNR in db
		write_float32("ebbyNo_in", ebbyNo );
#ifdef HW
		fprintf(stdout, "ebbyNo_in = %f \n",ebbyNo);
#endif
		//
		// write matrix entries from matrix pipe
		//

/*		uint16_t numread, val;
		while(1) 
		{
		numread = fscanf(in_file,"%d\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading matrix file \n");
			break;
			}			
//			fprintf(stderr,"Info: write to pipe = %d\n",val);	
			write_uint16("matrix_in", val);			

		} 	
*/
		// taking example matrix to check the correctness
		uint16_t matrix[19] = { 4,8,12,1,2,3,4,5,6,1,4,7,2,5,8,1,4,7,10} ;
		int I;
		for ( I = 0 ; I < 19 ; I++)
			{
			write_uint16("matrix_in", matrix[I]);
#ifdef HW
			fprintf(stdout ,"matrix_in[%d] = %d \n ",I, matrix[I] );	
#endif
			}
}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock()
{
/*	float val;
	while(1) 
		{
		uint16_t numread;
		numread = fscanf(in_file,"%f\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading code_block file \n");
			break;
			}			
//			fprintf(stderr,"Info: write to code_block_in pipe = %f\n",val);	
			write_float32("code_block_in", val);			
		}
*/
	float code_block[8] = {-0.8, 0.7, -0.9, 0.7, 0.5, -1.5, -2.4, -1.2} ; 
	int I;
	for ( I = 0 ; I < 8 ; I++)
	{
	write_float32("code_block_in", code_block[I]);
#ifdef HW
	fprintf(stderr,"code_block[%d] = %f \n",I, code_block[I]);
#endif	
	}	
}

#ifdef SW
DEFINE_THREAD(top_daemon)
#endif

int main(int argc,char* argv[])
{

	signal(SIGINT, Exit);
	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(top_daemon);
	PTHREAD_CREATE(top_daemon);	
#endif
	FILE* matrix_file ;
	uint8_t maxNitr;
	float ebbyNodb ;
	float ebbyNo ;
	
//	matrix_file = fopen (argv[1], "r");
	maxNitr = atoi( argv[4] );
	ebbyNodb= atof( argv[5] );
	
	ebbyNo = pow(10,0.1*ebbyNodb) ;
	sendInputs( maxNitr, ebbyNo );
//	fclose(matrix_file);
	
	FILE* code_block_file ;	
//	code_block_file = fopen(argv[2],"r");
	sendCodeBlock();
//	fclose(code_block_file);
	
	fprintf(stderr , "Here at the end!") ;
	
	uint16_t ncols = read_uint16("ncols_out");
	uint16_t I ;
	float code_block[MATRIX_ORDER];
	for ( I = 0 ; I < ncols ; I++ )
	{
	code_block[I] = read_float32("code_block_out");
#ifdef HW
	fprintf(stderr, "code_block[%d] = %f \n",I,code_block[I] );
#endif	
	}
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon);	
#endif
    return 0;
}

