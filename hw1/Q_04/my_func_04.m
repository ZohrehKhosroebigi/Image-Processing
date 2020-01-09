
    

function [x] = my_func_04(n,k)
    global Row;
    global Col;
    global x;
    
    if n == 1
        x(Row,Col) = k;
        Row = Row + 1;
        return
    end
    for i = 0:k
        curr_row = Row;
        Col = Col + 1;
        my_func_04(n-1,k-i);
        Col = Col - 1;
            for j = curr_row : (Row-1)
                x(j,Col) = i
            end
    end
    return
end

