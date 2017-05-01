#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#include "compute.h"

//----------------------------------------------------------------------------------------------------------------------

//
// reading the input parity check matrix in structure
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

//---------------------------------------------------------------------------------------------------------------

//
// Reading the code block 
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


//--------------------------------------------------------------------------------------------------------- 
// Min sum algorithm to decode the code block	:
int minSumDecode( int max_nitr, ParityCheckMatrix* pm_p, double* code_block, double ebbyNodb)
{

	int nitr = 1;  // initializing number of iterations.

	double aPriori[pm_p->ncols];	// aPriori matrix
	
	int I;
	
	double ebbyNo,sigma2 ;
	
	double rate ;
//	
//	calculating rate of code	:
	rate = (double) ((pm_p->ncols)-(pm_p->nrows))/(pm_p->ncols);
	
	ebbyNo = pow(10,0.1*ebbyNodb) ; 
	
	sigma2 = 1/(2*rate*ebbyNo) ;
	
//	printf(" rate = %lf , ebbyNodb = %lf , ebbyNo = %lf , sigma2 = %lf \n", rate, ebbyNodb, ebbyNo, sigma2);
//
// 	Initializing a priori probabilities	:
	for ( I = 0 ; I < pm_p->ncols ; I++ )
		{
		// It has a minus sign in contrast to papers.
		// Reason is :
		//
		// Here BPSK modulation :	0  ->  -1
		// 							1  ->   1
		//
		//
		//aPriori[I] = 4*code_block[I]/(2*sigma2) ; 		// for test_matrix
		aPriori[I] = -4*code_block[I]/(2*sigma2) ;   
//		printf(" I= %d ,  aPriori[I]=  %lf \n", I , aPriori[I]);
		}
		
//
// Message initialization:
//
// message contain the soft information transferred from bit nodes towards check nodes. 
// messages are stored in row compressed from similar to parity check matrix.
// thus indexed same as parity check matrix.
	double message[pm_p->ncol_ind] ; 
	
	initializeMessage ( pm_p, aPriori, message );

//
//	After initialization starting iterative decoding	:
	while ( nitr <= max_nitr )
		{
//
// 	Initializing a posteriori probabilities	:
		double aPosteriori[pm_p->ncols];
		
		initialize_aPosteriori( pm_p, aPriori, aPosteriori );	
//
// 	Intializing the extrinsic inforamtion
		double ext_info[pm_p->ncol_ind];
		
		initializeExtrinsicInfo ( pm_p, ext_info );
//
//	Performing computation on Check nodes	:
		checkNodeComputeEngine( pm_p,  message,  ext_info, aPosteriori);
		
//			for ( I = 0 ; I < pm_p->ncols ; I++)
//			{
//			printf( " aPosteriori = %lf \n",aPosteriori[I]);
//			}

//
//	Modifing the code block according to a posteriori probabilities 
//	and checking if the new block satisfies all the parity checks.
        bool is_decoded ;
        is_decoded = checkIsdecoded( pm_p, code_block , aPosteriori ) ;
        
		if (is_decoded == 1 )
			{
			// decoding stops.
			break;
			}
		else 
			{
			// else we have to update information on Bit Node side.
			updateMessage( pm_p , ext_info ,aPosteriori , message );
			}	
										
		nitr++ ;
		}  // end while

return (nitr=nitr-1) ;
}

//------------------------------------------------------------------------------------------------------

// Fucnction to BPSK modulate code block 	:
		// BPSK modulation :	0  ->  -1
		// 						1  ->   1
void bpskdemodulation ( int nbits , double* code_block)
{
	int I ; 
	for ( I = 0 ;  I < nbits ; I++ )
		{
		if (code_block[I] == -1)
		code_block[I] = 0 ;
		}
}

//-------------------------------------------------------------------------------------------------------

//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a posteriori probabilities.
// return the decode status of the code block.
bool checkIsdecoded( ParityCheckMatrix* pm_p, double* code_block , double* aPosteriori ) 
{
		bool is_decoded = 1;					// is_decoded : variable indicated if block is \
												// fully decoded or require further iteration.
		int bit;
		for ( bit = 0 ; bit < pm_p->ncols ; bit++)
			{
// 
// iterating through all code bits	:
			if ( aPosteriori[bit] > 0 )    		// indicates that code bit is likely to be 0.
				{
				if ( code_block[bit] > 0)		// indicates that code bit is 1 at present.
					{
					is_decoded = 0;				// flags that a bit got flipped while decoding.
					}
				code_block[bit] = -1;			// modifies the code bit.
				}
				
			else if ( aPosteriori[bit] < 0 ) 	// indicates that code bit is likely to be 1.
				{
				if ( code_block[bit] < 0)		// indicates that code bit is 0 at present.
					{	
					is_decoded = 0;				// flags that a bit got flipped while decoding.
					}
				code_block[bit] = 1;			// modifies the code bit.
				}
			}
		return is_decoded ;						// 
}

//-------------------------------------------------------------------------------------------------------------

//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage ( ParityCheckMatrix* pm_p, double* ext_info, double* aPosteriori, double* message )
{
		int* chk_node_bit_p;					// pointer points first bit node corrosponding to a check
		int row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
				{
				//
				// iterating through all the check node.
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					if ( row == (pm_p->nrows-1) )
						{
						//
						// true for last check node only.
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							//
							//	iterating through all the bit nodes of a check node and updating message.
								message [ (pm_p->row_ptr[row]-1) + col ] =  \
								aPosteriori[ chk_node_bit_p[col]-1] - 		\
								ext_info [(pm_p->row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm_p->row_ptr[row]-1) + col,message [ (pm_p->row_ptr[row]-1) + col ] );
							}
						}
					else 
						{
						//
						// true for all the check nodes except last check node.
						for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
							{
							//
							//	iterating through all the bit nodes of a check node and updating message.
							message [ (pm_p->row_ptr[row]-1) + col ] =    \
							aPosteriori[ chk_node_bit_p[col]-1]  -  	  \
							ext_info [(pm_p->row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm_p->row_ptr[row]-1) + col,message [ (pm_p->row_ptr[row]-1) + col ] );
							}
						}
				}
}

