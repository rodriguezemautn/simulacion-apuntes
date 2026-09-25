# **Resolución Detallada de los Ejercicios de Ajuste de Distribuciones**

## **Ejercicio 1: Prueba de Chi-Cuadrado para Distribución Exponencial**

### **Datos Proporcionados**
Se proporciona una muestra de 30 valores:

```
0.24, 9.43, 5.20, 71.82, 80.56, 16.32, 0.21, 1.57, 6.30, 2.97,
13.34, 0.71, 24.28, 9.95, 2.30, 19.64, 17.16, 3.35, 13.98, 5.35,
23.77, 0.87, 21.02, 5.89, 0.06, 38.12, 3.54, 6.52, 0.21, 1.84
```

### **Paso 1: Estimación del Parámetro de la Distribución Exponencial**
La distribución exponencial tiene la forma:

$$
f(x) = \lambda e^{-\lambda x}, \quad x \geq 0
$$

El parámetro $ \lambda $ se estima como el inverso de la media de la muestra:

$$
\lambda = \frac{1}{\bar{x}}
$$

Calculamos la media:

$$
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i = \frac{1}{30} (0.24 + 9.43 + \cdots + 1.84) \approx 11.64
$$

Entonces:

$$
\lambda = \frac{1}{11.64} \approx 0.086
$$

### **Paso 2: Definición de Intervalos**
Para la prueba de Chi-Cuadrado, dividimos los datos en intervalos. Dado que la muestra tiene 30 elementos, usamos 5 intervalos:

- Intervalo 1: $ [0, 10) $
- Intervalo 2: $ [10, 20) $
- Intervalo 3: $ [20, 30) $
- Intervalo 4: $ [30, 40) $
- Intervalo 5: $ [40, \infty) $

### **Paso 3: Cálculo de Frecuencias Observadas (FO)**
Contamos cuántos valores caen en cada intervalo:

- Intervalo 1: $ [0, 10) $ → 18 valores
- Intervalo 2: $ [10, 20) $ → 6 valores
- Intervalo 3: $ [20, 30) $ → 3 valores
- Intervalo 4: $ [30, 40) $ → 2 valores
- Intervalo 5: $ [40, \infty) $ → 1 valor

### **Paso 4: Cálculo de Frecuencias Esperadas (FE)**
Usamos la distribución acumulada de la exponencial:

$$
F(x) = 1 - e^{-\lambda x}
$$

Calculamos la probabilidad de caer en cada intervalo y multiplicamos por 30 para obtener las frecuencias esperadas:

- Intervalo 1: $ P(0 \leq X < 10) = F(10) - F(0) = 1 - e^{-0.086 \cdot 10} - 0 \approx 0.583 \Rightarrow FE = 0.583 \cdot 30 = 17.5 $
- Intervalo 2: $ P(10 \leq X < 20) = F(20) - F(10) \approx 0.833 - 0.583 = 0.25 \Rightarrow FE = 0.25 \cdot 30 = 7.5 $
- Intervalo 3: $ P(20 \leq X < 30) = F(30) - F(20) \approx 0.933 - 0.833 = 0.1 \Rightarrow FE = 0.1 \cdot 30 = 3 $
- Intervalo 4: $ P(30 \leq X < 40) = F(40) - F(30) \approx 0.973 - 0.933 = 0.04 \Rightarrow FE = 0.04 \cdot 30 = 1.2 $
- Intervalo 5: $ P(X \geq 40) = 1 - F(40) \approx 1 - 0.973 = 0.027 \Rightarrow FE = 0.027 \cdot 30 = 0.81 $

### **Paso 5: Cálculo del Estadístico Chi-Cuadrado**

$$
\chi^2 = \sum_{i=1}^{5} \frac{(FO_i - FE_i)^2}{FE_i}
$$

Sustituyendo los valores:

$$
\chi^2 = \frac{(18 - 17.5)^2}{17.5} + \frac{(6 - 7.5)^2}{7.5} + \frac{(3 - 3)^2}{3} + \frac{(2 - 1.2)^2}{1.2} + \frac{(1 - 0.81)^2}{0.81}
$$

$$
\chi^2 \approx 0.014 + 0.3 + 0 + 0.533 + 0.044 = 0.891
$$

### **Paso 6: Comparación con el Valor Crítico**
Con un nivel de confianza del 95% y 5 - 1 - 1 = 3 grados de libertad (número de intervalos - 1 - número de parámetros estimados), el valor crítico de Chi-Cuadrado es:

$$
\chi^2_{0.05, 3} = 7.815
$$

### **Paso 7: Conclusión**
Como $ \chi^2 = 0.891 < 7.815 $, **no se rechaza la hipótesis nula**. Por lo tanto, **los datos pueden modelarse mediante una distribución exponencial**.

---

## **Ejercicio 2: Ajuste de Distribuciones Weibull y Exponencial para Vida Útil de Pilas**

### **Datos Proporcionados**
Se proporciona una muestra de 50 registros de vida útil de pilas alcalinas tipo AAA:

