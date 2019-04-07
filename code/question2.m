display('Question 2');
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
Cn = 0;

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, Cn);

display('G matrix');
display(G);
display('C matrix');
display(C);

% Step fuunction simulatuin
display('Step Function');
Vin = zeros(1,iterations);
Vin(0.03*iterations:iterations) = 1;
F = generateF(Vin, zeros(1,iterations), iterations);
V_list = transient(C, G, F, iterations, delta);

Vout = V_list(5,:,:);
Vout = Vout(1,:);
figure();
hold on;
plot(linspace(0,time,iterations), Vout);
plot(linspace(0,time,iterations), Vin);
xlabel('Time (s)');
ylabel('Vout (V)');
title('Step Function Transient Response');
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
title('Step Function Frequency Response');

% sin wave simulatuin
display('Sine wave');
Vin = sin(linspace(0,1,iterations)*2*pi*1/0.03);
F = generateF(Vin, zeros(1,iterations), iterations);
V_list = transient(C, G, F, iterations, delta);

Vout = V_list(5,:,:);
Vout = Vout(1,:);
figure();
hold on;
plot(linspace(0,time,iterations), Vout);
plot(linspace(0,time,iterations), Vin);
xlabel('Time (s)');
ylabel('Vout (V)');
title('Sine Function Transient Response');
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
title('Sine Function Frequency Response');

% Gaussian Pulse Simulation
std = 0.03;
mean = 0.06;
display('Gaussian Pulse');
Vin = gaussmf(linspace(0,1,iterations),[std mean]);
F = generateF(Vin, zeros(1,iterations), iterations);
V_list = transient(C, G, F, iterations, delta);

Vout = V_list(5,:,:);
Vout = Vout(1,:);
figure();
hold on;
plot(linspace(0,time,iterations), Vout);
plot(linspace(0,time,iterations), Vin);
xlabel('Time (s)');
ylabel('Vout (V)');
title('Gaussian Function Transient Response');
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
title('Gaussian Function Frequency Response');
