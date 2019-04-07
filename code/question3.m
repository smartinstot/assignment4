display('Question 3');
iterations = 1000;
time = 1; % s
delta = time/iterations;

R1 = 1;
Cap = 0.25;
R2 =  2;
L = 0.2;
R3 = 10;
alpha = 100;
R4 = 0.1;
RO = 1000;
Cn = 0.00001;

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, Cn);

display('G matrix');
display(G);
display('C matrix');
display(C);

% Create F matrix
std = 0.03;
mean = 0.06;
Vin = gaussmf(linspace(0,1,iterations),[std mean]);
In = 0.001*rand(iterations,1);
F = generateF(Vin, In, iterations);
V_list = transient(C, G, F, iterations, delta);

Vout = V_list(5,:,:);
Vout = Vout(1,:);
figure();
hold on;
plot(linspace(0,time,iterations), Vout);
plot(linspace(0,time,iterations), Vin);
xlabel('Time (s)');
ylabel('Vout (V)');
title('Gaussian Function Transient Response with Noise');
legend('Vout', 'Vin');


FF = abs(fftshift(fft(Vout)));
figure();
hold on;
plot(((1:length(FF))/iterations)-0.5,20*log10(FF));
FF = abs(fftshift(fft(Vin)));
plot(((1:length(FF))/iterations)-0.5,20*log10(FF));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dBV)');
legend('Vout','Vin');
title('Gaussian Function Frequency Response with Noise');

display('Varying the Noise Bandwidth');
figure();
hold on;
FF = abs(fftshift(fft(Vout)));
plot(((1:length(FF))/iterations)-0.5,20*log10(FF));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dBV)');
title('Gaussian Function Frequency Response with Various Bandwidth');

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, 0.001);
V_list = transient(C, G, F, iterations, delta);
Vout = V_list(5,:,:);
Vout = Vout(1,:);
FF = abs(fftshift(fft(Vout)));
plot(((1:length(FF))/iterations)-0.5,20*log10(FF));

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, 0.01);
V_list = transient(C, G, F, iterations, delta);
Vout = V_list(5,:,:);
Vout = Vout(1,:);
FF = abs(fftshift(fft(Vout)));
plot(((1:length(FF))/iterations)-0.5,20*log10(FF));

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, 0.0000001);
V_list = transient(C, G, F, iterations, delta);
Vout = V_list(5,:,:);
Vout = Vout(1,:);
FF = abs(fftshift(fft(Vout)));
plot(((1:length(FF))/iterations)-0.5,20*log10(FF));

legend('Cn = 0.00001', 'Cn = 0.001', 'Cn = 0.01', 'Cn = 0.0000001');

%%%% Varying the time step

display('Vary Simulation Step Size');


R1 = 1;
Cap = 0.25;
R2 =  2;
L = 0.2;
R3 = 10;
alpha = 100;
R4 = 0.1;
RO = 1000;
Cn = 0.00001;

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, Cn);

std = 0.03;
mean = 0.06;

iterations = 1000;
time = 1; % s
delta = time/iterations;
Vin = gaussmf(linspace(0,1,iterations),[std mean]);
In = 0.001*rand(iterations,1);
F = generateF(Vin, In, iterations);
V_list = transient(C, G, F, iterations, delta);
Vout = V_list(5,:,:);
Vout = Vout(1,:);

figure();
hold on;
plot(linspace(0,time,iterations), Vout);
xlabel('Time (s)');
ylabel('Vout (V)');
title('Gaussian Function Transient Response with Various Time Steps');

iterations = 10000;
time = 1; % s
delta = time/iterations;
Vin = gaussmf(linspace(0,1,iterations),[std mean]);
In = 0.001*rand(iterations,1);
F = generateF(Vin, In, iterations);
V_list = transient(C, G, F, iterations, delta);
Vout = V_list(5,:,:);
Vout = Vout(1,:);

plot(linspace(0,time,iterations), Vout);

iterations = 100;
time = 1; % s
delta = time/iterations;
Vin = gaussmf(linspace(0,1,iterations),[std mean]);
In = 0.001*rand(iterations,1);
F = generateF(Vin, In, iterations);
V_list = transient(C, G, F, iterations, delta);
Vout = V_list(5,:,:);
Vout = Vout(1,:);

plot(linspace(0,time,iterations), Vout);

legend('1000 Steps', '10000 Steps', '100 Steps');