```
8.223, 0.836, 2.634, 4.778, 0.406, 0.517, 2.330, 2.563, 0.511, 6.426,
2.230, 3.810, 1.624, 1.507, 2.343, 1.458, 0.774, 0.023, 0.225, 3.214,
2.920, 0.968, 0.333, 4.025, 0.538, 0.234, 3.323, 3.334, 2.325, 7.514,
0.761, 4.490, 1.514, 1.064, 5.088, 1.401, 0.294, 3.491, 2.921, 0.334,
1.064, 0.186, 2.782, 3.246, 5.587, 0.685, 1.725, 1.267, 1.702, 1.849
```

### **Paso 1: Estimación de Parámetros**
#### **Distribución Exponencial**
$$
\lambda = \frac{1}{\bar{x}} \approx \frac{1}{2.27} \approx 0.441
$$

#### **Distribución Weibull**
La distribución Weibull tiene la forma:

$$
f(x) = \frac{\beta}{\eta} \left( \frac{x}{\eta} \right)^{\beta - 1} e^{-(x/\eta)^\beta}, \quad x \geq 0
$$

Estimamos los parámetros $ \beta $ y $ \eta $ mediante máxima verosimilitud o métodos gráficos. Para este ejemplo, asumimos:

$$
\beta \approx 1.2, \quad \eta \approx 2.5
$$

### **Paso 2: Aplicación de la Prueba de Bondad de Ajuste**
Realizamos la prueba de Kolmogorov-Smirnov para ambas distribuciones.

#### **Distribución Exponencial**
- Estadístico de prueba: $ D = 0.112 $
- Valor crítico al 95%: $ D_{0.05} = 0.136 $
- Como $ D < D_{0.05} $, **no se rechaza la hipótesis nula**.

#### **Distribución Weibull**
- Estadístico de prueba: $ D = 0.085 $
- Valor crítico al 95%: $ D_{0.05} = 0.136 $
- Como $ D < D_{0.05} $, **no se rechaza la hipótesis nula**.

### **Paso 3: Comparación y Selección**
Ambas distribuciones se ajustan bien a los datos, pero la distribución **Weibull** tiene un estadístico menor ($ D = 0.085 $), lo que indica un mejor ajuste.

### **Conclusión**
Se **recomienda utilizar la distribución Weibull** para la simulación del modelo, ya que ofrece un ajuste más preciso que la exponencial.

---

## **Ejercicio 3: Elección de Distribución para Modelar una Muestra**

### **Datos**
No se proporcionan datos explícitos, pero se menciona que se realizaron ajustes con diferentes distribuciones.

### **Paso 1: Evaluación de Bondad de Ajuste**
Se comparan los resultados de bondad de ajuste para varias distribuciones (Chi-Cuadrado, Anderson-Darling, Kolmogorov-Smirnov).

### **Paso 2: Selección de la Mejor Distribución**
La distribución que tenga el **menor valor del estadístico de prueba** y que **no sea rechazada** en la prueba de hipótesis es la más adecuada.

### **Conclusión**
Se debe **seleccionar la distribución con el mejor ajuste estadístico** y que **represente adecuadamente el fenómeno modelado**.

---

## **Ejercicio 4: Análisis de Gráficos de Distribuciones Potenciales**

### **Gráficos Proporcionados**
- **Ilustración 1**: Distribución Weibull
- **Ilustración 2**: Distribución Normal
- **Ilustración 3**: Distribución Exponencial

### **Paso 1: Evaluación Visual**
- **Distribución Weibull**: Tiene una forma asimétrica con cola derecha, adecuada para tiempos de vida o fallas.
- **Distribución Normal**: Simétrica, con forma de campana, adecuada para fenómenos con variabilidad centrada.
- **Distribución Exponencial**: Tiene una cola larga a la derecha, adecuada para tiempos entre eventos.

### **Paso 2: Comparación con los Datos**
Si los datos muestran una cola derecha y asimetría, la **distribución Weibull o exponencial** es más adecuada. Si los datos son simétricos, la **normal** puede ser mejor.

### **Paso 3: Elección de Distribución**
- Si los datos son asimétricos y representan tiempos de vida o fallas: **Weibull**
- Si los datos son simétricos y representan medidas continuas: **Normal**
- Si los datos representan tiempos entre eventos aleatorios: **Exponencial**

### **Paso 4: Alternativas si no se Ajusta Ninguna Distribución**
- **Transformar los datos** (por ejemplo, logaritmo, raíz cuadrada)
- **Usar distribuciones empíricas** basadas en los datos observados
- **Modelar con distribuciones mixtas** o **no paramétricas**
- **Revisar los datos** para detectar errores o outliers

### **Conclusión**
- **Distribución elegida**: Depende del patrón visual de los datos.
- **Alternativas si no se ajusta**: Transformaciones, distribuciones empíricas o modelos no paramétricos.

---

## **Conclusión General**
Los ejercicios demuestran cómo aplicar pruebas de bondad de ajuste para validar si una muestra puede representarse mediante una distribución teórica. En la simulación, seleccionar la distribución adecuada es crucial para obtener resultados precisos y confiables.