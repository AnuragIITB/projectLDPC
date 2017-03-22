clear all;
close all;
%%% inputs: 
codeBlockLength = 10000*100;
codeWordLength  = 10000;
numberOfErrors  = 200;

%%% Change out file name according to number of errors
fid = fopen('codeBits_200.txt','wt');


encode_word = zeros(1, codeWordLength );  


for I=1 : (codeBlockLength/codeWordLength)       
        error_position = randi( [1, codeWordLength], 1, numberOfErrors );
        recieve_word = encode_word;
        for i = 1 : numberOfErrors
            recieve_word(error_position(i))=~encode_word(error_position(i));
        end     
        fprintf(fid,'%g\n',recieve_word');
end

 fclose(fid);