#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include "prog.h"

uint16_t mem[MATRIX_NNZ];
float code_block[MATRIX_ORDER];
uint16_t maxNitr    ;
float   ebbyNo    ; 
float   rate  		;
uint16_t is_decoded ;
uint16_t Nitr_required ;
	
float aPriori[MATRIX_ORDER];	
float message[MATRIX_NNZ] ; 
float aPosteriori[MATRIX_ORDER];
float ext_info[MATRIX_NNZ];
uint16_t ncols,nrows,ncol_ind;

#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif

void initInputs()
{
	//
	// reading maxinum number of iteration
	uint16_t nitr = read_uint16("maxNitr_in");
	maxNitr = nitr ;
#ifdef SW
//	fprintf(stderr,"Info:read maxNitr = %d\n", nitr);
#endif
	//
	// reading signal to noise power ration
	float SNR = read_float32("ebbyNo_in"); 
	ebbyNo = SNR ;
#ifdef SW
//	fprintf(stderr,"Info:read SNR = %f\n", SNR);
#endif
	//
	// Populating mem with parity check matrix H11
	uint16_t I,val,range;
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem[I] = val ; 
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	nrows = mem[0];
	ncols = mem[1];
	ncol_ind = mem[2] ; 
	range = (mem[2]+mem[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
		val = read_uint16("matrix_in");
		mem[I+3] = val ;
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val);
#endif
		} 
	//
	// reading rate of code as input
	float Rate = read_float32("rate_in");
	rate = Rate ;
	//
}
//--------------------------------------------------------------------

//
//---------------------------------------------------------------------------------------

//
// reading code block to decode
void readCodeBlock ()
{
	uint8_t I;	
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
			float code_bit = read_float32("code_block_in");
#ifdef SW
//			fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
#endif
			code_block[I] = code_bit ;
			}
}
//
//---------------------------------------------------------------------------------------------- 

void initialize_aPriori ()
{
	uint16_t I;	
	for ( I = 0 ; I < ncols ; I++ )
		{
#ifndef SW
//	__loop_pipelining_on__(16,2,0);
#endif	
		float StoN = ebbyNo ;
		float R = rate ;
		float temp1 = rate * StoN  ;
		float code_bit = -4*code_block[ I ] ;
		float temp2 =  temp1 * code_bit ; 
		float val =  temp2;
		aPriori[I] = val  ;  
		}
}


void initializeMessage ()
{	
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind ; I++)
	{
#ifndef SW
//	__loop_pipelining_on__(16,2,0);
#endif
	uint16_t temp1 = mem[ 3 + I ];
	uint16_t temp2 = temp1 - 1;
	float val = aPriori[ temp2 ]; 
	message[I] = val ;	
	}
}	

void initialize_aPosteriori ( )
{	
	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
//	__loop_pipelining_on__(16,2,0);
#endif
		aPosteriori[I] = aPriori[I] ;
		}	
}


void initializeExtrinsicInfo ( )
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind ; I++)
	{
#ifndef SW
//	__loop_pipelining_on__(16,2,1);
#endif
	ext_info[I] = 0;
	}
}




