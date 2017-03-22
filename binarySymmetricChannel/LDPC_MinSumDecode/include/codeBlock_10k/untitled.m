% channel capacity 
p=0:0.05:0.5;
c= 1+p.*log(p)/log(2) + (1-p).* log(1-p)/log(2) ;


plot(c,p)
grid on;