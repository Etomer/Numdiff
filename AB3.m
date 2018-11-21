% AB-3
function [y_new] = AB3(y, f, h)
y_new = y + h(23/12*f(3) - 4/3*f(2) + 5/12*f(1));
end
