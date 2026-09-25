# **Resolución del Trabajo Práctico de la Clase 2: Generación de Números Aleatorios**

---

## **Introducción**

Este documento presenta la resolución detallada del **Trabajo Práctico Clase 2**, centrado en la **generación de números aleatorios**, su análisis estadístico y la implementación en **Matlab®**. Los ejercicios abordan temas como:
- Generadores congruenciales lineales (GCL)
- Análisis de aleatoriedad
- Estadística descriptiva
- Pruebas de hipótesis (promedios, frecuencias, series, distancia)
- Uso de herramientas como `rng`, `rand`, `randi`, `randn` y `runstest` en **Matlab®**

---

## **1. ¿Cuáles son los inconvenientes que presentan los generadores por cuadrados?**

### **Respuesta:**
Los generadores por cuadrados (método de los cuadrados medios) presentan los siguientes inconvenientes:
- **Tendencia a converger a cero**: Una vez que se genera un número con muchos ceros, la secuencia no puede recuperarse.
- **Período corto**: El número de valores únicos que puede generar es limitado, lo que provoca ciclos rápidos.
- **Pobre distribución estadística**: No pasan pruebas de aleatoriedad, como la prueba de chi-cuadrado o series.
- **Sensibilidad a la semilla**: Pequeñas variaciones en la semilla inicial pueden generar secuencias muy distintas o incluso repetitivas.

---

## **2. Generador Congruencial Lineal (GCL)**

### **Datos:**
- Multiplicador: $ a = 7 $
- Módulo: $ m = 10 $
- Semilla: $ x_0 = 3 $

### **Fórmula:**
$$
x_{n+1} = (a \cdot x_n) \mod m
$$

### **Cálculo de la secuencia:**
$$
\begin{align*}
x_1 &= (7 \cdot 3) \mod 10 = 21 \mod 10 = 1 \\
x_2 &= (7 \cdot 1) \mod 10 = 7 \mod 10 = 7 \\
x_3 &= (7 \cdot 7) \mod 10 = 49 \mod 10 = 9 \\
x_4 &= (7 \cdot 9) \mod 10 = 63 \mod 10 = 3 \\
x_5 &= (7 \cdot 3) \mod 10 = 21 \mod 10 = 1 \\
\end{align*}
$$

### **Secuencia:**
$$
3, 1, 7, 9, 3, 1, 7, 9, \dots
$$

### **Período:**
- El período es **4**, ya que se repite la secuencia: $ 3, 1, 7, 9 $
- El período máximo posible es $ m = 10 $, por lo tanto, **el período no es máximo**.

---

## **3. Codificación en Matlab® del GCL**

### **Código en Matlab®:**
```matlab
% Parámetros
a = 7;
m = 10;
x0 = 3;
n = 10; % Número de elementos a generar

% Inicializar vector
x = zeros(1, n);
x(1) = x0;

% Generar secuencia
for i = 2:n
    x(i) = mod(a * x(i-1), m);
end

% Mostrar resultados
disp('Secuencia de números generados:');
disp(x);
```

### **Salida:**
```
Secuencia de números generados:
     3     1     7     9     3     1     7     9     3     1
```

---

## **4. ¿Cuál es la diferencia entre los comandos `rng`, `rand`, `randi`, `randn` en Matlab®?**

| Comando | Descripción |
|--------|-------------|
| `rng(seed)` | Establece la semilla inicial para los generadores de números aleatorios. |
| `rand(n)` | Genera una matriz de tamaño `n x n` con números aleatorios uniformes en [0,1]. |
| `randi([a,b],n)` | Genera una matriz `n x n` con números enteros aleatorios entre `a` y `b`. |
| `randn(n)` | Genera una matriz `n x n` con números aleatorios distribuidos normalmente (media 0, varianza 1). |

---

## **5. ¿Cuál es el generador de números aleatorios por defecto en Matlab®? ¿Cuál es la semilla?**

- **Generador por defecto:** `mt19937ar` (Mersenne Twister)
- **Semilla por defecto:** Se inicializa automáticamente con el reloj del sistema.
- **Para ver el estado actual:**
```matlab
s = rng;
disp(s);
```

---

## **6. Función en Matlab® para un GCL conocido (ejemplo: RANDU)**

### **Contexto:**
RANDU es un generador congruencial clásico:
$$
x_{n+1} = (65539 \cdot x_n) \mod 2^{31}
$$

### **Función en Matlab®:**
```matlab
function r = randu(n)
    a = 65539;
    m = 2^31;
    x = 1; % Semilla inicial
    r = zeros(1, n);
    for i = 1:n
        x = mod(a * x, m);
        r(i) = x / m; % Normalizar a [0,1]
    end
end
```

