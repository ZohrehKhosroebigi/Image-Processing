function [primes_vector] = my_func_03(N)
primes_list=[];
    for i=1:(20*N)
      R=mod(i,[1:(20*N)]);
      C=find(R==0); 
      if length(C)<3 
         primes_list=[primes_list i]; 
      end
    end
    primes_vector = primes_list(1:N);
end




