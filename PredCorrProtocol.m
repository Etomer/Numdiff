function [y_new] = PredCorrProtocol(t, y, f_old, f, h, tol, k)
i = 0;
i_max = 1*10^5;

order = num2str(k);
ABk = eval(['@AB' order]);
AMk = eval(['@AM' order]);

y_pred = 10^5;
y_corr = ABk(y, f_old, h); % Borde vara y_corr = inf; ?
delta = tol;
while abs(y_corr - y_pred) > tol
    if i < i_max
        y_pred = y_corr;
        f_pred = f(t+h, y_pred);
        f_delta = f(t+h, y_pred + delta);
        g_y_old = AMk(y, f_old(1:end-1), f_pred, h);
        g_y_old_delta = AMk(y, f_old(1:end-1), f_delta, h);
        
        y_corr = y_pred - delta*(y_pred - g_y_old)/(g_y_old_delta - g_y_old - delta);
    else
        disp('No convergence')
        return
    end
    i = i+1;
end
y_new = y_corr;
end