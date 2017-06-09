

# define MATRIX_ORDER 13000
# define MATRIX_NNZ   60000

typedef struct ParityCheckMatrix 
{
	uint16_t  nrows;				// range 32k
	uint16_t  ncols;				// range 32k -- maximus order of input matrix
	uint16_t  ncol_ind;		// range 64k
	uint16_t* col_ind;
	uint16_t* row_ptr;
} ParityCheckMatrix ;



void readMatrix( ) ;

void initMem( ) ;

void initInputs(); 

void readCodeBlock ( );

//	void minSumDecode( );
								
void updateMessage ( ) ;

void initializeMessage ( );

void initialize_aPosteriori (  );

void initialize_aPriori ();

float absf(float f);

uint8_t checkIsdecoded( ) ;
 
void checkNodeComputeEngine ( );

void top_daemon () ;
