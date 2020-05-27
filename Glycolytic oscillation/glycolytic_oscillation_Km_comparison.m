% Recapitulate yeast glycolytic oscillation model
% Bier et al. (Biophys. J. 78:1087-1093, 2000)
% Plot the effects of Km on the oscillation of glucose and ATP

% Initial parameters
Vin = 0.36;
K1 = 0.02;
Kp = 6;
Kms = 5:5:30; % An array of different Km

dt = 0.05;
tlast = 1000;

iterations = round(tlast/dt);
time = dt * (0:iterations - 1)';

G0 = 0.01;
A0 = 0.03;

colors = repmat('krgbmc', 1, 300);

% For plotting different glucose vs ATP on different Kms
figure
hold on

for i = 1:length(Kms)
    Km = Kms(i);
    [Gall, Aall] =  glycolytic_model(Vin, K1, Kp, Km, dt, tlast, G0, A0);
    plot(Gall, Aall, colors(i));
    figurelegend{i} = ['Km = ', int2str(Km), ' uM'];
end

xlabel('[Glucose] (uM)')
ylabel('[ATP] (uM)')
legend(figurelegend, 'Location', 'SouthEast')