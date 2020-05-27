function [Gall, Aall] =  glycolytic_model(Vin, K1, Kp, Km, dt, tlast, G0, A0)

iterations = round(tlast/dt);
Gall = zeros(iterations, 1);
Aall = zeros(iterations, 1);

g = G0;
a = A0;

for i = 1:iterations
    Gall(i) = g;
    Aall(i) = a;
    
    dGdt = Vin - K1*g*a;
    dAdt = 2*K1*g*a - Kp * a / (a + Km);
    
    g = g + dGdt * dt;
    a = a + dAdt * dt;
end

end

