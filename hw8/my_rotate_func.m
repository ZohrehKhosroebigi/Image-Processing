function [out1,out2] = my_rotate_func(method,I,sel,input)

if(sel==1)
    % method =  3  ;
    % image_name = uigetfile();
    % I = imread(uigetfile());
    % I = imread('Mand.tiff');
    I = double(I)/255;
    I = mean(I,3);
    % [m ,  n , p] = size(I);
    % I = I(1:min(m , n ) ,1:min(m , n  ));
    figure('name','main_pic');
    imshow(I);
    % % % % % % % % % % % % % % % % % % % % % % % % % % % 
        if(method == 3)      
            index2coord = @(p,q,P,Q) [q-(Q+1)/2 (P+1)/2-p];
            coord2index = @(x,y,P,Q) [(P+1)/2-y x+(Q+1)/2];
            [P,Q] = size(I);
            T = [cos(input) -sin(input) ; sin(input) cos(input)];
            max_y = (P-1)/2;
            max_x = (Q-1)/2;
            xp_max = abs(T(1,:))*[max_x max_y]';
            yp_max = abs(T(2,:))*[max_x max_y]';
            Pp = (ceil(yp_max*2)+1);
            Qp = (ceil(xp_max*2)+1);
            Tinv = inv(T);
            % Z = zeros(Pp,Qp);
            p = zeros(Pp,Qp);
            q = zeros(Pp,Qp);
            % szpicc = size(I);
            % [x,y] = meshgrid(1:max(szpicc));
            k = 1;
            for pp=1:Pp
                for qp=1:Qp
                    xpyp = index2coord(pp,qp,Pp,Qp);
                    xy = Tinv*xpyp';
                    pq = coord2index(xy(1),xy(2),P,Q);
                    p(k) = pq(1);
                    q(k) = pq(2);
                    k = k+1;
            %         if p>=1 && p<=P && q>=1 && q<=Q 
            %             Z(pp,qp) = (I(p,q)+I(p+1,q)+I(p,q+1)+I(p+1,q+1))/4;
            %             Z(pp,qp) = interp2(I,pq(2),pq(1),'nearest');
            %         end
                end
            end
            Z =  interp2(I,q',p','cubic');
            figure('name','bicubic');
            subplot(1,2,1);
            Z(isnan(Z))=0;
            imshow(Z)
            title('implemented');
            out1 = Z;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
            J = imrotate(I,(input*180/pi),'bicubic','loose');
%           J = cast(J,'uint8');
            subplot(1,2,2);
            J(isnan(J))=0;
            imshow(J);
            title('imrotate');
            out2 = J;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %         
        elseif(method == 2)
            index2coord = @(p,q,P,Q) [q-(Q+1)/2 (P+1)/2-p];
            coord2index = @(x,y,P,Q) [(P+1)/2-y x+(Q+1)/2];
            [P,Q] = size(I);
            T = [cos(input) -sin(input) ; sin(input) cos(input)];
            max_y = (P-1)/2;
            max_x = (Q-1)/2;
            xp_max = abs(T(1,:))*[max_x max_y]';
            yp_max = abs(T(2,:))*[max_x max_y]';
            Pp = (ceil(yp_max*2)+1);
            Qp = (ceil(xp_max*2)+1);
            Tinv = inv(T);
            % Z = zeros(Pp,Qp);
            p = zeros(Pp,Qp);
            q = zeros(Pp,Qp);
            % szpicc = size(I);
            % [x,y] = meshgrid(1:max(szpicc));
            k = 1;
            for pp=1:Pp
                for qp=1:Qp
                    xpyp = index2coord(pp,qp,Pp,Qp);
                    xy = Tinv*xpyp';
                    pq = coord2index(xy(1),xy(2),P,Q);
                    p(k) = pq(1);
                    q(k) = pq(2);
                    k = k+1;
            %         if p>=1 && p<=P && q>=1 && q<=Q 
            %             Z(pp,qp) = (I(p,q)+I(p+1,q)+I(p,q+1)+I(p+1,q+1))/4;
            %         end
                end
            end
            Z =  interp2(I,q',p','linear');
            figure('name','Linear');
            subplot(1,2,1);
            Z(isnan(Z))=0;
            imshow(Z)
            title('implemented');
            out1 = Z;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
            J = imrotate(I,(input*180/pi),'bilinear','loose');
