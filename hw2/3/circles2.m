x = [200 , 232 , 200 , 248 , 200 , 264];
y = [200 , 200 , 300 , 300 , 400 , 400];
my_img = zeros (512,512);
[y1,x1] = size(my_img);
r = 16 ;
th = 0:pi/50:2*pi;
for i = 1 : length(x)
    xunit = r * cos(th) + x(i);
    yunit = r * sin(th) + y(i);
    h = patch(xunit, yunit , 'white');axis([0 x1 0 y1])
    set(gca,'Color','k')
end




