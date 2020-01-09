my_img = zeros (512,512);
[y1,x1] = size(my_img);
for m=1:y1
    for n=1:x1
        %calculating euclidean distance of each pixel with given values
        if sqrt( (m-200)^2 + (n-200)^2) <= 16
            my_img(m,n) = 255;
        end
        if sqrt( (m-232)^2 + (n-200)^2) <= 16
            my_img(m,n) = 255;
        end
        if sqrt( (m-200)^2 + (n-300)^2) <= 16
            my_img(m,n) = 255;
        end
        if sqrt( (m-248)^2 + (n-300)^2) <= 16
            my_img(m,n) = 255;
        end
        if sqrt( (m-200)^2 + (n-400)^2) <= 16
            my_img(m,n) = 255;
        end
        if sqrt( (m-264)^2 + (n-400)^2) <= 16
            my_img(m,n) = 255;
        end
    end
end

subplot(1,2,1),imshow (my_img);
subplot(1,2,2),imshow(flip(imrotate(my_img,270),2));