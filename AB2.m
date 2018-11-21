function [y_new] = AB2(y, f, h)
    y_new = y + h*(3/2*f(2) - 1/2*f(1));
end

