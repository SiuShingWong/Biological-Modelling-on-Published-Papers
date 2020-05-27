% Recapitulate yeast glycolytic oscillation model
% Bier et al. (Biophys. J. 78:1087-1093, 2000)

Vin = 0.36;
K1 = 0.02;
Kp = 6;
Km = 20;

dt = 0.05;
tlast = 1000;

iterations = round(tlast/dt);
time = dt * (0:iterations - 1)';


G0 = 0.01;
A0 = 0.03;

[Gall, Aall] =  glycolytic_model(Vin, K1, Kp, Km, dt, tlast, G0, A0);

figure
hold on
plot(time, Aall)
plot(time, Gall)
xlabel('Time')
ylabel('Conc (uM)')
