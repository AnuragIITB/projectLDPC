#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#include "compute.h"

//
// reading the input parity check matrix in structure
//

int readMatrix(char* matrix_file_name, ParityCheckMatrix* pm_p ) 
{
	FILE* in_file ;
        in_file = fopen (matrix_file_name, "r");

	int nrows, ncols ;
	unsigned ncol_ind ;

	int numread = fscanf(in_file,"%d\n %d\n %u\n ", &nrows, &ncols, &ncol_ind );
	if ( numread != 3)
		{
		fprintf(stderr, "ERROR: file not properly written. %s" , matrix_file_name);
		return(-1);
		}
	pm_p->nrows = nrows;
	pm_p->ncols = ncols;
	pm_p->ncol_ind = ncol_ind;

	pm_p->col_ind = malloc ( ncol_ind* sizeof( int ));
	if (pm_p->col_ind == NULL)
		{
		fprintf( stderr, "ERROR : Not enough memory.");
		return (-1);		
		}
	
	int i;
	for ( i = 0; i < ncol_ind ; i++)
		{
		numread = fscanf( in_file, "%d \n", &(pm_p->col_ind[i]));
		if (numread !=1)
			{
			fprintf(stderr, "ERROR: col_index matrix not read properly.");
			return(-1);
			}
		}
	pm_p->row_ptr = malloc ( nrows* sizeof( int));
	for ( i = 0; i < nrows ; i++)
		{
		numread = fscanf( in_file, "%d \n", &(pm_p->row_ptr[i]));
		if (numread !=1)
			{
			fprintf(stderr, "ERROR: row_ptr matrix not read properly.");
			return(-1);
			}
		}
	fclose(in_file) ;  

	return 0;
}

//
// Reading the code block 
// 
int readCodeBlock ( ParityCheckMatrix* pm_p, FILE* in_code , double* code_block)
{

	int num_read;
	int I;
	for ( I = 0 ; I < pm_p->ncols ; I++ )
		{
		num_read = fscanf( in_code , "%lf\n", &code_block[I] );
		if (num_read!=1)
			{
			fprintf(stderr, "ERROR: error reading code block.");
			fclose(in_code);
			return(-1);
			}		
		}
return 0;
}


// 
// MIn sum algorithm to decode the code block
//
int minSumDecode( int max_nitr, ParityCheckMatrix* pm_p, double* code_block, double ebbyNodb)
{

	int nitr = 1;  // initializing number of iterations.
//
// Initializing a priori probabilities
//
	double aPriori[pm_p->ncols];
	int I;
	double ebbyNo,sigma2 ;
	double rate ;
	rate = (double) ((pm_p->ncols)-(pm_p->nrows))/(pm_p->ncols);
	ebbyNo = pow(10,0.1*ebbyNodb) ; 
	sigma2 = 1/(2*rate*ebbyNo) ;
//	printf(" rate = %lf , ebbyNodb = %lf , ebbyNo = %lf , sigma2 = %lf \n", rate, ebbyNodb, ebbyNo, sigma2);
	for ( I = 0 ; I < pm_p->ncols ; I++ )
		{
		// It has a minus sign in contrast to papers.
		// Reason is :
		//
		// Here BPSK modulation :	0  ->  -1
		// 							1  ->   1
		//
		aPriori[I] = -4*code_block[I]/(2*sigma2) ;   
//		printf(" I= %d ,  aPriori[I]=  %lf \n", I , aPriori[I]);
		}
		
//
// Message initialization:
//
// message contain the soft information transferred from bit nodes towards check nodes. 
// messages are stored in row compressed from similar to parity check matrix.
// thus indexed same as parity check matrix.
//
	double message[pm_p->ncol_ind] ; 

	int* chk_node_bit_p;  
	int row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			if ( row == (pm_p->nrows-1) )
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					message [ (pm_p->row_ptr[row]-1) + col ] = aPriori[ chk_node_bit_p[col]-1] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm_p->row_ptr[row]-1) + col ]) ;
					}
				}
			else 
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					message [ (pm_p->row_ptr[row]-1) + col ] = aPriori[ chk_node_bit_p[col]-1] ;
//			printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm_p->row_ptr[row]-1) + col ]) ;
					}
				}
			}

	while ( nitr <= max_nitr )
		{

		double aPosteriori[pm_p->ncols];
		for ( I = 0 ; I < pm_p->ncols ; I++)
			{
			aPosteriori[I] = aPriori[I] ;
			}
	
//
// defining and intializing the extrinsic inforamtion
//
		double ext_info[pm_p->ncol_ind];
		for ( I = 0 ; I < pm_p->ncols ; I++)
			{
			ext_info[I] = 0;
			}
	

// variable 	: 	definition
// check_bit_p  : a pointer that points the bits related to one check node.
// ext_info     : Contains the exor of bits related to one check node.
// 
		int* chk_node_bit_p;
		int row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
// 
// iterarting through rows one by one.
// One row corrosponds to one parity check equation.
// Calculating exor_all.
 
//
// initializing the variables.
//
			chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
			
//
// calculating exor_all for a check node.
//
			if ( row == (pm_p->nrows-1) )
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					int I;
					double val ;
					int flag = 0 ; 
					bool exor = 0;
					int sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT1 ; I++)
						{
						if ( I == col)
						continue;
						else
							{
							
							// finding sign 
							if ( message[ (pm_p->row_ptr[row]-1) + I] >= 0 )
								{
								exor = exor ^ 0 ;
								} 
							else if ( message[ (pm_p->row_ptr[row]-1) + I] < 0 )
								{
								exor = exor ^ 1 ; 
								}
								
							// finding minimum of the messages
							if (flag == 0)
								{
								val = fabs(message[ (pm_p->row_ptr[row]-1) + I]);
								}
							else
								{
								if ( fabs(message[ (pm_p->row_ptr[row]-1) + I]) < val )
									{
									val = fabs(message[ (pm_p->row_ptr[row]-1) + I]) ; 
									}
								}
							} 
						flag = 1 ;
						}
					sign = (exor == 0)?1:-1;
					ext_info[ (pm_p->row_ptr[row]-1) + col ] = val * sign ;