void checkNodeComputeEngine ()
{

	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;	
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif		
		uint16_t CHECK_BIT_COUNT1   = ( ncol_ind - ( mem[3 + ncol_ind +row] -1 ) ) ;
        uint16_t CHECK_BIT_COUNT2   = (  mem[3 + ncol_ind +row + 1] ) - (  mem[3 + ncol_ind +row]  ) ;				
		 
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1 ;
		else 
			range = CHECK_BIT_COUNT2 ;	
				
		for ( col = 0 ; col < range ; col++)
			{
#ifndef SW	
//			__loop_pipelining_on__(16,2,1);
#endif 			
			// iterating through all the bit nodes corrosponding to a check 
			uint16_t index_2D = mem[3 + ncol_ind + row] -1 + col ;
			uint16_t I = 0 ;
			float val = 0.0;				// represents magnitude of the extrensic information.
			uint8_t flag = 0 ; 				// represents first iteration through the inner most loop.
			uint8_t exor = 0;				// represents sign of the extrinsic information.
			float sign = 0.0; 
			for ( I = 0 ; I < range ; I++)
				{
#ifndef SW
//			__loop_pipelining_on__(16,2,1);
#endif			
				uint16_t index =  mem[3 + ncol_ind + row] -1 + I  ;
				float temp1 ;
				__absf(message[index],temp1);
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
					if ( message[ index ] >= 0.0 )
						{
						exor = exor ^ 0 ;
						}
					else 
						{
						exor = exor ^ 1 ; 
						}			
								
					// finding minimum of the messages to update magnitude of the extrinsic information.
					if (flag == 0)
						{
						// 
						// true for first iteration to initialize the magnitude of the extrinsic information.
						val = temp1 ;
						}
					else
						{
						if (temp1 < val )
							{
							val = temp1 ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info[ index_2D ] = val * sign ;
			}	
		}
}
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------

void update_aPosteriori()
{
	uint16_t I ;
    for ( I = 0 ; I < ncol_ind ; I++)
	{
	uint16_t val = mem[3+I]-1 ;
	aPosteriori[val] += ext_info[I] ;
    }
}


void checkIsdecoded() 
{
		
	is_decoded = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(16,2,1);
#endif 
		if ( aPosteriori[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block[I] = 1.0;			// modifies the code bit.
			}
		}
}

void updateMessage ()
{
	uint16_t row,col;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(16,2,1);
#endif
		uint16_t range ;
		uint16_t CHECK_BIT_COUNT1   = ( ncol_ind - ( mem[3 + ncol_ind +row] -1 ) ) ;
        uint16_t CHECK_BIT_COUNT2  =  ( mem[3 + ncol_ind +row + 1] ) - (  mem[3 + ncol_ind +row]  ) ;
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1 ;
		else
			range = CHECK_BIT_COUNT2 ;
		for ( col = 0 ; col < range ; col++)
			{
#ifndef SW
//			__loop_pipelining_on__(16,2,1);
#endif
			uint16_t index_2D = mem[3 + ncol_ind + row] -1 + col ;
			uint16_t index_1D = mem [3 + index_2D] - 1 ;
			message [ index_2D ] =  aPosteriori[ index_1D ] - ext_info [ index_2D] ;
			}
		}

}


void send_output()
{	

		int J ;
/*
		for( J = 0 ; J < nrows+ncol_ind+3 ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif	
		uint16_t val = mem[J];
		write_uint16("mem_out", val);		
		} 
		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif	
		float val = code_block[J];
		write_float32("code_block_out", val);		
		} 
		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,0);
#endif	
		float val = aPriori[J];
		write_float32("aPriori_out", val);		
		} 	
		
		for( J = 0 ; J < ncol_ind ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,0);
#endif	
		float val = message[J];
		write_float32("init_message_out", val);		
		} 
		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,0);
#endif	
		float val = aPosteriori[J];
		write_float32("init_aPosteriori_out", val);		
		} 	
		
		for( J = 0 ; J < ncol_ind; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,0);
#endif	
		float val = ext_info[J];
		write_float32("init_ext_info_out", val);		
		}
		
		for( J = 0 ; J < ncol_ind; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,0);
#endif	
		float val = ext_info[J];
		write_float32("ext_info_out", val);		
		}
		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,0);
#endif	
		float val = aPosteriori[J];
		write_float32("aPosteriori_out", val);		
		} 
		
		write_uint16("decode_done", is_decoded);	
*/		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
//		__loop_pipelining_on__(16,2,1);
#endif	
		float val = code_block[J];
		write_float32("code_block_decoded", val);		
		} 
		
		write_uint16("nitr_required", Nitr_required );
}		


void minSumDecode()
{
	while(1)
	{
	initInputs() ; 
	
	readCodeBlock();

	initialize_aPriori();
	
	initializeMessage () ;
	
	uint16_t nitr = 1 ;
	
	while ( nitr < maxNitr )
		{
		initialize_aPosteriori ( ) ;
	
		initializeExtrinsicInfo ();
	
		checkNodeComputeEngine ();
	
		update_aPosteriori() ;
	
		checkIsdecoded() ;
		
		if (is_decoded==1)
			break ;
		else
			updateMessage() ;
			
		nitr++ ;
		}		
		
		Nitr_required = nitr ;
			
		send_output() ;
	}
}



