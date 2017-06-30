#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#include <math.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif





uint32_t ncols , nrows ; 
//uint32_t ncol_ind = 12 ;

uint32_t rate_into_100 = 50 ;  

uint32_t maxNitr  ;
float ebbyNodb ;
float ebbyNo  ;

void sendInputs(FILE* in_file) 
{
		
		//
		// write matrix entries from matrix pipe
		//

		uint32_t numread, val;
		uint64_t count = 0 ;
		while(1) 
		{
		
		numread = fscanf(in_file,"%d\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading matrix file \n");
			break;
			}			
			fprintf(stderr,"Info: write to pipe [%d]= %d\n",count,val);	
			write_uint32("matrix_in", val);			
		if (count == 0)
		nrows = val ;
		if (count == 1)
		ncols = val ;
		count++;
		} 	
 
		write_uint32("rate_in", rate_into_100 );
		fprintf(stderr, "rate_in = %d \n",rate_into_100);

		// write maximum number of iterations
		write_uint32("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		
		ebbyNo = pow(10,0.1*ebbyNodb) ;
		uint32_t quant_ebbyNo = (uint32_t) (ebbyNo*10) ;
		write_uint32("ebbyNo_in", quant_ebbyNo );
		fprintf(stderr, "ebbyNo_in = %d \n",quant_ebbyNo);
}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock(FILE* in_file)
{
	float val;
	int I ;
	
	for ( I = 0 ; I < ncols ; I++)
	{
		uint16_t numread;
		numread = fscanf(in_file,"%f\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading code_block file \n");
			break;
			}	
		fprintf(stderr,"Info: write to code_block_in pipe = %f\n",val);
		uint32_t quant_cb = (uint32_t)(val*100);	
		write_uint32("code_block_in", quant_cb);
		fprintf(stderr,"Info: write to code_block_in pipe quantized = %d\n",quant_cb);			
		}
}

void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

#ifdef SW
DEFINE_THREAD(minSumDecode)
#endif
int main(int argc, char* argv[])
{
	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(minSumDecode);
	PTHREAD_CREATE(minSumDecode);
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


		int I ;
		int valf ;
			
		for( I = 0 ; I < ncols ; I++)
		{	
		uint32_t val = read_uint32("code_block_decoded");
		fprintf(stderr, "code_block_out = %d \n",val);
		}
		
		uint32_t nitr_required = read_uint32("Nitr_required");
		fprintf(stderr, "Nitr_required =  %d \n",nitr_required);	
		

		
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(minSumDecode);
	return(0);
#endif
}
