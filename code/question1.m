display('Question 1');

R1 = 1;
Cap = 0.25;
R2 =  2;
L = 0.2;
R3 = 10;
alpha = 100;
R4 = 0.1;
RO = 1000;
Cn = 0;

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, Cn);
F = generateF(1,0,1);


%%%%% DC Sweep %%%%%
fig_dc = figure;
hold on;
V1 = [];
V5 = [];
for Vin=-10:0.1:10
    F = generateF(Vin, 0,1);
    % Solve for DC
    e = G\F;
    V1 = [V1 e(1)];
    V5 = [V5 e(5)];
end
title('DC Sweep');
xlabel('Vin (V)');
ylabel('Node Voltage (V)');
plot(-10:0.1:10, V1);
plot(-10:0.1:10, V5);
legend('V1', 'VO');

%%%%% AC Sweep %%%%%
fig_ac = figure;
V5 = [];
F = generateF(1, 0,1); % Set DC voltage
for w=1E0:1:1E4
    e = (G+2*pi*w*1j*C)\F;
    V5 = [V5 20*log10(abs(e(5)/F(8)))];
end
semilogx(1E0:1:1E4, V5);
hold on;
title('AC Sweep');
xlabel('f (Hz)');
ylabel('Gain (dB)');
    
%%%%% Cap Sweep %%%%%
fig_cap = figure;
hold on;
V5 = [];
F = generateF(1, 0, 1); % Set DC voltage
std = 0.05;
c_dist = std.*randn(50000,1) + Cap;
w = pi;
for index=1:50000
    C(1,1) = c_dist(index);
    C(1,2) = -c_dist(index);
    C(2,1) = -c_dist(index);
    C(2,2) = c_dist(index);
    e = (G+2*pi*w*1j*C)\F;
    V5 = [V5 20*log10(abs(e(5)/F(8)))];
end
title('Capacitor Sweep');
xlabel('Gain (dB)');
histogram(V5);