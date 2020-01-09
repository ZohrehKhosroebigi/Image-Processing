clc 
clear all

t = Tiff('Mand.tiff','r');
imageData = read(t);

figure
subplot(1,2,1);
imshow(imageData);
title('Mand.tiff siyah sefid')


Itrain = double(imread('Mand.tiff'));
% figure(2)

redChannel= zeros(512);
greenChannel = zeros(512);
blueChannel = zeros(512);

for i = 1:512
    for j = 1:512
        if((mod(i,2)== 0) && (mod(j,2)== 1 )) %satr zoj sotoon fard
            blueChannel(i,j) = Itrain (i,j);
        end
        if((mod(i,2)==1) && (mod(j,2)==0)) %satr fard sotoon zoj
            redChannel(i,j) = Itrain (i,j);
        end
        if( ((mod(i,2)== 1) && (mod(j,2)== 1 ))||((mod(i,2)== 0) && (mod(j,2)== 0)) ) %satrosotoon ya zoj ya fard
            greenChannel(i,j) = Itrain (i,j);
        end
    end
end



for i = 1:512
    for j = 1:512
        if((mod(i,2)== 0) && (mod(j,2)== 1 )) %satr zoj sotoon fard
                if ((i+2<=512) && (i-2>0) && (j+2<=512) && (j-2>0))
                     blueChannel(i-1,j) = ( blueChannel(i,j) + blueChannel(i-2,j) )/2;
                     blueChannel(i,j-1) = ( blueChannel(i,j) + blueChannel(i,j-2) )/2;
                     blueChannel(i-1,j-1) = ( blueChannel(i,j) + blueChannel(i-2,j-2) )/2;
                end
        end
    end
end

for i = 1:512
    for j = 1:512
        if((mod(i,2)== 1) && (mod(j,2)== 0 )) %satr fard sotoon zoj
                if ((i+2<=512) && (i-2>0) && (j+2<=512) && (j-2>0))
                     redChannel(i-1,j) = ( redChannel(i,j) + redChannel(i-2,j) )/2;
                     redChannel(i,j-1) = ( redChannel(i,j) + redChannel(i,j-2) )/2;
                     redChannel(i-1,j-1) = ( redChannel(i,j) + redChannel(i-2,j-2) )/2;
                end
        end
    end
end


for i = 1:512
    for j = 1:512
        if( ((mod(i,2)== 1) && (mod(j,2)== 1 ))||((mod(i,2)== 0) && (mod(j,2)== 0)) )
                if ((i+2<=512) && (i-2>0) && (j+2<=512) && (j-2>0))
                     greenChannel(i-1,j) = ( greenChannel(i,j) + greenChannel(i-2,j) )/2;
                     greenChannel(i,j-1) = ( greenChannel(i,j) + greenChannel(i,j-2) )/2;
                     greenChannel(i-1,j-1) = ( greenChannel(i,j) + greenChannel(i-2,j-2) )/2;
                end
        end
    end
end

% for i = 1:2:512
%     for j = 1:2:512
%             redChannel(i,j) = Itrain (i,j);
%     end
% end

% RGB(:, :, 1) = redChannel;
% RGB(:, :, 2) = blueChannel;
% RGB(:, :, 3) = greenChannel;
% Channel = Itrain(:, :, 4);

Itrain = uint8(cat(3,redChannel, greenChannel, blueChannel ));
subplot(1,2,2);
imagesc(Itrain); title('colorful image linear interpolation')