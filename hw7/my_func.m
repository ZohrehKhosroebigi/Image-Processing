function [out1,out2] = my_func(method,Image)

% method =  1  ;
% I = imread('cameraman.tif');
I = Image;
% class_of_I = class(I);
szpicc = size(I);
figure('name','main_pic');
imshow(cast(I,'uint8'));
[x,y] = meshgrid(1:max(szpicc));
[xi,yi] = meshgrid(1:0.5:max(szpicc));
% % % % % % % % % % % % % % % % % % % % % % % % % % % 
    if(method == 3)      
        New_Image_interp2 = cast(interp2(x,y,double(I),xi,yi,'cubic'),'uint8');
        figure('name','bicubic');
        subplot(1,2,1);
        imshow(New_Image_interp2);
        title('interp2');
        out1 = New_Image_interp2;
% % % % % % % % % % % % % % % % % % % % % % % % % % % %    

        a = -.5;
        u = @(x) x>=0;
        Rc1 = @(x) (a+2)*abs(x).^3-(a+3)*abs(x).^2+1;
        Rc2 = @(x) a*abs(x).^3-5*a*abs(x).^2+8*a*abs(x)-4*a;
        Rc = @(x) Rc1(x).*(u(abs(x))-u(abs(x)-1))+Rc2(x).*(u(abs(x)-1)-u(abs(x)-2));

%         Im = imread('cameraman.tif');
%         Im = double(Im)/255;
        szpic = size(I);
        new_pic_cubic = zeros(2*max(szpic));

        for i= 2:0.5:(max(szpic)-1.1)
            for j= 2:0.5:max((szpic)-1.1)
                
                [n,m] = meshgrid([-1:2],[-1:2]);
                m = m+floor(i);
                n = n+floor(j);
                P = zeros(size(m));
                W = zeros(size(m));
                for k=1:numel(m)
                   P(k) = I(m(k),n(k));
                   W(k) = Rc(i-m(k))*Rc(j-n(k));
                end
                p = sum(sum(P.*W));
                xxx = (2*i)-1;
                yyy = (2*j)-1;
                new_pic_cubic(xxx,yyy)= p;

            end
        end
        new_pic_cubic = cast(new_pic_cubic,'uint8');
        subplot(1,2,2);
        imshow(new_pic_cubic);
        title('implemented');
        out2 = new_pic_cubic;
% % % % % % % % % % % % % % % % % % % % % % % % % % % %         
    elseif(method == 2)
        New_Image_interp2 = cast(interp2(x,y,double(I),xi,yi,'linear'),'uint8');
        figure('name','linear')
        subplot(1,2,1);
        imshow(New_Image_interp2);
        title('interp2');
        out1 = New_Image_interp2;
% % % % % % % % % % % % % % % % % % % % % % % % % % % %      

%      Im = imread('cameraman.tif');
        I = double(I);
        szpic = size(I);
        new_pic_linear = zeros(2*max(szpic));

                for i= 1:0.5:(max(szpic)-1)
                    for j= 1:0.5:max((szpic)-1)
                     xxx = 2*i;
                     yyy = 2*j;
%                      if ( (mod(i,1) ~= 0) && (mod(j,1) ~= 0) )
                         new_pic_linear(xxx,yyy)=(I(floor(i),floor(j))+ ...
                                                 I(floor(i)+1,floor(j))+ ...
                                                 I(floor(i),floor(j)+1)+ ...
                                                 I(floor(i)+1,floor(j)+1))/4;   
    %                    new_pic_linear(xxx,yyy)=(Im(ceil(i),ceil(j))+ ...
    %                                             Im(ceil(i)+1,ceil(j))+ ...
    %                                             Im(ceil(i),ceil(j))+ ...
    %                                             Im(ceil(i)+1,ceil(j)+1))/4; 
    %                    new_pic_linear(xxx,yyy)=(Im(round(i),round(j))+ ...
    %                                               Im(round(i)+1,round(j))+ ...
    %                                               Im(round(i),round(j))+ ...
    %                                               Im(round(i)+1,round(j)+1))/4;


%                     end
%                     if ( (mod(i,1) == 0) && (mod(j,1) ~= 0) )
%                         new_pic_linear(xxx,yyy)=(Im(round(i),round(j)))+ ...
%                                                  Im(round(i)+1,round(j))/2;  
%                         
%                     end
%                     if ( (mod(j,1) == 0) && (mod(i,1) ~= 0) )
%                         new_pic_linear(xxx,yyy)= Im(round(i),round(j))+ ...
%                                                  Im(round(i),round(j)+1)/2;  
%                         
%                     end
%                     if ( (mod(j,1) == 0) && (mod(i,1) == 0) )
%                         new_pic_linear(2*i,2*j)= Im((i),(j));
%                         
%                     end
                    end
               end
                new_pic_linear = cast(new_pic_linear,'uint8');
                subplot(1,2,2);
                imshow(new_pic_linear);
                title('implemented');
                out2 = new_pic_linear;
               
% % % % % % % % % % % % % % % % % % % % % % % % % % % %                 

    elseif(method == 1)
        New_Image_interp2 = cast(interp2(x,y,double(I),xi,yi,'nearest'),'uint8');
        figure('name','nearest');
        subplot(1,2,1);
        imshow(New_Image_interp2);
        title('interp2');
        out1 = New_Image_interp2;
% % % % % % % % % % % % % % % % % % % % % % % % % % % %    

%         Im = imread('cameraman.tif');
%         Im = double(Im);
        szpic = size(I);
        new_pic_nearest = zeros(2*max(szpic));

                for i= 1:0.5:(max(szpic)-1)
                    for j= 1:0.5:max((szpic)-1)
                     xxx = 2*i-1;
                     yyy = 2*j-1;
                     
                         new_pic_nearest(xxx+1,yyy+1) = I(floor(i),floor(j));
                         new_pic_nearest(xxx+1,yyy) = I(floor(i),floor(j));
                         new_pic_nearest(xxx,yyy+1) = I(floor(i),floor(j));
                          
                    end
                end
                new_pic_nearest = cast(new_pic_nearest,'uint8');
                subplot(1,2,2);
                imshow(new_pic_nearest);
                title('implemented');
                out2 = new_pic_nearest;
        
    end

end