%           J = cast(J,'uint8');
            subplot(1,2,2);
            J(isnan(J))=0;
            imshow(J);
            title('imrotate');
            out2 = J;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %                 
        elseif(method == 1)
            index2coord = @(p,q,P,Q) [q-(Q+1)/2 (P+1)/2-p];
            coord2index = @(x,y,P,Q) [(P+1)/2-y x+(Q+1)/2];
            [P,Q] = size(I);
            T = [cos(input) -sin(input) ; sin(input) cos(input)];
            max_y = (P-1)/2;
            max_x = (Q-1)/2;
            xp_max = abs(T(1,:))*[max_x max_y]';
            yp_max = abs(T(2,:))*[max_x max_y]';
            Pp = (ceil(yp_max*2)+1);
            Qp = (ceil(xp_max*2)+1);
            Tinv = inv(T);
            % Z = zeros(Pp,Qp);
            p = zeros(Pp,Qp);
            q = zeros(Pp,Qp);
            % szpicc = size(I);
            % [x,y] = meshgrid(1:max(szpicc));
            k = 1;
            for pp=1:Pp
                for qp=1:Qp
                    xpyp = index2coord(pp,qp,Pp,Qp);
                    xy = Tinv*xpyp';
                    pq = coord2index(xy(1),xy(2),P,Q);
                    p(k) = pq(1);
                    q(k) = pq(2);
                    k = k+1;
            %         if p>=1 && p<=P && q>=1 && q<=Q 
            %             Z(pp,qp) = (I(p,q)+I(p+1,q)+I(p,q+1)+I(p+1,q+1))/4;
            %         end
                end
            end
            Z =  interp2(I,q',p','nearest');
            figure('name','Nearest');
            subplot(1,2,1);
            Z(isnan(Z))=0;
            imshow(Z)
            title('implemented');
            out1 = Z;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
            J = imrotate(I,(input*180/pi),'nearest','loose');
%           J = cast(J,'uint8');
            subplot(1,2,2);
            J(isnan(J))=0;
            imshow(J);
            title('imrotate');
            out2 = J;
        end
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
elseif(sel == 2)
    I = double(I)/255;
    I = mean(I,3);
    figure('name','main_pic');
    imshow(I);
    % % % % % % % % % % % % % % % % % % % % % % % % % % % 
        if(method == 3)      
            index2coord = @(p,q,P,Q) [q-(Q+1)/2 (P+1)/2-p];
            coord2index = @(x,y,P,Q) [(P+1)/2-y x+(Q+1)/2];
            [P,Q] = size(I);
            T = [input 0 ; 0 input];
            max_y = (P-1)/2;
            max_x = (Q-1)/2;
            xp_max = abs(T(1,:))*[max_x max_y]';
            yp_max = abs(T(2,:))*[max_x max_y]';
            Pp = (ceil(yp_max*2)+1);
            Qp = (ceil(xp_max*2)+1);
            Tinv = inv(T);
            % Z = zeros(Pp,Qp);
            p = zeros(Pp,Qp);
            q = zeros(Pp,Qp);
            % szpicc = size(I);
            % [x,y] = meshgrid(1:max(szpicc));
            k = 1;
            for pp=1:Pp
                for qp=1:Qp
                    xpyp = index2coord(pp,qp,Pp,Qp);
                    xy = Tinv*xpyp';
                    pq = coord2index(xy(1),xy(2),P,Q);
                    p(k) = pq(1);
                    q(k) = pq(2);
                    k = k+1;
            %         if p>=1 && p<=P && q>=1 && q<=Q 
            %             Z(pp,qp) = (I(p,q)+I(p+1,q)+I(p,q+1)+I(p+1,q+1))/4;
            %             Z(pp,qp) = interp2(I,pq(2),pq(1),'nearest');
            %         end
                end
            end
            Z =  interp2(I,q',p','cubic');
            figure('name','bicubic');
            subplot(1,2,1);
            Z(isnan(Z))=0;
            imshow(Z)
            title('implemented');
            out1 = Z;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
            J = imresize(I, input, 'bicubic');
