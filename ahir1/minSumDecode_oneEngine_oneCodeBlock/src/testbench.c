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

//--------------------------------------------------------------------------------


uint16_t ncols , nrows ;

float rate ; 

uint8_t maxNitr;

float ebbyNo  ;
float ebbyNodb ;

//
// reading the input parity check matrix in structure
void sendInputs(FILE* in_file) 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		write_float32("ebbyNo_in", ebbyNo );
		fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		
		//
		// write matrix entries from matrix pipe
		//

		uint16_t numread, val;
		uint64_t count = 0 ;
		while(1) 
		{
		
		numread = fscanf(in_file,"%d\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading matrix file \n");
			break;
			}			
			fprintf(stderr,"Info: write to pipe = %d\n",val);	
			write_uint16("matrix_in", val);			
		if (count == 0)
		nrows = val ;
		if (count == 1)
		ncols = val ;
		count++;
		} 	
			
		rate = ((float)(ncols-nrows))/(ncols); 
		write_float32("rate_in", rate );
		fprintf(stderr, "rate_in = %f \n",rate);

		uint8_t read_inputs_written = read_uint8("inputs_written");
		fprintf(stderr , "read_inputs_written = %d \n" , read_inputs_written );
}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock(FILE* in_file)
{
	float val;
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
	uint8_t read_code_block_written = read_uint8("code_block_written");
	fprintf(stderr , "read_code_blcok_written = %d \n ",read_code_block_written);
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
	
	
	matrix_file = fopen (argv[1], "r");
	maxNitr = atoi( argv[4] );
	ebbyNodb= atof( argv[5] );
	
	ebbyNo = pow(10,0.1*ebbyNodb) ;
	sendInputs(matrix_file);
	fclose(matrix_file);
	
	FILE* code_block_file ;	
	code_block_file = fopen(argv[2],"r");
	sendCodeBlock(code_block_file);
	fclose(code_block_file);
	
	//
	// read aPriori initialization
//	int II;
//	for ( II = 0 ; II < ncols ; II++)
//		{	
		float val1 = read_float32("initialize_aPriori1");
		fprintf(stderr," aPriori_out1 = %f \n ", val1);
		float val2 = read_float32("initialize_aPriori2");
		fprintf(stderr," aPriori_out2 = %f \n ", val2);

//		}		


	while(1)
	{
	
	// read aposteriori
	int P ;
	for (P = 0 ; P < ncols ; P++)
		{
		float aPosteriori = read_float32("aPosteriori_out");
		fprintf(stderr,"aPosteriori_out[%d]=%f\n", P , aPosteriori );
		}
	// read is_decoded status
	uint8_t is_decoded_tb = read_uint8("is_decoded_out");
	fprintf(stderr , "is_decoded_out = %d", is_decoded_tb);
	if(is_decoded_tb == 1)
	break;
	}
	
	uint16_t I ;
	float code_block[ncols];
	for ( I = 0 ; I < ncols ; I++ )
	{
	float val_code_block  = read_float32("code_block_out");
	code_block[I] = val_code_block;
	fprintf(stderr, "code_block[%d] = %f \n",I,code_block[I] );
	}
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon);	
#endif
    return 0;
}