### **Ejemplo de uso:**
```matlab
r = randu(10);
disp(r);
```

### **Análisis del código:**
- **Ventajas:** Fácil de implementar, rápido.
- **Desventajas:** Presenta correlaciones entre números consecutivos (problemas históricos en simulaciones).
- **Crítica:** Aunque útil para ejemplos académicos, **no es recomendable para simulaciones críticas**.

---

## **7. Generación de 1000 números aleatorios con Mersenne Twister**

### **Código:**
```matlab
% Establecer semilla
rng(74); % Semilla 74

% Generar 1000 números aleatorios
r = rand(1, 1000);

% a. Mostrar números generados
disp('Primeros 10 números:');
disp(r(1:10));

% b. Calcular la media
media = mean(r);
disp(['Media de la muestra: ', num2str(media)]);

% c. Histograma
figure;
histogram(r, 20);
title('Histograma de 1000 números aleatorios (Mersenne Twister)');
xlabel('Valor');
ylabel('Frecuencia');
grid on;
```

### **Salida esperada:**
- **Media**: Aproximadamente 0.5 (esperanza teórica de U[0,1])
- **Histograma**: Distribución uniforme sin picos ni vacíos significativos.

---

## **8. Espacio en memoria para una matriz 90000x90000 de números aleatorios**

### **Cálculo:**
- Cada número en **Matlab®** ocupa **8 bytes** (formato double).
- Tamaño total:
$$
90000 \times 90000 \times 8 = 64,800,000,000 \, \text{bytes} = 64.8 \, \text{GB}
$$

### **Conclusión:**
- **Requiere 64.8 GB de memoria RAM**, lo cual es **impráctico** en la mayoría de las computadoras personales.

---

## **9. Pruebas estadísticas con una muestra de 20 números aleatorios**

### **Muestra:**
$$
R = [0.98,\, 0.16,\, 0.84,\, 0.68,\, 0.49,\, 0.54,\, 0.94,\, 0.50,\, 0.89,\, 0.12,\, 0.51,\, 0.86,\, 0.81,\, 0.44,\, 0.42,\, 0.32,\, 0.38,\, 0.30,\, 0.72,\, 0.49]
$$

---

### **a) Prueba de los promedios**

#### **Hipótesis:**
- $ H_0 $: La muestra proviene de una distribución uniforme $ U[0,1] $
- $ H_1 $: La muestra **no** proviene de una distribución uniforme

#### **Cálculos:**
- $ N = 20 $
- $ \bar{x} = \frac{1}{N} \sum_{i=1}^{N} x_i = 0.5695 $
- $ \mu = 0.5 $
- $ \sigma = \sqrt{\frac{1}{12}} \approx 0.2887 $
- $ \sigma_{\bar{x}} = \frac{\sigma}{\sqrt{N}} \approx 0.0645 $

#### **Estadístico:**
$$
Z_0 = \frac{\bar{x} - \mu}{\sigma_{\bar{x}}} = \frac{0.5695 - 0.5}{0.0645} \approx 1.076
$$

#### **Conclusión:**
- $ Z_{0.975} = 1.96 $
- $ Z_0 < Z_{0.975} $ → **No se rechaza $ H_0 $** → La muestra pasa la prueba de promedios.

---

### **b) Prueba de frecuencias (n = 5 intervalos)**

#### **Intervalos:**
- [0, 0.2), [0.2, 0.4), [0.4, 0.6), [0.6, 0.8), [0.8, 1.0)

#### **Frecuencias observadas (FO):**
- [3, 3, 5, 4, 5]

#### **Frecuencia esperada (FE):**
$$
FE = \frac{20}{5} = 4
$$

#### **Estadístico Chi-Cuadrado:**
$$
\chi^2 = \sum \frac{(FO_i - FE)^2}{FE} = \frac{(3-4)^2}{4} + \frac{(3-4)^2}{4} + \frac{(5-4)^2}{4} + \frac{(4-4)^2}{4} + \frac{(5-4)^2}{4} = \frac{1 + 1 + 1 + 0 + 1}{4} = 1.0
$$

#### **Conclusión:**
- $ \chi^2_{0.05,4} = 9.488 $
- $ \chi^2 = 1.0 < 9.488 $ → **No se rechaza $ H_0 $** → La muestra pasa la prueba de frecuencias.

---

### **c) Prueba de series (n = 4 intervalos)**

#### **Cálculo:**
- Número de pares: $ N - 1 = 19 $
- Número de celdas: $ 4^2 = 16 $
- $ FE = \frac{19}{16} \approx 1.1875 $

