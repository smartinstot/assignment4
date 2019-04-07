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
In = 0;

[G, C] = generateModel(R1, Cap, R2, L, R3, alpha, R4, RO, Cn, In);
Vin = zeros(1,iterations);
Vin(0.3*iterations:iterations) = 1;
F = generateF(Vin, zeros(1,iterations), iterations);
V_list = transient(C, G, F, iterations, delta);

Vout = V_list(5,:,:);
Vout = Vout(1,:);
plot(linspace(0,time,iterations), Vout);