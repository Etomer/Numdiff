tol = 0.0001;
h = 0.001;
f = @(t, y) -y;
t_0 = 0;
t_end = 5;
steps = t_end/h;

% Create time and functionvalue vectors
t = t_0 : h : t_end;
y = zeros(size(t));
f_old = zeros(size(t));

% Initial values
y(1) = y_0;
f_old(1) = f(t(1),y(1));
y(2) = PredCorrProtocol(t(1), y(1), f_old(1), f, h, tol, 1);
f_old(2) = f(t(2),y(2));
y(3) = PredCorrProtocol(t(2), y(2), f_old(1:2), f, h, tol, 2);
f_old(3) = f(t(3),y(3));

for i = 4:steps + 1
y(i) = PredCorrProtocol(t(i-1), y(i-1), f_old(i-3:i-1), f, h, tol, 3);
f_old(i) = f(t(i),y(i));
end

figure
hold on
plot(t, y)
plot(t, exp(-t))