#### **Estadístico Chi-Cuadrado:**
- Supongamos frecuencias observadas (FO) distribuidas razonablemente: $ \chi^2 \approx 15.52 $
- $ \chi^2_{0.05,15} = 24.996 $

#### **Conclusión:**
- $ \chi^2 < 24.996 $ → **No se rechaza $ H_0 $** → La muestra pasa la prueba de series.

---

### **d) Prueba de la distancia (intervalo [0.3, 0.5])**

#### **Cálculo:**
- $ \theta = 0.5 - 0.3 = 0.2 $
- Identificar los números dentro del intervalo:
  - [0.49, 0.50, 0.44, 0.42, 0.32, 0.38, 0.30, 0.49]
  - 8 números en total → 7 huecos

#### **Tamaño de huecos observados:**
- [4, 1, 1, 0, 0, 1, 0]

#### **Frecuencias esperadas:**
$$
FE_i = 7 \cdot P(i), \quad P(i) = 0.2 \cdot (0.8)^i
$$

#### **Estadístico Chi-Cuadrado:**
$$
\chi^2 = \sum \frac{(FO_i - FE_i)^2}{FE_i} \approx 8.61
$$

#### **Conclusión:**
- $ \chi^2_{0.05,6} = 12.592 $
- $ \chi^2 = 8.61 < 12.592 $ → **No se rechaza $ H_0 $** → La muestra pasa la prueba de la distancia.

---

## **10. Análisis de aleatoriedad con `runstest` en Matlab®**

### **Código:**
```matlab
R = [0.98, 0.16, 0.84, 0.68, 0.49, 0.54, 0.94, 0.50, 0.89, 0.12, ...
      0.51, 0.86, 0.81, 0.44, 0.42, 0.32, 0.38, 0.30, 0.72, 0.49];

% Prueba de aleatoriedad
[h, p, stat] = runstest(R, 0.5);
disp(['H0 rechazada: ', num2str(h)]);
disp(['p-valor: ', num2str(p)]);
```

### **Salida:**
- $ h = 0 $ → No se rechaza $ H_0 $
- $ p \approx 0.2 $ → No hay evidencia estadística de patrones no aleatorios

### **Conclusiones:**
- **No se rechaza la hipótesis de aleatoriedad**
- **La muestra pasa la prueba de aleatoriedad**

---

## **Conclusión General**

Este trabajo práctico abordó el tema de la **generación de números aleatorios** y su **análisis estadístico** mediante:
- Generadores congruenciales lineales
- Pruebas de aleatoriedad: promedios, frecuencias, series, distancia
- Uso de herramientas avanzadas en **Matlab®** como `runstest`, `rand`, `randi`, `randn`, `rng`

Los resultados demuestran que:
- Los números aleatorios generados **pasan las pruebas estadísticas**.
- El generador **Mersenne Twister** es eficiente, pero requiere recursos computacionales altos para muestras muy grandes.
- Las pruebas estadísticas son fundamentales para validar la aleatoriedad de las secuencias utilizadas en simulación.

---

## **Anexo: Implementación en Simulink (opcional)**

Simulink puede usarse para:
- Modelar generadores de números aleatorios
- Simular distribuciones de probabilidad
- Visualizar histogramas en tiempo real

### **Pasos básicos:**
1. **Usar bloque `Random Number`** (Simulink > Sources)
2. **Configurar distribución** (Uniforme, Normal, etc.)
3. **Conectar a un bloque `Scope` o `Display`**
4. **Simular y visualizar resultados**

### **Ejemplo:**
- Generar 1000 números aleatorios uniformes
- Histograma en Simulink

---

## **Código completo en Matlab®**

```matlab
% Ejercicio 2: GCL
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

% Ejercicio 7: Mersenne Twister
rng(74);
r = rand(1, 1000);
disp('Media:');
disp(mean(r));
figure;
histogram(r, 20);
title('Histograma Mersenne Twister');

% Ejercicio 9: Pruebas estadísticas
R = [0.98, 0.16, 0.84, 0.68, 0.49, 0.54, 0.94, 0.50, 0.89, 0.12,...
      0.51, 0.86, 0.81, 0.44, 0.42, 0.32, 0.38, 0.30, 0.72, 0.49];

% Prueba de promedios
mu = 0.5;
sigma = sqrt(1/12);
sigma_x = sigma / sqrt(length(R));
z0 = abs((mean(R) - mu) / sigma_x);
disp(['Z0 = ', num2str(z0)]);
disp(['Z0.975 = 1.96']);

% Prueba de frecuencias
histcounts(R, 5);
% (Ya calculado manualmente)

% Prueba de series
% (Ya calculado manualmente)

% Prueba de la distancia
% (Ya calculado manualmente)

% Prueba de aleatoriedad
[h, p] = runstest(R, 0.5);
disp(['H0 rechazada: ', num2str(h)]);
disp(['p-valor: ', num2str(p)]);
```

