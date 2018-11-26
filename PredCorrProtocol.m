function [y_new] = PredCorrProtocol(t, y, f_old, f, h, tol, k)
i = 0;
i_max = 1*10^4;

order = num2str(k);
ABk = eval(['@AB' order]);
AMk = eval(['@AM' order]);

y_pred = ABk(y, f_old, h);
y_corr = ones(size(y_pred));
y_corr = y_corr * 10^5;

while abs(y_corr - y_pred) > tol
    if i < i_max
        if i > 0
            y_pred = y_corr;
        end
        f_pred = f(t+h, y_pred);
        y_corr = AMk(y, f_old, f_pred, h);
    else
        disp('No convergence')
        return
    end
    i = i+1;
end
y_new = y_corr;
end