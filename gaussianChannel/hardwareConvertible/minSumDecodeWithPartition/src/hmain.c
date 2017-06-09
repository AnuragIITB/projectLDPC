#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include<stdbool.h>

#include "compute.h"


int main(int argc, char* argv[])
{
/*	  if( argc< 5)
		{
		fprintf(stderr, "ERROR: not sufficient arguments \n");
		return(-1);
		}
*/  
	  ParityCheckMatrix pm11;
	  ParityCheckMatrix pm12;
	  ParityCheckMatrix pm21;
	  ParityCheckMatrix pm22;
	  FILE* matrix_file ;
      matrix_file = fopen (argv[1], "r");
      int read_status ;
	  //
	  // reading parity check matrices pm11
	  read_status = readMatrix(matrix_file, &pm11);
	  if ( read_status !=0 )
		{
		fprintf(stderr, "ERROR: file read fail %s\n", argv[1]);
		return(-1);
		}
	  // reading parity check matrix pm12	
	  read_status = readMatrix(matrix_file, &pm12);
	  if ( read_status !=0 )
		{
		fprintf(stderr, "ERROR: file read fail %s\n", argv[1]);
		return(-1);
		}
	  // reading parity check matrix pm21	
	  read_status = readMatrix(matrix_file, &pm21);
	  if ( read_status !=0 )
		{
		fprintf(stderr, "ERROR: file read fail %s\n", argv[1]);
		return(-1);
		}
	  // reading parity check matrix pm22	
	  read_status = readMatrix(matrix_file, &pm22);
	  if ( read_status !=0 )
		{
		fprintf(stderr, "ERROR: file read fail %s\n", argv[1]);
		return(-1);
		}	
		
	  fclose(matrix_file);					
	
// test_matrix block
/*	int i,j ;
	printf(" pm11.nrow = %d\n", pm11.nrows );
	printf(" pm11.ncol = %d\n", pm11.ncols );
	printf(" pm11.ncol_ind = %d\n", pm11.ncol_ind );
	for (i=0 ; i < pm11.ncol_ind ; i++)
		{
		printf("pm11.col_ind[%d] = %d\n", i, pm11.col_ind[i]);
		}
	for (i=0 ; i < pm11.nrows ; i++)
		{
		printf("pm11.row_ptr[%d] = %d\n", i, pm11.row_ptr[i]);
		}
*/	
/*		int i,j ;
	printf(" pm22.nrow = %d\n", pm22.nrows );
	printf(" pm22.ncol = %d\n", pm22.ncols );
	printf(" pm22.ncol_ind = %d\n", pm22.ncol_ind );
	for (i=0 ; i < pm22.ncol_ind ; i++)
		{
		printf("pm22.col_ind[%d] = %d\n", i, pm22.col_ind[i]);
		}
	for (i=0 ; i < pm22.nrows ; i++)
		{
		printf("pm22.row_ptr[%d] = %d\n", i, pm22.row_ptr[i]);
		}
*/
/*	int i,j ;
	printf(" pm12.nrow = %d\n", pm12.nrows );
	printf(" pm12.ncol = %d\n", pm12.ncols );
	printf(" pm12.ncol_ind = %d\n", pm12.ncol_ind );
	for (i=0 ; i < pm12.ncol_ind ; i++)
		{
		printf("pm12.col_ind[%d] = %d\n", i, pm12.col_ind[i]);
		}
	for (i=0 ; i < pm12.nrows ; i++)
		{
		printf("pm12.row_ptr[%d] = %d\n", i, pm12.row_ptr[i]);
		}
*/
/*
	int i,j ;
	printf(" pm21.nrow = %d\n", pm21.nrows );
	printf(" pm21.ncol = %d\n", pm21.ncols );
	printf(" pm21.ncol_ind = %d\n", pm21.ncol_ind );
	for (i=0 ; i < pm21.ncol_ind ; i++)
		{
		printf("pm21.col_ind[%d] = %d\n", i, pm21.col_ind[i]);
		}
	for (i=0 ; i < pm21.nrows ; i++)
		{
		printf("pm21.row_ptr[%d] = %d\n", i, pm21.row_ptr[i]);
		}
*/		
		
					
	int max_nitr;
	max_nitr = atoi( argv[4] );
		
	int nitr_req;
	int block_count = 0 ;
	//
	// opening code block file
	FILE *in_code;
	in_code = fopen( argv[2], "r");

	
	int total_incorrect_bits=0;
	double total_time = 0;
	int correctly_decoded_block = 0;
	int tot_itr = 0 ; 
		
	while(1)
		{
		//
		// keep reading code blocks till they get exhausted.
		double code_block1[pm11.ncols];
		double code_block2[pm12.ncols];
		int read_status1;
		int read_status2;
		//
		//	reading code block 	
		read_status1 = 	readCodeBlock ( &pm11, in_code , code_block1);
		if (read_status1 != 0)
			{
			printf( "\t\t\tINFO: End of decoding.\n");
			break;
			}
		read_status2 = 	readCodeBlock ( &pm12, in_code , code_block2);
		if (read_status2 != 0)
			{
			printf( "\t\t\tINFO: Error one partitioning code block.\n");
			break;
			}
		block_count++;
//		printf("\t\t\tBlock Count \t\t%d\n", block_count);
		
		//
		// initializing structure to get time	
		struct timespec tstart={0,0}, tend={0,0};		// using system call to get time at start of the program
		clock_gettime(CLOCK_MONOTONIC, &tstart);		
		//
		// decoding block 
		nitr_req = minSumDecode( max_nitr, & pm11, &pm12, &pm21, &pm22 ,code_block1, code_block2, atof( argv[5]) );
		clock_gettime(CLOCK_MONOTONIC, &tend);			// using system call to get time at the end of program 
		tot_itr += nitr_req ;							// increasing iteration count
//		
// BPSk demodulation
		bpskdemodulation( pm11.ncols ,  code_block1 );
		bpskdemodulation( pm12.ncols ,  code_block2 );
//
// printing output to file :
//
		FILE* decode_file;
		uint16_t j;
		decode_file = fopen ( "../include/decodedBlock/decodedOutput.txt" , "w");
		for (j = 0; j < pm11.ncols ; j++)
			{
			fprintf( decode_file , "%lf\n" , code_block1[j]);
			}
		for (j = 0; j < pm12.ncols ; j++)
			{
			fprintf( decode_file , "%lf\n" , code_block2[j]);
			}
		fclose(decode_file);
//		printf( "INFO: Output decoded code word written to ../include/decodedOutput.txt \n");
//
// argv[3]		: output
// -time 		: command line output shows time to decode the code block; termed as "time mode".
// -accuracy	: command line output shows number of incorrect bits after decoding code block; termed as "accuracy mode".
//	
		
		if ( strcmp(argv[3],"-time")==0)
			{
			//
			// performs timing analysis
			double time_taken = ((double)tend.tv_sec + 1.0e-9*tend.tv_nsec) -  
		           ((double)tstart.tv_sec + 1.0e-9*tstart.tv_nsec);
			printf("\t\t\t-----------------------------------------------------------------------------------------------------\n \
			Block Number\t %d \t Time to decode \t %.5f seconds \t iteration required \t %d \t\n  \
			------------------------------------------------------------------------------------------------------\n", block_count,
		    time_taken, nitr_req) ;
			total_time += time_taken;
			}

		if ( strcmp(argv[3],"-accuracy")==0)
			{
			//
			// performs accuracy analysis
			int incorrect_bits;
			incorrect_bits = findAccuracy( &pm11 );	
			if ( incorrect_bits == 0)
				{
				correctly_decoded_block ++;				
				}
			printf("\t\t\t----------------------------------------------------------\n \
			Block Number\t %d \t Number of incorrect bits \t %d \n  \
			----------------------------------------------------------\n",
			block_count,incorrect_bits); 
			total_incorrect_bits += incorrect_bits ;		
			}
		//
        // end of decoding of all the code blocks	
		}
		
		//
		// displaying the results in command line : 
		long double BER ;
		BER = ((long double)total_incorrect_bits/(long double)block_count)/(long double)(2*pm11.ncols) ;
			if ( strcmp(argv[3],"-time")==0)
			{
			//
			// results of timing analysis	:
			printf("\t\t\t----------------------------------------------------------------------------------\n \
			Total block count\t %d \n \
			Average time to decode \t %.5f seconds \n \
			Avg iteration per block \t %f \n  \
			-----------------------------------------------------------------------------------\n", block_count,
		        (total_time/block_count),((float)tot_itr/block_count) ) ;
			
			}

			if ( strcmp(argv[3],"-accuracy")==0)
			{
			//
			// results of accuracy analysis 	:
			printf("\t\t\t----------------------------------------------------------\n \
			Total block count\t \t \t %d \n \
			correctly decoded blocks \t \t %d \n \
			Total number of incorrect bits \t \t %d \n  \
			BER \t \t \t \t %0.9Lf \n  \
			----------------------------------------------------------\n",
			block_count, correctly_decoded_block, total_incorrect_bits, BER ); 		
			}

		
	return 0;

}





