% Mutual inhibition example from Tyson (2003) Cuur. Op. Cell. Biol.
% E <=> EP, E -> R degradation, R -> E phosphorylation, S -> R production
% dR = k0 + k1*S - (k21 + k22*E)*R                                 ---(1)
% dE = -k2E*R*E/(E + Km2) + k1E*(Etot - E)/((Etot - E) + km1)      ---(2)

global k0; global k1; global k21;
global k22; global Km1; global Km2;
global k2E; global k1E;
global S; global Etot;

k0 = 0; k1 = 0.05; k21 = 0.1; k22 = 0.5;
Km1 = 0.05; Km2 = 0.05; k2E = 0.2; k1E = 1;
Etot = 1; S = 100;

% % R: xx, E: yy
% [xx, yy] = meshgrid(0:0.1:3, 0:0.25:6);
% 
% dR = k0 + k1*S - (k21 + k22.*yy).*xx;
% dE = -k2E*xx.*yy./(yy + Km2) + k1E*(Etot - yy)./((Etot - yy) + Km1);
% 
% L = sqrt(dR.^2 + dE.^2);
% 
% quiver(xx, yy, dR./L, dE./L, 0.5);

dR = @(E, R) k0 + k1*S - (k21 + k22*E)*R;
dE = @(E, R) -k2E*R*E/(E + Km2) + k1E*(Etot - E)/((Etot - E) + Km1);

figure
hold on

ez1 = ezplot(@(E, R) dR(E, R), [0 1 0 25]);
ez2 = ezplot(@(E, R) dE(E, R), [0 1 0 25]);
legend('dR=0', 'dE=0');
set(ez2, 'color', 'r');


