clearvars
tol = 10^-10;
h = 0.001;
f = @(t, y) [y(2,1); -9.82*sin(y(1,1))];
% f = @(t, y) -sin(y);
t_0 = 0;
y_0 = [pi/2; 0];
t_end = 2*pi;
steps = t_end/h;


% Create time and functionvalue vectors
t = [t_0 : h : t_end; t_0 : h : t_end];
y = zeros(length(y_0), length(t));
f_old = zeros(length(y_0), length(t));
error = zeros(size(y));
% Initial values
y(:,1) = y_0;
f_old(:,1) = f(t(:,1),y(:,1));
[y(:,2), error(:,2)] = PredCorrProtocol(t(:,1), y(:,1), f_old(:,1), f, h, tol, 1);
f_old(:,2) = f(t(:,2),y(:,2));
[y(:,3), error(:,3)] = PredCorrProtocol(t(:,2), y(:,2), f_old(:,1:2), f, h, tol, 2);
f_old(:,3) = f(t(:,3),y(:,3));

for i = 4:(steps + 1)
[y(:,i), error(:,i)] = PredCorrProtocol(t(:,i-1), y(:,i-1), f_old(:,(i-3):(i-1)), f, h, tol, 3);
f_old(:,i) = f(t(:,i),y(:,i));
end

figure
hold on
error(1,2) = 0;
for i = 1:1
    
    fill_y = [y(i,:) + 1e10*error(i,:), fliplr(y(i,:) - 1e10*error(i,:))];
    fill_t = [t, fliplr(t)];
    fill(fill_t,fill_y, [0,1,1]);
    plot(t(i,:), y(i,:),'k', 'Linewidth', 2)
end
% plot(t(1,:), exp(-t), 'color', 'r')
% plot(t(1,:), exp(-2*t), 'color', 'g')