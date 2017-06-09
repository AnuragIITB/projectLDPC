#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#include "compute.h"

//----------------------------------------------------------------------------------------------------------------------


uint16_t mem1[20,000];
uint16_t mem2[20,000];
uint16_t mem3[20,000];
uint16_t mem4[20,000];
uint16_t maxNitr     ;
double   ebbyNodb    ; 


void getInputs()
{
	int I;
	//
	// Populating mem1 with parity check matrix H11
	for(I = 0; I < 3; I++)
		mem1[I] = read_uint16("half_word_constants_pipe1");  
	for(I = 0; I < mem1[2] ; I++)
		mem1[I+3] = read_uint16("half_word_constants_pipe1"); 
	for(I = 0; I < mem1[0] ; I++)
		mem1[I+3+mem1[2]] = read_uint16("half_word_constants_pipe1");		
	//
	// Populating mem2 with parity check matrix H12	
	for(I = 0; I < 3; I++)
		mem2[I] = read_uint16("half_word_constants_pipe2");  
	for(I = 0; I < mem2[2] ; I++)
		mem2[I+3] = read_uint16("half_word_constants_pipe2"); 
	for(I = 0; I < mem2[0] ; I++)
		mem2[I+3+mem2[2]] = read_uint16("half_word_constants_pipe2");
	//
	// Populating mem3 with parity check matrix H21	
	for(I = 0; I < 3; I++)
		mem3[I] = read_uint16("half_word_constants_pipe3");  
	for(I = 0; I < mem3[2] ; I++)
		mem3[I+3] = read_uint16("half_word_constants_pipe3"); 
	for(I = 0; I < mem3[0] ; I++)
		mem3[I+3+mem3[2]] = read_uint16("half_word_constants_pipe3");	
	//
	// Populating mem4 with parity check matrix H22	
	for(I = 0; I < 3; I++)
		mem4[I] = read_uint16("half_word_constants_pipe4");  
	for(I = 0; I < mem4[2] ; I++)
		mem4[I+3] = read_uint16("half_word_constants_pipe4"); 
	for(I = 0; I < mem4[0] ; I++)
		mem4[I+3+mem4[2]] = read_uint16("half_word_constants_pipe4");
	//
	// reading maxinum number of iteration
	maxNitr = read_uint16("half_word_constants_pipe5"); 
	//
	// reading signal to noise power ration
	ebbyNodb = read_uint16("half_word_constants_pipe5"); 
}


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
int minSumDecode( int max_nitr, ParityCheckMatrix* pm_p11, ParityCheckMatrix* pm_p12,\
								ParityCheckMatrix* pm_p21, ParityCheckMatrix* pm_p22,\
								double* code_block1,\
								double* code_block2,\
								double ebbyNodb)
{

	int nitr = 1;  // initializing number of iterations.


	double aPriori1[pm_p11->ncols];	// aPriori matrix
	double aPriori2[pm_p12->ncols];	// aPriori matrix

//
// initializing apriori probabiliies	
	initialize_aPriori ( pm_p11 , code_block1 , ebbyNodb , aPriori1 );
	initialize_aPriori ( pm_p12 , code_block2 , ebbyNodb , aPriori2 );
		
//
// Message initialization:
//
// message contain the soft information transferred from bit nodes towards check nodes. 
// messages are stored in row compressed from similar to parity check matrix.
// thus indexed same as parity check matrix.
	double message11[pm_p11->ncol_ind] ; 
	double message12[pm_p12->ncol_ind] ;
	double message21[pm_p21->ncol_ind] ;
	double message22[pm_p22->ncol_ind] ;
	
	
	initializeMessage ( pm_p11, aPriori1, message11 );
	initializeMessage ( pm_p12, aPriori2, message12 );
	initializeMessage ( pm_p21, aPriori1, message21 );
	initializeMessage ( pm_p22, aPriori2, message22 );
	
//
//	After initialization starting iterative decoding	:
	while ( nitr <= max_nitr )
		{
//
// 	Initializing a posteriori probabilities	:
		double aPosteriori1[pm_p11->ncols];
		double aPosteriori2[pm_p12->ncols];
		
		initialize_aPosteriori( pm_p11, aPriori1, aPosteriori1 );
		initialize_aPosteriori( pm_p12, aPriori2, aPosteriori2 );	
//
// 	Intializing the extrinsic inforamtion
		double ext_info11[pm_p11->ncol_ind];
		double ext_info12[pm_p12->ncol_ind];
		double ext_info21[pm_p21->ncol_ind];
		double ext_info22[pm_p22->ncol_ind];
		
		initializeExtrinsicInfo ( pm_p11, ext_info11 );
		initializeExtrinsicInfo ( pm_p12, ext_info12 );
		initializeExtrinsicInfo ( pm_p21, ext_info21 );
		initializeExtrinsicInfo ( pm_p22, ext_info22 );
		
		double transverse_info11_12[pm_p11->nrows];
		double transverse_info22_21[pm_p22->nrows];
		double transverse_info12_11[pm_p12->nrows];
		double transverse_info21_22[pm_p21->nrows];
		
		initializeTransverseInfo ( pm_p11 , transverse_info11_12 );
		initializeTransverseInfo ( pm_p22 , transverse_info22_21 );
		initializeTransverseInfo ( pm_p12 , transverse_info12_11 );
		initializeTransverseInfo ( pm_p21 , transverse_info21_22 );
		
//
//	Performing computation on Check nodes	:
		
		checkNodeComputeEngine( pm_p11,  message11,  ext_info11, transverse_info11_12);
		checkNodeComputeEngine( pm_p22,  message22,  ext_info22, transverse_info22_21 );
		
		
		checkNodeComputeEngine( pm_p12,  message12,  ext_info12, transverse_info12_11 );
		checkNodeComputeEngine( pm_p21,  message21,  ext_info21, transverse_info21_22 );
		
//
// Performing transverse correction	:

		transverseCorrection ( pm_p11 , transverse_info12_11 , ext_info11 , aPosteriori1) ; 
		transverseCorrection ( pm_p12 , transverse_info11_12 , ext_info12 , aPosteriori2) ; 
		transverseCorrection ( pm_p21 , transverse_info22_21 , ext_info21 , aPosteriori1) ; 
		transverseCorrection ( pm_p22 , transverse_info21_22 , ext_info22 , aPosteriori2) ; 
		
//
// Performing a posteriori calculation		: (Must done now when all extrinsic information are correct)

		//update_aPosteriori ( pm_p11 , ext_info11 , aPosteriori1);
		//update_aPosteriori ( pm_p12 , ext_info12 , aPosteriori2);
		//update_aPosteriori ( pm_p21 , ext_info21 , aPosteriori1);
		//update_aPosteriori ( pm_p22 , ext_info22 , aPosteriori2);
				
/*			for (int I = 0 ; I < pm_p11->ncols ; I++)
			{
			printf( " aPosteriori1 = %lf \n",aPosteriori1[I]);
			}
			
			for (int I = 0 ; I < pm_p12->ncols ; I++)
			{
			printf( " aPosteriori2 = %lf \n",aPosteriori2[I]);
			}
*/
//

//	Modifing the code block according to a posteriori probabilities 
//	and checking if the new block satisfies all the parity checks.
        bool is_decoded1 ;
        bool is_decoded2 ;
        
        is_decoded1 = checkIsdecoded( pm_p11, code_block1 , aPosteriori1 ) ;
        is_decoded2 = checkIsdecoded( pm_p12, code_block2 , aPosteriori2 ) ;
        
		if ((is_decoded1 == 1)&&(is_decoded2 == 1))
			{
			// decoding stops.
			break;
			}
		else 
			{
			// else we have to update information on Bit Node side.
			updateMessage( pm_p11 , ext_info11 ,aPosteriori1 , message11 );
			updateMessage( pm_p12 , ext_info12 ,aPosteriori2 , message12 );
			updateMessage( pm_p21 , ext_info21 ,aPosteriori1 , message21 );
			updateMessage( pm_p22 , ext_info22 ,aPosteriori2 , message22 );
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
void checkNodeComputeEngine ( ParityCheckMatrix* pm_p, double* message, double* ext_info, double* transverse_info)
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
				if ( CHECK_BIT_COUNT1 > 1)
				{
				//
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
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
						{
						//
						// excluding self inforamtion for calculation of extrinsic info.			
						if ( col == 0 )
							{			
							transverse_info[row] = message[ (pm_p->row_ptr[row]-1) + I] ;  // initaializing transverse info
							}
						continue;
						}
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
					if (col == 0)
						{
						//
						// modifing transverse_info for a check node
						transverse_info[row] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ] , transverse_info[row]);
						//printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
						}
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					//
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
				}
				else if ( CHECK_BIT_COUNT1 == 1)
					{
					transverse_info[row] = message[ (pm_p->row_ptr[row]-1) ] ;
					//printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
					}
				}
			else
				{
				if (CHECK_BIT_COUNT2 > 1)
				{
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
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
						{
						//
						// excluding self inforamtion for calculation of extrinsic info.			
						if ( col == 0 )
							{			
							transverse_info[row] = message[ (pm_p->row_ptr[row]-1) + I] ;  // initaializing transverse info
							}
						continue;
						}
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
					if (col == 0)
						{
						//
						// modifing transverse_info for a check node
						transverse_info[row] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ] , transverse_info[row]);
						//printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
						}
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					//
					// Modify posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
			}
			else if ( CHECK_BIT_COUNT2 == 1)
				{
				transverse_info[row] = message[ (pm_p->row_ptr[row]-1) ] ;
			   //printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
				}
			}
		}
			
}

