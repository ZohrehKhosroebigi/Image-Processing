close all
clear all 
% clc

H2 = 1/4*[1 1 ; 1 1];
H3 = 1/9*[1 1 1 ; 1 1 1 ; 1 1 1];
H4 = 1/16*[1 1 1 1 ; 1 1 1 1 ; 1 1 1 1 ; 1 1 1 1];
H5 = 1/25*[1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1];


% load('Xray');
load('T1W');
% I = imread('cameraman.tif');
I = A;
figure('name','asl aks');
imshow(I);
I = double(I) / 255;
variance = var(I(:));
J = imnoise(I, 'gaussian', 0, variance);
% J = imnoise(I, 'gaussian');
figure('name','aks noisy');
imshow(J);

%%%%%%% PSNR KHODAM
% error_diff = I - J;
% decibels = 20*log10(1/(sqrt(mean(mean(error_diff.^2)))));

PSNR = (15:1:30);
psnr_in_dbs = zeros(size(PSNR));
psnr_out2_dbs = zeros(size(PSNR));
psnr_out3_dbs = zeros(size(PSNR));
psnr_out4_dbs = zeros(size(PSNR));
psnr_out5_dbs = zeros(size(PSNR));
V = sqrt((max(max(I)))^2 * 10.^((-0.1).*PSNR));
% V = sqrt(10.^((-0.1).*PSNR));
JJ = zeros(max(size(I)), min(size(I)),max(size(PSNR)) );
JJ2 = zeros(max(size(I)), min(size(I)),max(size(PSNR)) );
JJ3 = zeros(max(size(I)), min(size(I)),max(size(PSNR)) );
JJ4 = zeros(max(size(I)), min(size(I)),max(size(PSNR)) );
JJ5 = zeros(max(size(I)), min(size(I)),max(size(PSNR)) );
for k = 1:max(size(PSNR))
    JJ(:,:,k) = imnoise(I, 'gaussian', 0, V(k) );
    psnr_in_dbs(k) = psnr(I,JJ(:,:,k));
    JJ2(:,:,k) = imfilter(JJ(:,:,k),H2);
    JJ3(:,:,k) = imfilter(JJ(:,:,k),H3);
    JJ4(:,:,k) = imfilter(JJ(:,:,k),H4);
    JJ5(:,:,k) = imfilter(JJ(:,:,k),H5);
    psnr_out2_dbs(k) = psnr(I,JJ2(:,:,k));
    psnr_out3_dbs(k) = psnr(I,JJ3(:,:,k));
    psnr_out4_dbs(k) = psnr(I,JJ4(:,:,k));
    psnr_out5_dbs(k) = psnr(I,JJ5(:,:,k));
end

J2 = imfilter(J,H2);
J3 = imfilter(J,H3);
J4 = imfilter(J,H4);
J5 = imfilter(J,H5);

psnr_in = psnr(I,J);

psnr_out2 = psnr(I,J2);
psnr_out3 = psnr(I,J3);
psnr_out4 = psnr(I,J4);
psnr_out5 = psnr(I,J5);



figure('name','J2');
subplot(1,4,1); imshow(I); subplot(1,4,2); imshow(J);
subplot(1,4,3); imshow(J2); subplot(1,4,4);
plot(psnr_in_dbs , psnr_out2_dbs); title('nemodar filter2'); 
figure('name','J3');
subplot(1,4,1); imshow(I); subplot(1,4,2); imshow(J);
subplot(1,4,3); imshow(J3); subplot(1,4,4); 
plot(psnr_in_dbs , psnr_out3_dbs); title('nemodar filter3'); 
figure('name','J4');
subplot(1,4,1); imshow(I); subplot(1,4,2); imshow(J); 
subplot(1,4,3); imshow(J4); subplot(1,4,4);
plot(psnr_in_dbs , psnr_out4_dbs); title('nemodar filter4');
figure('name','J5');
subplot(1,4,1); imshow(I); subplot(1,4,2); imshow(J);
subplot(1,4,3); imshow(J5); subplot(1,4,4); 
plot(psnr_in_dbs , psnr_out5_dbs); title('nemodar filter5');
