clear all;
close all;
%%% inputs: 
codeWordLength = 4096;
ebuponNodb = 5.5; 
rate = 0.75 ; 
outerloopitr = 1 ;
command = './testbench_sw include/parityCheckMatrix/randomMatrix/ParityCheckMatrix_4096_0.9.txt fileUnderTest -time 150 5';
%%%
ebuponNo = 10^(ebuponNodb/10) ;
%%% AWGN noise generation
sigma = sqrt(1/(2*rate*ebuponNo));
%%% sigma = 0.632 ;     %%% test case
mu = 0 ;
encoded_word = -1; %%% BPSK modulation

val_itr = [];
for x=1:outerloopitr
    nitr = 1 ;

while(nitr<1e6) 
    fid = fopen('fileUnderTest.txt','wt');
    noise = sigma*randn(1, codeWordLength ) + mu ;
    recieve_word = encoded_word + noise ; 
    fprintf(fid,'%g\n',recieve_word');
    fclose(fid);
    status = system(command);
    fileID = fopen('incorrectBits.txt','r');
    formatSpec = '%d';
    incorrectBits = fscanf(fileID,formatSpec);
    fclose(fileID);
    if (incorrectBits > 0) 
        val_itr(x) = nitr ;
    break;
    end
    nitr = nitr + 1 ; 
    nitr 
    outerLoop = x
    codeWordLength
    ebuponNodb 
    rate 
end
end
avg = sum(val_itr)/x ;
display(avg);
 
    fid = fopen('Result.txt','wt');
    fprintf(fid,'val_itr =\n ');
    fprintf(fid,'%g\n',val_itr'); 
    fprintf(fid,'avg = \n ' );
    fprintf(fid,'%f\n',avg );
    fclose(fid);

