clear all;
close all;
%%% inputs: 
codeBlockLength = 10000*10;
codeWordLength  = 10000;
ebuponNodb = 2; 
rate = 0.5 ; 
fid = fopen('codeBits_2.txt','wt');
%%%
ebuponNo = 10^(ebuponNodb/10) ;
%%% AWGN noise generation
sigma = sqrt(1/(2*rate*ebuponNo));
%%% sigma = 0.632 ;     %%% test case
mu = 0 ;
encoded_word = -1; %%% BPSK modulation
for I=1 : (codeBlockLength/codeWordLength) 
    noise = sigma*randn(1, codeWordLength ) + mu ;
    recieve_word = encoded_word + noise ; 
    fprintf(fid,'%g\n',recieve_word');
end

fclose(fid);