
function [D] = my_func (C,c)

      r = pdist2(C,c,'hamming');
      D = find(r == (min(r)));

end

