% Mutual inhibition example from Tyson (2003) Cuur. Op. Cell. Biol.
% E <=> EP, E -> R degradation, R -> E phosphorylation, S -> R production
% dR = k0 + k1*S - (k21 + k22*E)*R                                 ---(1)
% dE = -k2E*R*E/(E + Km2) + k1E*(Etot - E)/((Etot - E) + km1)      ---(2)

global k0; global k1; global k21;
global k22; global Km1; global Km2;
global k2E; global k1E;
global S; global Etot;

k0 = 1; k1 = 0.5; k21 = 1; k22 = 1;
Km1 = 1; Km2 = 1; k2E = 1; k1E = 1;
Etot = 1; 

SS = [2 6 12];
Y0 = [0.1, 0];

Tend = 60;

figure
hold on
for i = 1:3
    S = SS(i);
    [t, Y] = ode45('mutualinhibition', [0, Tend], Y0);
    
    plot(t, Y(:, 1))
    xlabel('Time');
    ylabel('Concentration');
end


