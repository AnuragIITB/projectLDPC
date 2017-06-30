%------------------------------------------------------------------------------------------------
% following function save the matrix in compressed row format in a text file.
%------------------------------------------------------------------------------------------------
function [] = compressed_sparse_matrix(H,fid)

% H= [ 1 1 0 1 0 0;
%      0 1 1 0 1 0;
%      1 0 0 0 1 1;
%      0 0 1 1 0 1];

[m,n] = size(H) ;
col_ind = [] ;
row_ptr = [1] ;
prev_ptr = 1 ;
for i = 1 : m
    pos_one_in_col = find(H(i,:));
    col_ind = [ col_ind,pos_one_in_col ];
    if i < m
    updated_ptr = prev_ptr + size(pos_one_in_col,2);
    row_ptr = [row_ptr , updated_ptr];
    prev_ptr = updated_ptr;
    end
end

% fid = fopen('col_ind.txt','wt');
% fprintf(fid,'%d\n',size(col_ind,2));
% fprintf(fid,'%g\n',col_ind');
% fclose(fid);


% fid = fopen('row_ptr.txt','wt');
% fprintf(fid,'%d\n',size(row_ptr,2));
% fprintf(fid,'%g\n',row_ptr');
% fclose(fid);

%---------------------------------------------------------------------------
% writing "parityCheckMatix.txt" file
% The format is as follows :
%                   row1:   Number of rows in matrix
%                   row2:   Number of column in matrix
%                   row3:   size of column index matrix
%                   row4:   column index file...onwards 
%                   row5:   row pointer file...onwards.
%---------------------------------------------------------------------------


fprintf(fid, '%d\n', m ) ;
fprintf(fid, '%d\n', n ) ;
fprintf(fid, '%d\n', size(col_ind,2) ) ;
fprintf(fid, '%g\n', col_ind');
fprintf(fid, '%g\n', row_ptr');


 end % end function
