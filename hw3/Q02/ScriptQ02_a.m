clc
clear all

fileID = fopen('imgdrv.txt');
A = fread(fileID);
fclose(fileID);
Y = uint8(A);
X = vec2mat(Y,580);
imshow(X);