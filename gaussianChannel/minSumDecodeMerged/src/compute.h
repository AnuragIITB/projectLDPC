#ifndef compute_h
#define compute_h

#define CHECK_BIT_COUNT1   ( pm_p->ncol_ind - ( pm_p->row_ptr[row] -1 ) )
#define CHECK_BIT_COUNT2   ( pm_p->row_ptr[row + 1] ) - ( pm_p->row_ptr[row]  )


//
// structure contain the parity check matrix 
//
typedef struct ParityCheckMatrix 
{
	int  nrows;				// range 32k
	int  ncols;				// range 32k -- maximus order of input matrix
	unsigned  ncol_ind;		// range 64k
	int* col_ind;
	int* row_ptr;
} ParityCheckMatrix ;

//
// reads the  parity check matrix
//
int readMatrix (char* matrix_file_name, ParityCheckMatrix* pm_p);

//
// 	reads the code block 
//
int readCodeBlock ( ParityCheckMatrix* pm_p , FILE* in_code , double* code_block);

//
// decode the code block by min sum decode algrithm
//
int minSumDecode ( int max_number_of_iteration , ParityCheckMatrix* pm_p , double* code_block, double EbbyNo );

//
//	check the number of decoding errors.
//
int findAccuracy( ParityCheckMatrix* pm );

//
//	demodulate block after decoding. 
//	encoding scheme -		0 - -1
//							1 - +1
//
void bpskdemodulation( int nbits , double* code_block);

#endif
