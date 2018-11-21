function [y_new] = AM1(y_old, f_old, f_pred, h)
    y_new = y_old + h*f_pred;
end

