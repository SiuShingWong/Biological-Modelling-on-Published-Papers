% Recapitulate yeast glycolytic oscillation model
% Bier et al. (Biophys. J. 78:1087-1093, 2000)

% x-axis
first = 0.5;
last = 5;
tick = 0.01;

% Parameter set 1 with a unstable equilibrium
Vin = 0.36;
K1 = 0.02;
Kp = 6;
Km = 10; 

[x, dG0_y, dA0_y] = glycolytic_nullcline(Vin, K1, Kp, Km, first, last, tick); % Get nullcline
[J, e] = glycolytic_jacobian(Vin, K1, Kp, Km); % Calculate the Jacobian matrix
disp(e); % Calculate whether it is a stable equilibrium or not

figurelegend{1} = 'd[Glucose]/dt = 0';
figurelegend{2} = 'd[ATP]/dt = 0';

figure
hold on

plot(x, dG0_y, 'r')
plot(x, dA0_y, 'b')
xlabel('[Glucose] (uM)')
ylabel('[ATP] (uM)')
legend(figurelegend, 'Location', 'SouthEast')

