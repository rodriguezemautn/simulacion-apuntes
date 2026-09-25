% === Análisis de Números Aleatorios ===
% TP Clase 2 - Simulación UTN FRBA

% Semilla para reproducibilidad
rng(74);

% Generar 1000 números aleatorios uniformes
r_uniforme = rand(1, 1000);
disp('Primeros 10 números aleatorios:');
disp(r_uniforme(1:10));

% Estadísticas básicas
fprintf('Media: %.4f\n', mean(r_uniforme));
fprintf('Desviación estándar: %.4f\n', std(r_uniforme));

% Histograma
figure;
histogram(r_uniforme, 20);
title('Histograma de Números Aleatorios (Uniformes)');
xlabel('Valor');
ylabel('Frecuencia');

% Prueba de promedios
mu = 0.5;
sigma = sqrt(1/12);
sigma_x = sigma / sqrt(length(r_uniforme));
z0 = abs((mean(r_uniforme) - mu) / sigma_x);
fprintf('Z0 (Prueba de Promedios): %.2f\n', z0);

% Prueba de frecuencias (5 intervalos)
edges = 0:0.2:1;
[counts] = histcounts(r_uniforme, edges);
FE = length(r_uniforme) / 5;
chi2 = sum((counts - FE).^2 ./ FE);
fprintf('Chi-cuadrado (Frecuencias): %.2f\n', chi2);

% Prueba de series (4 intervalos)
n_intervals = 4;
pairs = [r_uniforme(1:end-1)', r_uniforme(2:end)'];
x_edges = 0:1/n_intervals:1;
y_edges = x_edges;
[~,~,~,idx] = histcounts2(pairs(:,1), pairs(:,2), x_edges, y_edges);
FO = accumarray(idx, ones(size(idx)), [n_intervals^2, 1]);
FE_series = length(pairs) / n_intervals^2;
chi2_series = sum((FO - FE_series).^2 / FE_series);
fprintf('Chi-cuadrado (Series): %.2f\n', chi2_series);

% Prueba de la distancia (intervalo [0.3, 0.5])
theta = 0.2;
in_interval = r_uniforme >= 0.3 & r_uniforme <= 0.5;
gaps = diff([0; find(in_interval); length(r_uniforme)+1]) - 1;
gaps = gaps(gaps > 0);  % Tamaños de huecos
max_gap = max(gaps);
FE_gaps = length(gaps) * theta * (1-theta).^repmat(0:max_gap, 1, 1)';
chi2_gaps = sum((accumarray(gaps+1, ones(size(gaps)), [max_gap+1,1]) - FE_gaps(1:max_gap+1)).^2 ./ FE_gaps(1:max_gap+1));
fprintf('Chi-cuadrado (Distancia): %.2f\n', chi2_gaps);

% Prueba de aleatoriedad con runstest
[h, p] = runstest(r_uniforme, 0.5, 'type', 'two-sided');
fprintf('Prueba de aleatoriedad (runstest): Rechazar H0? %d | p-valor: %.4f\n', h, p);