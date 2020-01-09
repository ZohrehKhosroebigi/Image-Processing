clc
clear all

M=input('Enter M:');
n=input('Enter n:');
C = randi([0,1] , M , n)
c = randi([0,1] , 1 , n)

result = my_func(C,c)
 