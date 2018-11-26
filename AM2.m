function [y_new] = AM2(y_old, f_old, f_pred, h)
    y_new = y_old + h/2.*(f_pred + f_old(:,end));
end
