% === Ejercicio 9 ===
% Muestra de números aleatorios
R = [0.98, 0.16, 0.84, 0.68, 0.49, 0.54, 0.94, 0.50, 0.89, 0.12,...
      0.51, 0.86, 0.81, 0.44, 0.42, 0.32, 0.38, 0.30, 0.72, 0.49];

% Prueba de promedios
mu = 0.5;
sigma = sqrt(1/12);
sigma_x = sigma / sqrt(length(R));
z0 = abs((mean(R) - mu) / sigma_x);
fprintf('Z0 (Promedios): %.2f\n', z0);

% Prueba de frecuencias (5 intervalos)
[counts] = histcounts(R, 5);
FE = length(R) / 5;
chi2 = sum((counts - FE).^2 / FE);
fprintf('Chi-cuadrado (Frecuencias): %.2f\n', chi2);

% Prueba de series (4 intervalos)
pairs = [R(1:end-1)', R(2:end)'];
x_edges = 0:0.25:1;
y_edges = x_edges;
[~,~,~,idx] = histcounts2(pairs(:,1), pairs(:,2), x_edges, y_edges);
FO = accumarray(idx, ones(size(idx)), [16, 1]);
FE_series = length(pairs) / 16;
chi2_series = sum((FO - FE_series).^2 ./ FE_series);
fprintf('Chi-cuadrado (Series): %.2f\n', chi2_series);

% Prueba de la distancia ([0.3, 0.5])
theta = 0.2;
in_interval = R >= 0.3 & R <= 0.5;
gaps = diff([0; find(in_interval); length(R)+1]) - 1;
gaps = gaps(gaps > 0);
FE_gaps = length(gaps) * theta * (1-theta).^repmat(0:max(gaps), 1, 1)';
chi2_gaps = 0;
for i = 0:max(gaps)
    FO_i = sum(gaps == i);
    chi2_gaps = chi2_gaps + (FO_i - FE_gaps(i+1))^2 / FE_gaps(i+1);
end
fprintf('Chi-cuadrado (Distancia): %.2f\n', chi2_gaps);

% Prueba runstest
[h, p] = runstest(R, 0.5, 'type', 'two-sided');
fprintf('Prueba runstest: Rechazar H0? %d | p-valor: %.4f\n', h, p);