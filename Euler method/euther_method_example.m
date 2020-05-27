% example equation: dx/dt = a - bx
a = 20;
b = 2;
c = 5;

dt = 0.05;
tlast = 10;

iterations = round(tlast/dt);
xall = zeros(iterations, 1);

time = dt * (0:iterations - 1)';
x = c; % initial condition
for i = 1:iterations
    xall(i) = x;
    dxdt = a - b*x; 
    x = x + dxdt*dt; % Update the next time step
end

figure
plot(time, xall)