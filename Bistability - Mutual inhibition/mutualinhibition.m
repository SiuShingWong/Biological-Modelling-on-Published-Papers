% Mutual inhibition example from Tyson (2003) Cuur. Op. Cell. Biol.
% 15:221-231

% E <=> EP, E -> R degradation, R -> E phosphorylation, S -> R production
% dR = k0 + k1*S - (k21 + k22*E)*R                                 ---(1)
% dE = -k2E*R*E/(E + Km2) + k1E*(Etot - E)/((Etot - E) + km1)      ---(2)

function dY = mutualinhibition(t, Y)
%
global k0; global k1; global k21;
global k22; global Km1; global Km2;
global k2E; global k1E;
global S; global Etot;

R = Y(1); E = Y(2);

dR = k0 + k1*S - (k21 + k22*E)*R;
dE = -k2E*R*E/(E + Km2) + k1E*(Etot - E)/((Etot - E) + Km1);

dY = [dR; dE];

end