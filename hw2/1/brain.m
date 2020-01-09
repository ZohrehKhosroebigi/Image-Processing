A = uigetfile;
S = load(A);
min_matrix = min(A(:));
max_matrix = max(A(:));
min_matrix= im2double(uint8(min_matrix));
max_matrix= im2double(uint8(max_matrix));
C= cell2mat(struct2cell(S));
I = mat2gray(C);

subplot(1,3,1),imshow(C); mt(1) = title('Black and white image');
subplot(1,3,2),imshow(I);mt(2) = title('grayscale imgage ');
subplot(1,3,3),imshow(I, [min_matrix max_matrix]);mt(3) = title('Considering changes in brightness level');
% set(mt,'Position',[300 700],'VerticalAlignment','top','Color',[1 0 0])
