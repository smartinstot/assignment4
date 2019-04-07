function F = generateF(Vin, In, iterations)
F = zeros(8,1,iterations);
for i=1:iterations
    F(3,1,i) = -In(i);
    F(8,1,i) = Vin(i);
end
end