//-----------------------------------------------------------------------------------------------------------------

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine ( ParityCheckMatrix* pm_p, double* message, double* ext_info, double* aPosteriori)
{
		int* chk_node_bit_p;						// pointer points first bit node corrosponding to a check
		int row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			//
		    // iterating through all the check node.						
			chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
			if ( row == (pm_p->nrows-1) )
				{
				//
				// true for last check node only
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					// iterating through all the bit nodes corrosponding to a check 
					int I;
					double val ;				// represents magnitude of the extrensic information.
					int flag = 0 ; 				// represents first iteration through the inner most loop.
					bool exor = 0;				// represents sign of the extrinsic information.
					int sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT1 ; I++)
						{
						//
						// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		    			// iterating through all the bit nodes corrosponding to a perticular check node.
						if ( I == col)
						//
						// skipping the self information .
						continue;
						else
							{
							//
							// finding sign of the extrinsic information 
							if ( message[ (pm_p->row_ptr[row]-1) + I] >= 0 )
								{
								exor = exor ^ 0 ;
								} 
							else if ( message[ (pm_p->row_ptr[row]-1) + I] < 0 )
								{
								exor = exor ^ 1 ; 
								}
								
							// finding minimum of the messages to update magnitude of the extrinsic information.
							if (flag == 0)
								{
								// 
								// true for first iteration to initialize the magnitude of the extrinsic information.
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
						//
						// update flag to represent that this is not the first iteration to the inner loop.	
						flag = 1 ;
						}
					//
					//	if exor = 0	: sign of extrinsic information is positive
					//  if exor = 1 : sign of extrinsic information is negative
					sign = (exor == 0)?1:-1;
					//
					//	Evaluating extrinsic information 
					ext_info[ (pm_p->row_ptr[row]-1) + col ] = val * sign ;
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					//
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
				}
			else
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					// iterating through all the bit nodes corrosponding to a check 
					int I;
					double val ;				// represents magnitude of the extrensic information.
					int flag = 0 ; 				// represents first iteration through the inner most loop.
					bool exor = 0;				// represents sign of the extrinsic information.
					int sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT2 ; I++)
						{
						//
						// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		    			// iterating through all the bit nodes corrosponding to a perticular check node.
						if ( I == col)
						//
						// skipping the self information .
						continue;
						else
							{
							//
							// finding sign of the extrinsic information 
							if ( message[ (pm_p->row_ptr[row]-1) + I] >= 0 )
								{
								exor = exor ^ 0 ;
								} 
							else if ( message[ (pm_p->row_ptr[row]-1) + I] < 0 )
								{
								exor = exor ^ 1 ; 
								}
								
							// finding minimum of the messages to update magnitude of the extrinsic information.
							if (flag == 0)
								{
								// 
								// true for first iteration to initialize the magnitude of the extrinsic information.
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
						//
						// update flag to represent that this is not the first iteration to the inner loop.	
						flag = 1 ;
						}
					//
					//	if exor = 0	: sign of extrinsic information is positive
					//  if exor = 1 : sign of extrinsic information is negative
					sign = (exor == 0)?1:-1;
					//
					//	Evaluating extrinsic information 
					ext_info[ (pm_p->row_ptr[row]-1) + col ] = val * sign ;
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					//
					// Modify posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
				}
			}
			
}

//-------------------------------------------------------------------------------------------------------------------------

//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage ( ParityCheckMatrix* pm_p, double* aPriori, double* message )
{
	int* chk_node_bit_p;  								// pointer points first bit node corrosponding to a check
	int row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			//
			// itratating to all the check nodes
			if ( row == (pm_p->nrows-1) ) 				
				{
				//
				// true for last check node only.
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					// iterating through all the bit nodes of the last check node to initialize message.
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					message [ (pm_p->row_ptr[row]-1) + col ] = aPriori[ chk_node_bit_p[col]-1] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm_p->row_ptr[row]-1) + col ]) ;
					}
				}
			else 
				{
				//
				// true for all check nodes except last check node.
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					// iterating through all the bit nodes of the last check node to initialize message.
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					message [ (pm_p->row_ptr[row]-1) + col ] = aPriori[ chk_node_bit_p[col]-1] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm_p->row_ptr[row]-1) + col ]) ;
					}
				}
			}
}			
			
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori ( ParityCheckMatrix* pm_p, double* aPriori, double* aPosteriori )
{		
int I;
for ( I = 0 ; I < pm_p->ncols ; I++)
			{
			aPosteriori[I] = aPriori[I] ;
			}
}

//----------------------------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( ParityCheckMatrix* pm_p, double* ext_info )
{
int I;
		for ( I = 0 ; I < pm_p->ncols ; I++)
			{
			ext_info[I] = 0;
			}
}

//---------------------------------------------------------------------------------------------------------------

//
// function reads to files	: encode_block_file and decoded_block_file, compare them and
// count the number of mismatch bits. 			
int findAccuracy( ParityCheckMatrix* pm_p )
{
	FILE* encoded_block;  // -- file has 100*10k zero's 
	FILE* decoded_block;
//
// code_block can't be used as it got modified.
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

//--------------------------------------------------------------------------------------------------------------