%           J = cast(J,'uint8');
            subplot(1,2,2);
            J(isnan(J))=0;
            imshow(J);
            title('imresize');
            out2 = J;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %         
        elseif(method == 2)
            index2coord = @(p,q,P,Q) [q-(Q+1)/2 (P+1)/2-p];
            coord2index = @(x,y,P,Q) [(P+1)/2-y x+(Q+1)/2];
            [P,Q] = size(I);
            T = [input 0 ; 0 input];
            max_y = (P-1)/2;
            max_x = (Q-1)/2;
            xp_max = abs(T(1,:))*[max_x max_y]';
            yp_max = abs(T(2,:))*[max_x max_y]';
            Pp = (ceil(yp_max*2)+1);
            Qp = (ceil(xp_max*2)+1);
            Tinv = inv(T);
            % Z = zeros(Pp,Qp);
            p = zeros(Pp,Qp);
            q = zeros(Pp,Qp);
            % szpicc = size(I);
            % [x,y] = meshgrid(1:max(szpicc));
            k = 1;
            for pp=1:Pp
                for qp=1:Qp
                    xpyp = index2coord(pp,qp,Pp,Qp);
                    xy = Tinv*xpyp';
                    pq = coord2index(xy(1),xy(2),P,Q);
                    p(k) = pq(1);
                    q(k) = pq(2);
                    k = k+1;
            %         if p>=1 && p<=P && q>=1 && q<=Q 
            %             Z(pp,qp) = (I(p,q)+I(p+1,q)+I(p,q+1)+I(p+1,q+1))/4;
            %         end
                end
            end
            Z =  interp2(I,q',p','linear');
            figure('name','Linear');
            subplot(1,2,1);
            Z(isnan(Z))=0;
            imshow(Z)
            title('implemented');
            out1 = Z;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
            J = imresize(I, input, 'bilinear');
%           J = cast(J,'uint8');
            subplot(1,2,2);
            J(isnan(J))=0;
            imshow(J);
            title('imresize');
            out2 = J;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %                 
        elseif(method == 1)
            index2coord = @(p,q,P,Q) [q-(Q+1)/2 (P+1)/2-p];
            coord2index = @(x,y,P,Q) [(P+1)/2-y x+(Q+1)/2];
            [P,Q] = size(I);
            T = [input 0 ; 0 input];
            max_y = (P-1)/2;
            max_x = (Q-1)/2;
            xp_max = abs(T(1,:))*[max_x max_y]';
            yp_max = abs(T(2,:))*[max_x max_y]';
            Pp = (ceil(yp_max*2)+1);
            Qp = (ceil(xp_max*2)+1);
            Tinv = inv(T);
            % Z = zeros(Pp,Qp);
            p = zeros(Pp,Qp);
            q = zeros(Pp,Qp);
            % szpicc = size(I);
            % [x,y] = meshgrid(1:max(szpicc));
            k = 1;
            for pp=1:Pp
                for qp=1:Qp
                    xpyp = index2coord(pp,qp,Pp,Qp);
                    xy = Tinv*xpyp';
                    pq = coord2index(xy(1),xy(2),P,Q);
                    p(k) = pq(1);
                    q(k) = pq(2);
                    k = k+1;
            %         if p>=1 && p<=P && q>=1 && q<=Q 
            %             Z(pp,qp) = (I(p,q)+I(p+1,q)+I(p,q+1)+I(p+1,q+1))/4;
            %         end
                end
            end
            Z =  interp2(I,q',p','nearest');
            figure('name','Nearest');
            subplot(1,2,1);
            Z(isnan(Z))=0;
            imshow(Z)
            title('implemented');
            out1 = Z;
    % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
            J = imresize(I, input, 'nearest');
%           J = cast(J,'uint8');
            subplot(1,2,2);
            J(isnan(J))=0;
            imshow(J);
            title('imresize');
            out2 = J;
        end
end

