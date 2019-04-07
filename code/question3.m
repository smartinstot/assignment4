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

% Create 
std = 0.03;
mean = 0.06;
Vin = gaussmf(linspace(0,1,iterations),[std mean]);
In = 0.001*rand(iterations,1);
F = generateF(Vin, In, iterations);