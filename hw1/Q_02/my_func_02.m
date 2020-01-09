function [res] = my_func_02(N)
res = [];
    for i = 1:N
        remainder = mod(N,i);
        if remainder == 0
            res = [res i];
        end
    end
end

