//
// may need to include other files.
// 
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include "compute.h"

int readMatrix(char* matrix_file_name, ParityCheckMatrix* pm_p ) 
{
	FILE* in_file ;
        in_file = fopen (matrix_file_name, "r");

	int nrows, ncols, ncol_ind ;

	int numread=fscanf(in_file,"%d\n %d\n %d\n ", &nrows, &ncols, &ncol_ind );
	if ( numread != 3)
		{
		fprintf(stderr, "ERROR: file not properly written. %s" , matrix_file_name);
		return(-1);
		}
	pm_p->nrows = nrows;
	pm_p->ncols = ncols;
	pm_p->ncol_ind = ncol_ind;

	pm_p->col_ind = malloc ( ncol_ind* sizeof(uint16_t));
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
	pm_p->row_ptr = malloc ( nrows* sizeof(uint16_t));
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

int readCodeBlock ( ParityCheckMatrix* pm_p, FILE* in_code , uint16_t* code_block)
{

	int num_read;
	uint16_t I;
	for ( I = 0 ; I < pm_p->ncols ; I++ )
		{
		num_read = fscanf( in_code , "%d\n", &code_block[I] );
		if (num_read!=1)
			{
			//fprintf(stderr, "ERROR: error reading code block.");
			fclose(in_code);
			return(-1);
			}		
		}
return 0;
}


int decode( int max_nitr, ParityCheckMatrix* pm_p, uint16_t* code_block)
{
	int nitr = 1;


	while ( nitr <= max_nitr )
		{
// variable 	: 	definition
// check_bit_p  : a pointer that points the bits related to one check node.
// exor_all     : Contains the exor of bits related to one check node.
// 
		uint16_t* chk_node_bit_p;
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
			bool exor_all = 0;
//
// calculating exor_all for a check node.
//
			if ( row == (pm_p->nrows-1) )
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					exor_all = exor_all ^ CHECK_BIT;
					}
				}
			else
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					exor_all = exor_all ^ CHECK_BIT;
					}
				}
// 
// exor_all for a check node has been calculated.
// if exor_all = 0 ; if parity check satisfied.
// else if  exor_all = 1; bits corrosponding to check node
// is likely to get flipped;
// Thus count should be changed 
// Updating count for code bits according to exor_all.
// 
			if ( row == (pm_p->nrows-1) )
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					if ( exor_all == 1 && CHECK_BIT == 0)
						COUNT_EXT_BIT = COUNT_EXT_BIT + 2 ;
					if ( exor_all == 1 && CHECK_BIT == 1)
						COUNT_EXT_BIT = COUNT_EXT_BIT - 2 ;
					if ( exor_all == 0 && CHECK_BIT == 0)
						COUNT_EXT_BIT = COUNT_EXT_BIT - 2 ;
					if ( exor_all == 0 && CHECK_BIT == 1)
						COUNT_EXT_BIT = COUNT_EXT_BIT + 2 ;
					}
				}
			else
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					if ( exor_all == 1 && CHECK_BIT == 0)
						COUNT_EXT_BIT = COUNT_EXT_BIT + 2 ;
					if ( exor_all == 1 && CHECK_BIT == 1)
						COUNT_EXT_BIT = COUNT_EXT_BIT - 2 ;
					if ( exor_all == 0 && CHECK_BIT == 0)
						COUNT_EXT_BIT = COUNT_EXT_BIT - 2 ;
					if ( exor_all == 0 && CHECK_BIT == 1)
						COUNT_EXT_BIT = COUNT_EXT_BIT + 2 ;					
					}
				}			
			} // end of iteration through all check nodes 

//
// After iterating through all check nodes
// we get the likelyhood of each bit to remain/get flipped in count.
// count is positive : Bit is likely to be 1.
// count is negative : Bit is likely to be 0.
// Thus updating code bit in place according to count.
// 
		bool is_decoded = 1;
		uint16_t bit;
		for ( bit = 0 ; bit < pm_p->ncols ; bit++)
			{
// 
// iterating through all code bits
//
			if (( BIT_VECTOR & 0xfffe)==0 )
				BIT_VECTOR = BIT_VECTOR ;

			else if (( BIT_VECTOR & 0x8000) == 0 )  // valid for maximum 2^15/2 count
				{
				if ( (BIT_VECTOR & 1) == 0)
					{
					is_decoded = 0;
					}
				BIT_VECTOR = 1 ;
				}
			else if (( BIT_VECTOR & 0x8000) == 0x8000 )
				{
				if ( (BIT_VECTOR & 1) == 1)
					{
					is_decoded = 0;
					}
				BIT_VECTOR = 0 ;
				}								
			}
		
		if (is_decoded == 1 )
		break;

		nitr++ ;
		}  // end while
return (nitr-1) ;
}

int findAccuracy( ParityCheckMatrix* pm_p )
{
	FILE* encoded_block;
	FILE* decoded_block;
//
// code_block can't be used as it got modified.
//
	encoded_block = fopen( "../include/encodeBlock/encodeBits.txt" , "r");
	decoded_block = fopen( "../include/decodedBlock/decodedOutput.txt" , "r");

	int I;
	int numread;	
	int decoded_out[pm_p->ncols] ;
	int encode_in[pm_p->ncols] ;
	int inaccurate_bits = 0;
	for ( I = 0 ; I < pm_p->ncols ; I++)
		{
		numread = fscanf( decoded_block, "%d\n" , &decoded_out[I] );
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
		if ( decoded_out[I] != encode_in[I] )
			{
			inaccurate_bits++ ;
			}
		}
return (inaccurate_bits);	
}