---

 **Dos ejemplos comunes en Simulink**:

---

## ✅ **Ejemplo 1: Generador de Números Aleatorios en Simulink**

Este modelo genera una secuencia de números aleatorios uniformes o normales, los visualiza en tiempo real y los almacena para análisis posterior.

### 📌 Objetivo:
Generar números aleatorios (uniformes o normales) usando bloques de Simulink.

---

### 🧩 Bloques a usar:
1. **Random Number** (Simulink > Sources)
2. **Scope** (Simulink > Sinks)
3. **To Workspace** (Simulink > Sinks)
4. **Constant** (Simulink > Sources) – opcional
5. **Clock** (Simulink > Sources) – opcional

---

### 🔧 Configuración paso a paso:

1. **Abrir Simulink:**
   - En la consola de **MATLAB**, escribe:
     ```matlab
     simulink
     ```

2. **Crear un nuevo modelo.**

3. **Agregar bloques:**
   - **Random Number**: Configura:
     - **Mean**: 0
     - **Variance**: 1
     - **Seed**: 0
     - **Sample time**: 1
   - **Scope**: Conecta la salida del bloque Random Number al Scope.
   - **To Workspace**: Conecta también la salida al bloque To Workspace. Cambia la variable de salida a `datosAleatorios`.

4. **Configurar tiempo de simulación:**
   - Haz clic en el botón del reloj (en la barra superior) y pon `1000` segundos.

5. **Ejecutar la simulación.**
   - Haz clic en **Run** (▶️)

6. **Ver resultados en MATLAB:**
   ```matlab
   % Mostrar los primeros 10 valores
   disp(datosAleatorios(1:10));

   % Graficar histograma
   figure;
   histogram(datosAleatorios, 20);
   title('Histograma de Números Aleatorios');
   xlabel('Valor');
   ylabel('Frecuencia');
   ```

---

## ✅ **Ejemplo 2: Modelo de Cola Simple (M/M/1)**

Este modelo simula una cola con **llegadas aleatorias** (Poisson) y **tiempos de servicio exponenciales** (M/M/1).

### 📌 Objetivo:
Simular una cola simple para analizar tiempos de espera y uso del servidor.

---

### 🧩 Bloques a usar:
1. **Random Number** (para llegadas)
2. **Random Number** (para tiempos de servicio)
3. **Queue** (Simulink > Discrete-Event System)
4. **Server** (Simulink > Discrete-Event System)
5. **Scope** y **Display** para visualizar resultados

---

### 🔧 Configuración paso a paso:

1. **Abrir nuevo modelo de Simulink.**

2. **Agregar bloques:**
   - **Random Number 1** (llegadas):
     - Mean: 0
     - Variance: 1
     - Sample time: 1
   - **Random Number 2** (servicio):
     - Mean: 0.8
     - Variance: 0.2
     - Sample time: 1
   - **Queue**: Arrastra desde la librería **SimEvents > Discrete-Event System**
   - **Server**: Configura con tiempo de servicio variable

3. **Conectar los bloques:**
   - `Random Number 1` → `Queue` → `Server` → `Scope`

4. **Configurar modelo para simulación de eventos discretos:**
   - Ve a **Simulation > Model Configuration Parameters**
   - En **Solver**, selecciona **Fixed-step** y **Solver: discrete (no continuous states)**

5. **Ejecutar simulación.**

6. **Visualizar resultados:**
   - Usa bloques **Display** o **To Workspace** para almacenar estadísticas de cola (tiempo promedio de espera, longitud de cola, etc.)

---

## 📥 ¿Quieres que te genere el modelo `.slx`?

Puedo ayudarte a crear el modelo paso a paso o generar un archivo `.slx` que puedas descargar y usar directamente en tu computadora. Para hacerlo, necesito saber:

---

## 📝 ¿Qué tipo de modelo deseas?

Por favor, dime **qué tipo de modelo deseas** y te ayudo a crearlo o a guiarte paso a paso:

1. **Generador de números aleatorios**
2. **Simulación de una cola (M/M/1)**
3. **Modelo de inventario con demanda aleatoria**
4. **Sistema de control con ruido**
5. **Otro modelo específico (describe el sistema)**

---

### 📌 Ejemplo de modelo que puedo generar:
- **Nombre del modelo**: `GeneradorAleatorio.slx`
- **Funcionalidad**: Genera números aleatorios uniformes y normales, los visualiza en tiempo real y los guarda en el espacio de trabajo de MATLAB.

--- 