//-------------------------------------------------------------------------------------------------------------------------

//
//
//
void transverseCorrection ( ParityCheckMatrix* pm_p, double* transverse_info , double* ext_info, double* aPosteriori)
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
				if  ( CHECK_BIT_COUNT1 > 1) 
					{
					//
					// if only more than one edge is connected then exterinsic info can be calculated
					// case is possible after partitioning
					if ( transverse_info[row] !=0 )
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ],\
																							 transverse_info[row] ) ;
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}
					else
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = ext_info[ (pm_p->row_ptr[row]-1) + col ] ; // dummy statement
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}				
					}
				else if ( CHECK_BIT_COUNT1 == 1)
					{
					ext_info[ (pm_p->row_ptr[row]-1) ] = transverse_info[row] ; 
					//printf( "ext_info( %d) = %lf \t", row  , ext_info[ (pm_p->row_ptr[row]-1)  ] ) ;
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					aPosteriori[chk_node_bit_p[0]-1 ] += ext_info[ (pm_p->row_ptr[row]-1)  ] ;
					}
				}

			else
				{
				//
				// true for last check node only
				if  ( CHECK_BIT_COUNT2 > 1) 
					{
					//
					// if only more than one edge is connected then exterinsic info can be calculated
					// case is possible after partitioning
					if ( transverse_info[row] !=0 )
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ],\
																							 transverse_info[row] ) ;
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}
					else
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = ext_info[ (pm_p->row_ptr[row]-1) + col ] ; // dummy statement
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}				
					}
				else if ( CHECK_BIT_COUNT2 == 1)
					{
					ext_info[ (pm_p->row_ptr[row]-1) ] = transverse_info[row] ; 
					//printf( "ext_info( %d) = %lf \t", row  , ext_info[ (pm_p->row_ptr[row]-1)  ] ) ;
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					aPosteriori[chk_node_bit_p[0]-1 ] += ext_info[ (pm_p->row_ptr[row]-1)  ] ;
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
// initializing apriori probabiliies
void initialize_aPriori ( ParityCheckMatrix* pm_p, double* code_block , double ebbyNodb , double* aPriori)
{
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
		// 				1  ->   1
		//
		//
		//aPriori[I] = 4*code_block[I]/(2*sigma2) ;    // for test_matrix 
		aPriori[I] = -4*code_block[I]/(2*sigma2) ;   
		//printf(" I= %d ,  aPriori[I]=  %lf \n", I , aPriori[I]);
		}
}
//--------------------------------------------------------------------------------------------------------------------

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
	double decoded_out[2*(pm_p->ncols)] ;
	int encode_in[2*(pm_p->ncols)] ;
	int inaccurate_bits = 0;
	for ( I = 0 ; I < 2*(pm_p->ncols) ; I++)
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

