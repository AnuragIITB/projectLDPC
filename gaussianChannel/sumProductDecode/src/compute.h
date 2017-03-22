#ifndef compute_h
#define compute_h

#define CHECK_BIT_COUNT1   ( pm_p->ncol_ind - ( pm_p->row_ptr[row] -1 ) )
#define CHECK_BIT_COUNT2   ( pm_p->row_ptr[row + 1] ) - ( pm_p->row_ptr[row]  )


//
// structure contain the parity check matrix 
//
typedef struct ParityCheckMatrix 
{
	int  nrows;
	int  ncols;
	unsigned  ncol_ind;
//	uint16_t  nrow_ptr;
	int* col_ind;
	int* row_ptr;
} ParityCheckMatrix ;

//
// reads the  parity check matrix
//
int readMatrix (char* matrix_file_name, ParityCheckMatrix* pm_p);

//
//
//
int readCodeBlock ( ParityCheckMatrix* pm_p , FILE* in_code , double* code_block);
//
// decode the code block by bit flipping decoding algrithm
//
int sumProductDecode ( int max_number_of_iteration , ParityCheckMatrix* pm_p , double* code_block, double EbbyNo );

//
//
//
int findAccuracy( ParityCheckMatrix* pm );

//
//
//
void bpskdemodulation( int nbits , double* code_block);

#endif
