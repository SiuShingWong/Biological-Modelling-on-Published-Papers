function [x, dG0_y, dA0_y] = glycolytic_nullcline(Vin, K1, Kp, Km, first, last, tick)

x = first:tick:last;

% When d[Glucose]/dt = 0, [Glucose] = Vin / K1 * [ATP]
dG0_y = Vin ./(K1 * x);

% When d[ATP]/dt = 0, [Glucose] = Kp / 2*K1*([ATP] + Km)
dA0_y = Kp ./ (2*K1*(x + Km));

end


