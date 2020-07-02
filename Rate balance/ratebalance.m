% Rate balance plot
% 1) Linear system without feedback, forward rate depends on substrate [S]
% A <=> As
% Rate = k1*S*(Atot - As) - k2*As
% Parameters we are looking at
close all
clear all

Astar = 0:0.001:1;
S = 0.5:0.5:20;
kplus = 2;
kminus = 5;

BR = kminus*Astar;

figure
hold on
plot(Astar, BR, 'r', 'LineWidth', 2)
set(gca, 'TickDir', 'Out') % gca get current access, set the tick outwards

for i = 1:length(S)
    FR = kplus*S(i)*(1-Astar);
    [mindummy, dex] = min(abs(FR - BR)); % dex is index of the minimum
    A_ss(i) = Astar(dex);
    plot(Astar, FR, 'b', 'LineWidth', 2)
end
axis([0 1 0 max(FR)])
xlabel('Astar')
ylabel('Rate')

figure
plot(S, A_ss, 'bo-', 'LineWidth', 2)
set(gca, 'TickDir', 'Out')
xlabel('Stimulus')
ylabel('Astar')

% 2) Ultrasensitive feedback, variable [S]
%
%
close all
clear all

Astar = 0:0.01:1;
S = 0:0.02:0.5;
kplus = 2;
kfs = 30;
Kmf = 0.5;
kminus = 5;
h = 16; % exponent

BR = kplus * Astar;

figure
handle1 = gcf;
hold on
plot(Astar, BR, 'r', 'LineWidth', 2)
set(gca, 'TickDir', 'Out')

figure
handle2 = gcf; % gcf = get current figure, 
hold on

for i = 1:length(S)
    FR = (kplus*S(i) +kfs*(Astar.^h./(Astar.^h+Kmf^h))).*(1-Astar);
    figure(handle1)
    plot(Astar, FR, 'b', 'LineWidth', 2)
    
    crossings = [];
    difference = FR - BR;
    
    for iii = 2:length(FR)
        if (sign(difference(iii)) ~= sign(difference(iii-1))) % Whenever the current sign is different from previous sign
            crossings = [crossings, iii]; % I think it is basically the same as the python append function
        end
    end
    figure(handle2)
    plot(S(i), Astar(crossings), 'bo-')
    
end

figure(handle1)
axis([0 1 0 max(FR)])
set(gca, 'TickDir', 'Out')
xlabel('Astar')
ylabel('Rate')

figure(handle2)
set(gca, 'TickDir', 'Out')
xlabel('Stimulus')
ylabel('Astar')