//
//
// transverse information is calculated by taking calculating min sum at a check node.
// thus for first bit node corrosponding to a check node ie at col = 0 
// we initialize the transverse info of check node i to the message passed from check i to col = 0
// the finally extrinsic inforamtion is applied to the self inforamtion to get transverse inforamtion for a check node

double modifyInfo (double ext_info , double self_information )
{

	int sign ;
	double magnitude ;
 
	if ( ext_info >= 0 )
		{
		if ( self_information >=0 )
		sign = +1;                              // both positive 
		else
		sign = -1;
		} 
	else
		{
		if ( self_information < 0 )
		sign = +1;										// both negative
		else
		sign = -1;
		}
				
								
		// finding minimum of the messages to update magnitude of the extrinsic information.
	if ( fabs( self_information ) > fabs( ext_info ) )
		magnitude = fabs( ext_info ) ;
	else
		magnitude = fabs( self_information ) ;

return (sign*magnitude) ;
					

}

//--------------------------------------------------------------------------------------------------------------

//
//
//
void initializeTransverseInfo ( ParityCheckMatrix* pm_p, double* transverse_info )
{
		int I;
		for ( I = 0 ; I < pm_p->nrows ; I++)
			{
			transverse_info[I] = 0;
			}
}

//------------------------------------------------------------------------------------------------------------

