function V_list = transient(C, G, F, iterations, delta)
V_list = zeros(8,1, iterations);

for i=2:iterations
    e = C/delta + G;
    V_list(:,:,i) = e\(C*V_list(:,:,i-1)/delta + F(:,:,i));
end
end

