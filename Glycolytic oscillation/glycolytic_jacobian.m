function [J, e] = glycolytic_jacobian(Vin, K1, Kp, Km)

G = (Kp - 2*Vin) / (2*K1*Km);
A = 2*Km*Vin / (Kp - 2*Vin);

J = [2*K1*G - Kp*Km/(A + Km)^2, 2*K1*A; -K1*G, -K1*A];

e = eig(J);

end