//					printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
				}
			else
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					int I;
					double val = 1;
					int flag = 0 ; 
					bool exor = 0;
					int sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT2 ; I++)
						{
						if ( I == col)
						continue;
						else
							{
							
							// finding sign 
							if ( message[ (pm_p->row_ptr[row]-1) + I] >= 0 )
								{
								exor = exor ^ 0 ;
								} 
							else if ( message[ (pm_p->row_ptr[row]-1) + I] < 0 )
								{
								exor = exor ^ 1 ; 
								}
								
							// finding minimum of the messages
							if (flag == 0)
								{
								val = fabs(message[ (pm_p->row_ptr[row]-1) + I]);
								}
							else
								{
								if ( fabs(message[ (pm_p->row_ptr[row]-1) + I]) < val )
									{
									val = fabs(message[ (pm_p->row_ptr[row]-1) + I]) ; 
									}
								}
							} 
						flag = 1 ;
						}
					sign = (exor == 0)?1:-1;
					ext_info[ (pm_p->row_ptr[row]-1) + col ] = val * sign ; 
///					printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;	 	
					}
				}
			}
// 
// Taking decision for the bit
// 
//			for ( I = 0 ; I < pm_p->ncols ; I++)
//			{
//			printf( " aPosteriori = %lf \n",aPosteriori[I]);
//			}

//
// 
		bool is_decoded = 1;
		int bit;
		for ( bit = 0 ; bit < pm_p->ncols ; bit++)
			{
// 
// iterating through all code bits
//
			if ( aPosteriori[bit] > 0 ) 
				{
				if ( code_block[bit] > 0)
					{
					is_decoded = 0;
					}
				code_block[bit] = -1;
				}
				
			else if ( aPosteriori[bit] < 0 ) 
				{
				if ( code_block[bit] < 0)
					{
					is_decoded = 0;
					}
				code_block[bit] = 1;
				}
			}
		
		if (is_decoded == 1 )
		{
		break;
		}
		else 
			{
// else we have to update aPriori probability for the next iteration.
			for ( row = 0 ; row < (pm_p->nrows) ; row++ )
				{
				chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					if ( row == (pm_p->nrows-1) )
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
								message [ (pm_p->row_ptr[row]-1) + col ] = \
								aPosteriori[ chk_node_bit_p[col]-1] 	\
								- ext_info [(pm_p->row_ptr[row]-1) + col] ;
//				printf (" message(%d) = %lf",(pm_p->row_ptr[row]-1) + col,message [ (pm_p->row_ptr[row]-1) + col ] );
							}
						}
					else 
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
							{
							message [ (pm_p->row_ptr[row]-1) + col ] =\
							 aPosteriori[ chk_node_bit_p[col]-1] 	\
							 - ext_info [(pm_p->row_ptr[row]-1) + col] ;
//				printf (" message(%d) = %lf",(pm_p->row_ptr[row]-1) + col,message [ (pm_p->row_ptr[row]-1) + col ] );
							}
						}
				}
				
			}
										
		nitr++ ;
		}  // end while

return (nitr=nitr-1) ;
}

void bpskdemodulation ( int nbits , double* code_block)
{
	int I ; 
	for ( I = 0 ;  I < nbits ; I++ )
		{
		if (code_block[I] == -1)
		code_block[I] = 0 ;
		}
}

int findAccuracy( ParityCheckMatrix* pm_p )
{
	FILE* encoded_block;  // -- file has 100*10k zero's 
	FILE* decoded_block;
//
// code_block can't be used as it got modified.
//
	encoded_block = fopen( "../include/encodeBlock/encodeBits.txt" , "r");
	decoded_block = fopen( "../include/decodedBlock/decodedOutput.txt" , "r");

	int I;
	int numread;	
	double decoded_out[pm_p->ncols] ;
	int encode_in[pm_p->ncols] ;
	int inaccurate_bits = 0;
	for ( I = 0 ; I < pm_p->ncols ; I++)
		{
		numread = fscanf( decoded_block, "%lf\n" , &decoded_out[I] );
		if (numread!=1)
			{
			fprintf(stderr, "ERROR: in reading decodedOutput file");
			return(-1);
			}
		numread = fscanf( encoded_block , "%d\n" , &encode_in[I] );
		if (numread!=1)
			{
			fprintf(stderr, "ERROR: in reading codeBits  file while comparing");
			return(-1);
			}		
		if ( decoded_out[I] != (double)encode_in[I] )
			{
			inaccurate_bits++ ;
			}
		}
return (inaccurate_bits);	
}

