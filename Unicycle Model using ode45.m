
clear; clc; close all;

% Control inputs
V = 1;
omega = 0.3;
tspan=0:0.01:20;

X0 = [0; 0; 0];

% Unicycle model differential equations
dXdt = @(t,X) [
    V*cos(X(3));
    V*sin(X(3));
    omega
];

% Solve using ode45
[t,X] = ode45(dXdt, [0 tspan], X0);

% Extract variables
x = X(:,1);
y = X(:,2);
theta = X(:,3);

% Plot trajectory
plot(x,y,'b','LineWidth',2);
hold on;
plot(x(1),y(1),'go','MarkerFaceColor','g');
plot(x(end),y(end),'ro','MarkerFaceColor','r');

xlabel('X position (m)');
ylabel('Y position (m)');
title('Unicycle Model Using ode45');
legend('Robot path','Start','End');
axis equal;
grid on;