//
//
//
void	update_aPosteriori ( ParityCheckMatrix* pm_p, double* ext_info , double* aPosteriori )
{

	int* chk_node_bit_p;  								// pointer points first bit node corrosponding to a check
	int row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			//
			// itratating to all the check nodes
			chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
			if ( row == (pm_p->nrows-1) ) 				
				{
				//
				// true for last check node only.
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					// iterating through all the bit nodes 
					aPosteriori[ chk_node_bit_p[col]-1] +=  ext_info[ (pm_p->row_ptr[row]-1) + col ]  ; 
					}
				}
			else 
				{
				//
				// true for all check nodes except last check node.
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					// iterating through all the bit nodes 
					aPosteriori[ chk_node_bit_p[col]-1] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 
					}
				}
			}
			

}
//
//
//------------------------------------------------------------------------------------------------------------------

void Daemon(void)
{

   getInputs();
	
	ParityCheckMatrix pm11;
	ParityCheckMatrix pm12;
	ParityCheckMatrix pm21;
	ParityCheckMatrix pm22;
	
	readMatrix( &pm11 , mem1 );
	readMatrix( &pm12 , mem2 );
	readMatrix( &pm21 , mem3 );
	readMatrix( &pm22 , mem4 );
	
   
    
    
    while(1)
    {
    
		read_status1 = 	readCodeBlock ();
		if (read_status1 != 0)
			{
			printf( "\t\t\tINFO: End of decoding.\n");
			break;
			}
		block_count++;
		
	for (i = 0; i < 16; i++) {
	    block[i] = read_uint8("input_block_pipe");
	}

	encrypt();

	for (i = 0; i < 16; i++) {
	     write_uint8("output_block_pipe",block[i]);
	}
    }
}
