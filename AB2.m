function [y_new] = AB2(y, f, h)
    y_new = y + h.*(3/2.*f(:,end) - 1/2.*f(:,end-1));
end