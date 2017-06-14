# define MATRIX_ORDER 512
# define MATRIX_NNZ   512

#define __absf(input,output)		{\
									if (input < 0.0)\
									output = (-input);\
									else\
									output = (input);\
									}
void minSumDecode();
