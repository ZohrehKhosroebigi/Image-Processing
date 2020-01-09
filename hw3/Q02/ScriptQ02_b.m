clc
clear all

fileID = fopen('imgdrv.txt');
A = fread(fileID);
fclose(fileID);
Y = uint8(A);
X = vec2mat(Y,580);

figure(1);
subplot(2,3,1);
imshow(X ,'DisplayRange',[0 255]);
title('8bit');

M5 = X/8;
% figure(2);
subplot(2,3,2);
imshow(M5,'DisplayRange',[0 31]);
title('5bit');

M4 = X/16;
% figure(3);
subplot(2,3,3);
imshow(M4,'DisplayRange',[0 15]);
title('4bit');

M3 = X/32;
% figure(4);
subplot(2,3,4);
imshow(M3,'DisplayRange',[0 7]);
title('3bit');


M2 = X/64;
% figure(5);
subplot(2,3,5);
imshow(M2,'DisplayRange',[0 2]);
title('2bit');


M1 = X/128;
% figure(6);
subplot(2,3,6);
imshow(M3,'DisplayRange',[0 1]);
title('1bit');

