% A = uigetfile;
% S = load(A);
S = load('s.txt');
[x1,y1] = size(S);
result = [];
j = 1;
for  i = 1:x1
    if (mod(x1,i)== 0)
        result(j)= i;
        j = j+1;
    end
end
u = length(result);
for i = 1: length(result)
    B = reshape(S,result(i),result(u))';
    u = u - 1;
    subplot(1,length(result),i),imshow(B); mt(i) = title(result(i));
end
% J = imresize(I,[numrows numcols])

