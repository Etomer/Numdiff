function [y_new] = AM3(y_old, f_old, f_pred, h)
    y_new = y_old + h*(5/12.*f_pred + 2/3.*f_old(2) - 1/12.*f_old(1));
end

