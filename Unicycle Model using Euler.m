clear; clc; close all;


dt = 0.01;
T = 20;
t = 0:dt:T;

% Control inputs
V = 1;          
omega = 0.3;    


x(1) = 0;
y(1) = 0;
theta(1) = 0;


for k = 1:length(t)-1

   
    x_dot = V*cos(theta(k));
    y_dot = V*sin(theta(k));
    theta_dot = omega;

    
    x(k+1) = x(k) + x_dot*dt;
    y(k+1) = y(k) + y_dot*dt;
    theta(k+1) = theta(k) + theta_dot*dt;

end


plot(x, y, 'b', 'LineWidth', 2);
hold on;
plot(x(1), y(1), 'go', 'MarkerFaceColor', 'g'); % In matlab indexing starts at 1
plot(x(end), y(end), 'ro', 'MarkerFaceColor', 'r');

xlabel('X position (m)');
ylabel('Y position (m)');
title('Unicycle Model Trajectory');
legend('Robot path', 'Start', 'End');
%axis equal;
grid on;

