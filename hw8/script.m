clc
clear all
close all

Sel = input('1:rotate pic  (Alef) , 2:resize pic (Be) :');
if Sel == 1 %alef
    
    select = input('1:rand matrix , 2:selected pic:');
    if select == 1
        
    w = input('enter dim to generate rand matrix(like 5 , 256 , 512 ...):');
    M = input('Enter Method( 1:nearest , 2:linear , 3:bicubic ):');
    input = input('enter angle of rotate (pi/2 , 2*pi , ...):');
    I = randi(256 , w , w);
    [implemented_image,imrotated_image] = my_rotate_func(M,I,Sel,input);
    
    else
        
    I = imread('Mand.tiff');
    M = input('Enter Method( 1:nearest , 2:linear , 3:bicubic ):');
    input = input('enter angle of rotate (pi/2 , 2*pi , ...):');
    [implemented_image,imrotated_image] = my_rotate_func(M,I,Sel,input);

    end
    
else %be
    
    select = input('1:rand matrix , 2:selected pic :');
    if select == 1
        
    w = input('enter dim to generate rand matrix(like 5 , 256 , 512 ...):');
    M = input('Enter Method( 1:nearest , 2:linear , 3:bicubic ):');
    input = input('enter scale of resize(1/2 , 2 , ...):');
    I = randi(256 , w , w);
    [implemented_image,imresized_image] = my_rotate_func(M,I,Sel,input);
    
    else
        
    I = imread(uigetfile());
    M = input('Enter Method( 1:nearest , 2:linear , 3:bicubic ):');
    input = input('enter scale of resize(1/2 , 2 , ...):');
    [implemented_image,imresized_image] = my_rotate_func(M,I,Sel,input);
    
    end
end