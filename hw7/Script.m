clc
clear all
close all

Sel = input('1:enter a matrix , 2:enter for second part of Q:');
if Sel == 1
    w = input('enter dim to generate rand matrix(like 5 , 256 , 512):');
    M = input('Enter Method( 1:nearest , 2:linear , 3:bicubic ):');
    I = randi(256 , w , w);
    [new_image,new_pic_kh] = my_func(M,I);
else
    
    M = input('Enter Method( 1:nearest , 2:linear , 3:bicubic ):');
    I = imread('cameraman.tif');
    [new_image,new_pic_kh] = my_func(M,I);

end