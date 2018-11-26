% AB-3
function [y_new] = AB3(y, f, h)
    y_new = y + h.*(23/12.*f(:,end) - 4/3.*f(:,(end-1)) + 5/12.*f(:,(end-2)));
end
