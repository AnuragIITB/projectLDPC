#ifndef compute_h
#define compute_h


#define COUNT_EXT_BIT      ( code_block[chk_node_bit_p[col] -1] ) 
#define CHECK_BIT          ((COUNT_EXT_BIT) & 1 )
#define BIT_VECTOR         ( code_block[bit] )
#define CHECK_BIT_COUNT1   ( pm_p->ncol_ind - ( pm_p->row_ptr[row] -1 ) )
#define CHECK_BIT_COUNT2   ( pm_p->row_ptr[row + 1] ) - ( pm_p->row_ptr[row]  )
//
// structure contain the parity check matrix 
//
typedef struct ParityCheckMatrix 
{
	uint16_t  ncols;
	uint16_t  nrows;
	uint16_t  ncol_ind;
	uint16_t  nrow_ptr;
	uint16_t* col_ind;
	uint16_t* row_ptr;
} ParityCheckMatrix ;

//
// reads the  parity check matrix
//
int readMatrix (char* matrix_file_name, ParityCheckMatrix* pm_p);

//
//
//
int readCodeBlock ( ParityCheckMatrix* pm_p , FILE* in_code , uint16_t* code_block);
//
// decode the code block by bit flipping decoding algrithm
//
int decode ( int max_number_of_iteration , ParityCheckMatrix* pm_p , uint16_t* code_block);

//
//
//
int findAccuracy( ParityCheckMatrix* pm );

#endif
