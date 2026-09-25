% Generador Congruencial Lineal
a = 7;
m = 10;
x0 = 3;
n = 10;
x = zeros(1, n);
x(1) = x0;

for i = 2:n
    x(i) = mod(a * x(i-1), m);
end

disp('Secuencia GCL:');
disp(x);