function [] = my_histeq_func(Image)

% Image=imread('Mand.tiff');
figure('name','Original image & imhistesh');
subplot(1,2,1);
imshow(Image);
title('original')
subplot(1,2,2);
imhist(Image);
title('imhistesh')

figure('name','tabe matlab');
subplot(1,2,2);
imhist(histeq(Image));
title('imhistesh')
subplot(1,2,1);
imshow(histeq(Image));
title('histeq shode')

bin = 255;
% bin=double(max(max(A)));
Val=reshape(Image,[],1);
Val=double(Val);
I=hist(Val,0:bin);

Output=I/numel(Image);
CSum=cumsum(Output);
HIm=CSum(Image+1);

HIm=uint8(HIm*bin);

figure('name','equlizated khodam');
subplot(1,2,1);
imshow(HIm);
title('aks equalizated')
subplot(1,2,2);
imhist(HIm);
title('imhistesh')




end

