clc
clear all
close all


load('Xray');
% load('T1W');
% I = imread('cameraman.tif');
I = A;
figure('name','tasvir bi noise o noisy ');
subplot(1,2,1);
title('asl aks');
imshow(I);
I = double(I) / 255;
variance = var(I(:));
PSNR = 15;
V = sqrt((max(max(I)))^2 * 10.^((-0.1).*PSNR));
% V = sqrt(10^((-0.1)*PSNR));
J = imnoise(I, 'gaussian', 0, V );
subplot(1,2,2);
title('aks noisy');
imshow(J);

[M,N] = size(I);
If = fft2(I,M,N);
If = fftshift(If);
figure('name','tasvir asli o noisy dar F');
subplot(1,2,1);
imshow(abs(If),[0 0.009*max(abs(If(:)))]);
title('tasvir asli dar F');

[M,N] = size(J);
Jf = fft2(J,M,N);
Jf = fftshift(Jf);
subplot(1,2,2);
imshow(abs(Jf),[0 0.009*max(abs(Jf(:)))]);
title('tasvir noisy dar F');

fH = repmat((0:N-1)/N,M,1);
fH = fftshift(fH);
fH(fH>=0.5) = fH(fH>=0.5)-1;
fV = fftshift(repmat((0:M-1)'/M,1,N));
fV(fV>=0.5) = fV(fV>=0.5)-1;
f = fH+1i*fV;

figure('name','filterHa');
subplot(1,3,1)
imshow(abs(fV),[0 max(abs(fV(:)))])
subplot(1,3,2)
imshow(abs(fH),[0 max(abs(fH(:)))])
subplot(1,3,3)
imshow(abs(f),[0 max(abs(f(:)))])

max_num_th = 1000;
psnr_out_ths = zeros(1,max_num_th);
kk = zeros(1,max_num_th);
for k = max_num_th:-1:1
    kk(k) = k;
    th = k/max_num_th;
    Jf(abs(f)> th) = 0;
    Jff= Jf;
    Jff = fftshift(Jff);
    J = real(ifft2(Jff));
    psnr_out_ths(k) = psnr(I,J);
end
figure;
plot(kk,psnr_out_ths);

% th1 = 0.03 ;
% Jf(abs(f)> th1) = 0;

% figure('name','bad az TH');
% subplot(1,2,1);
% imshow(abs(Jf),[0 0.5*max(abs(Jf(:)))]);
% title('tasvir denoise dar F');

% Jf = fftshift(Jf);
% J = real(ifft2(Jf));

% subplot(1,2,2);
% imshow(J);
% title('tasvir denoise dar T');