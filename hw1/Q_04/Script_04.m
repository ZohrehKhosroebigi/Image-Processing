    clear all
    clc

   
    n = input('Enter n:');
    k = input('Enter k:');
    a = nchoosek((n+k-1),(n-1));
    b = n;
    global Row;
    global Col;
    Row = 1;
    Col = 1;
    global x;
    x = zeros(a,b);
    result = my_func_04(n,k)