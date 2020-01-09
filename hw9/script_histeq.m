clc
clear all
close all

Sel = input('1: Histogram equalization (Alef) , 2:T1W & Xray  (Be) :');
if Sel == 1 %alef
    
    select = input('1:rand matrix , 2:selected pic:');
    if select == 1
        
    w = input('enter dim to generate rand matrix(like 5 , 256 , 512 ...):');
    I = randi(256 , w , w);
    I = uint8(I);
    my_histeq_func(I);
    
    else
        
%     I = imread(uigetfile())1;
    I = imread('tire.tif');
    my_histeq_func(I);

    end
    
else %be
    
    select = input('1:T1W , 2:Xray :');
    if select == 1
        load('T1W');
        I = A;
        my_histeq_func(I);
    
    else
        
        load('Xray');
        I = A;
        my_histeq_func(I);
    
    end
end