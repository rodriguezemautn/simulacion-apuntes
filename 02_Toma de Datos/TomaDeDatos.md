# AJUSTE DE DISTRIBUCIONES - TOMA DE DATOS
## Universidad Tecnológica Nacional - Facultad Regional La Plata
### Presentado por: Francisco Roqué y Leslie Monges

---

## INTRODUCCIÓN A LA SIMULACIÓN DE SISTEMAS

### ¿Qué es la simulación?

La simulación es **el proceso de diseñar y desarrollar un modelo computarizado de un sistema o proceso y llevar a cabo experimentos con este modelo con el propósito de comprender el comportamiento del sistema y/o evaluar diversas estrategias en su operación** (Shannon, 1975).

De manera más específica, es **la ciencia y arte de diseñar un modelo de un sistema y experimentar con este modelo con el propósito de entender el comportamiento real del sistema modelado**.

Según Banks et al. (2010), "la simulación es la imitación de la operación de un proceso o sistema del mundo real a lo largo del tiempo. Ya sea hecha a mano o en computadora, la simulación involucra la generación de una historia artificial de un sistema y la observación de esa historia artificial para extraer inferencias sobre las características operativas del sistema real."

### ¿Cuándo usamos la simulación?

La simulación se utiliza cuando:

1. **Los modelos matemáticos son insuficientes**: Algunos sistemas pueden resolverse mediante métodos matemáticos (cálculo diferencial, teoría de probabilidades, métodos algebraicos), pero muchos sistemas del mundo real son tan complejos que es virtualmente imposible resolverlos matemáticamente.

2. **Se requiere experimentación segura**: Cuando experimentar directamente en el sistema real sería costoso, peligroso o impracticable.

3. **Para análisis de escenarios**: Permite evaluar diferentes estrategias y configuraciones sin riesgo.

---

## TOMA DE DATOS

### Variables Aleatorias del Modelo

El primer paso fundamental es identificar **¿cuáles son las variables aleatorias de nuestro modelo a simular?**

### Métodos de Relevamiento de Datos

**¿Cómo relevamos sus valores en campo?**

Existen dos enfoques principales:

#### 1. Observación Directa vs Indirecta

##### Observación Directa
- Captura de tráfico de red mediante herramientas como tcpdump
- Ejemplo de comando: `tcpdump -s0 -i eth3 udp port 5060 and host 1.1.1.1 -w nombre_captura.cap`

Donde:
- `-s`: SNAPLEN (limita el tamaño de captura)
- `-i`: especifica la interfaz de red
- `5060/UDP`: tráfico de señalización de telefonía IP (Protocolo SIP)
- `host`: dirección IP del servidor de interés
- `-w`: salida en formato .cap para análisis posterior

##### Ejemplos de Captura de Datos:

1. **Proxy SIP (Llamadas Telefónicas)**: Captura de tráfico de señalización telefónica
2. **Consultas DNS**: Monitoreo de consultas a servidores DNS específicos
3. **Requerimientos HTTP/HTTPS**: Análisis de tráfico web

### Ejemplo Práctico: Sistema de Supermercado

#### Definición del Problema
Un dueño de supermercado desea optimizar la velocidad de atención a clientes y determinar si necesita agregar más cajas y/o personal.

**Objetivos específicos:**
- Determinar el tiempo de espera de un cliente para ser atendido
- Calcular el tiempo total desde que entra en fila hasta que se retira
- Evaluar si la cantidad de cajas es suficiente
- Determinar si se necesitan más empleados

#### Soluciones Propuestas

**Solución 1: Experimentación Directa ❌**
- Sacar una caja para probar si era innecesaria
- Agregar 5 cajas directamente
- **Problema**: Riesgo de pérdida de clientes y dinero

**Solución 2: Modelado ✅**
- Crear una representación lo más parecida posible al sistema real
- Experimentar de forma segura
- Tomar decisiones informadas

#### Proceso de Toma de Datos

1. **Recolección**: Ir al supermercado y registrar:
   - Cada cuánto tiempo llega un cliente a la fila (tiempo entre llegadas)
   - Cuánto tiempo tarda en irse
   - Recopilar al menos 100 datos durante una hora

2. **Análisis**: Determinar a qué tipo de distribución se ajustan mejor los datos

---

## SELECCIÓN DE DISTRIBUCIONES

### Importancia de la Selección Correcta

La selección de una distribución apropiada es un **paso esencial en todo proceso de simulación**.

**¿Por qué?** 
Si la distribución de probabilidades seleccionada no se ajusta correctamente a la muestra de datos, entonces nuestro modelo de simulación proporcionará **valores carentes de sentido y poco realistas**.

### Distribuciones Comunes
- Exponencial
- Normal  
- Chi-cuadrado
- Poisson

### Herramientas de Verificación
- Software como EasyFit
- Pruebas manuales como la prueba de bondad del ajuste

---

## PRUEBA DE BONDAD DEL AJUSTE

### Fundamento Teórico

La prueba de bondad del ajuste utiliza un **test chi-cuadrado** e involucra verificar la concordancia entre los datos experimentales y los modelos teóricos (Papoulis, 2002).

### Ejemplo Detallado: Distribución Exponencial

#### Datos del Ejercicio
Muestra de 30 datos para análisis de ajuste a distribución exponencial con α = 0.05 y α = 0.01.

#### Pasos del Análisis

**1. Identificación del modelo teórico:**
- Distribución Exponencial: f(x) = λe^(-λx), x ≥ 0

**2. Cálculo de parámetros:**
- Media de datos experimentales: x̄ = 13.55
- Para distribución exponencial: x̄ = 1/λ
- Por tanto: λ = 0.0738

**3. Distribución teórica resultante:**
f(x) = 0.0738 e^(-0.0738x), x ≥ 0

**4. Función de distribución acumulada:**
F(x) = 1 - e^(-0.0738x)

#### Aplicación de la Regla de Sturges

**Número de intervalos:**
k = ⌊1 + log₂M⌋ = ⌊1 + log₂30⌋ = 5

**Longitud de intervalos:**
L = (MÁX(xᵢ) - MÍN(xᵢ))/k = (80.56 - 0.06)/5 = 16.1

#### Construcción de la Tabla de Análisis

| Intervalo | Modelo Teórico | Prob. | F.O | F.E |
|-----------|----------------|-------|-----|-----|
| 1 | [0-16.16] | 0.6966 | 21 | 20.898 |
| 2 | (16.16-32.26] | 0.2109 | 6 | 6.327 |
| 3 | (32.26-48.36] | 0.0643 | 1 | 1.929 |
| 4 | (48.36-64.46] | 0.0196 | 0 | 0.588 |
| 5 | (64.46-80.56] | 0.0086 | 2 | 0.258 |

### Corrección por Continuidad (Yates, 1934)

**Problema identificado:** Las clases 3, 4 y 5 tienen FE < 5, lo que induce errores de aproximación.

**Solución:** Reagrupar datos para cumplir FE ≥ 5

#### Tabla Corregida

| Intervalo | Modelo Teórico | Prob. | F.O | F.E |
|-----------|----------------|-------|-----|-----|
| 1 | [0-16.16] | 0.6966 | 21 | 20.898 |
| 2 | >16.16 | 0.3034 | 9 | 9.102 |

### Cálculo del Estadístico Chi-cuadrado

**Fórmula:**
X₀² = Σᵢ₌₁² ((FOᵢ - FEᵢ)²/FEᵢ)

**Resultado:**
X₀² = 0.00164

### Valor Crítico de Tabla

Para k-1 = 2-1 = 1 grado de libertad y α = 0.05:
X²₁;₀.₀₅ = 3.841

### Conclusión del Test

**Verificación:**
X₀² < X²ₜₐᵦₗₐ
0.00164 < 3.841

**Por lo tanto:** No podemos rechazar H₀

**Conclusión:** Los datos experimentales pueden representarse mediante una distribución exponencial de parámetro λ = 0.0738 con un nivel de confianza del 95%.

---

## REQUISITOS DE LA PRUEBA

### Condiciones Necesarias
- **Cada clase debe contener al menos 5 datos** (FE ≥ 5)
- **Es recomendable contar con una muestra de al menos 75-100 valores**

### Ejemplo de Análisis Completo

El documento incluye un ejemplo de análisis con múltiples distribuciones:

| # | Distribución | Chi-cuadrado Estadística | Rango |
|---|--------------|-------------------------|--------|
| 1 | Exponencial | 0.00168 | 2 |
| 2 | Exponential (2P) | 0.00144 | 1 |
| 3 | Uniform | N/A | - |
| 4 | Weibull | 0.37026 | 4 |
| 5 | Weibull (3P) | 0.00914 | 3 |
| 6 | Erlang | No hay ajuste | - |
| 7 | Erlang (3P) | No hay ajuste | - |

**Resultado:** La distribución Exponencial (2P) muestra el mejor ajuste con la estadística más baja.

---

# Modelo de Simulación de Sistema de Urgencias en Simulink
## Análisis del Sistema de Atención en Urgencias Aplicando Teoría de Colas

---

## Introducción

El modelo presentado en la página 6 del documento "Simulación - Ciencia y Arte" ilustra un **sistema de simulación de eventos discretos** desarrollado en MATLAB Simulink para analizar el funcionamiento de un sistema de atención médica de urgencias. Este modelo aplica principios de **teoría de colas** para estudiar el comportamiento del flujo de pacientes y optimizar los recursos hospitalarios.

**Referencia:** Casas Ortiz de Rosas, J.; Tastaca Lugo, A. (2024). Análisis del sistema de atención en urgencias aplicando teoría de colas.

---

## Descripción General del Sistema

### Objetivo del Modelo
El modelo simula el proceso completo de atención de pacientes en un departamento de urgencias, desde su llegada hasta su salida del sistema, permitiendo analizar:

- **Tiempos de espera** de los pacientes
- **Utilización de recursos** médicos
- **Cuellos de botella** en el proceso de atención
- **Efectividad** del sistema de triaje
- **Métricas de rendimiento** del servicio

### Componentes Principales del Sistema

El modelo de Simulink está estructurado en varios subsistemas interconectados que representan las diferentes etapas del proceso de atención médica.

---

## Análisis Detallado de los Componentes

### 1. **Generación de Pacientes**

#### Bloque: "Cantidad pacientes generados"
- **Función:** Genera la llegada de pacientes al sistema
- **Tipo de distribución:** Utiliza distribuciones estocásticas para modelar patrones de llegada realistas
- **Características:**
  - Modelado de llegadas aleatorias
  - Posible variación por horarios (picos y valles de demanda)
  - Generación continua de entidades (pacientes)

### 2. **Sistema de Recepción y Triaje**

#### Bloque: "PACIENTES TOTAL ENTRANDO"
- **Función:** Punto de entrada principal al sistema
- **Procesamiento:** Registra y contabiliza todos los pacientes que ingresan

#### Bloque: "RECEPCIÓN PROMEDIO COLA"
- **Función:** Modela la cola de recepción inicial
- **Características:**
  - Cola FIFO (First In, First Out)
  - Tiempo de servicio variable
  - Capacidad de cola definida

#### Distribuciones de Probabilidad Asociadas:
- **"Recepción distribución (Triangular)"**: Modela tiempos de atención en recepción
- **"Event-Based Random Number"**: Genera valores aleatorios para la simulación

### 3. **Sistema de Triaje y Priorización**

#### Bloque: "Signal Scope (tiempo servicio recepción)"
- **Función:** Monitorea y registra los tiempos de servicio en recepción
- **Utilidad:** Análisis de rendimiento y identificación de cuellos de botella

#### Bloque: "COLA TRIAJE TIEMPO PROMEDIO"
- **Función:** Gestiona la cola de triaje donde se evalúa la prioridad de los pacientes
- **Características:**
  - Clasificación de pacientes por urgencia
  - Asignación de prioridades
  - Enrutamiento diferenciado

#### Bloque: "TRIAJE TIEMPO SERVICIO PROMEDIO"
- **Función:** Modela el tiempo requerido para el proceso de triaje
- **Variables:** Tiempo variable según complejidad del caso

### 4. **Gestión de Pacientes por Prioridad**

#### Bloque: "PACIENTES ASIGNADOS CON PRIORIDAD"
- **Función:** Clasifica y direcciona pacientes según su nivel de urgencia
- **Proceso:**
  - Evaluación médica inicial
  - Asignación de códigos de prioridad
  - Enrutamiento a colas específicas

#### Sistema de Colas Diferenciadas:
- **Bloque "Priority Queue (Consultorio)"**: Cola con prioridades para consultorios
- **Gestión inteligente** de recursos según urgencia médica

### 5. **Sistema de Atención Médica**

#### Área de Consultorios Generales

**Bloque: "DEPAR TED"**
- **Función:** Representa departamento de atención
- **Características:**
  - Múltiples servidores (médicos)
  - Atención paralela
  - Tiempos de servicio variables

**Bloque: "Signal Scope (tiempo de espera global en cola consultorio)"**
- **Función:** Monitoreo de tiempos de espera
- **Métricas:** Tiempo promedio, máximo y distribución de esperas

**Bloque: "GENTE CONSULTORIOS"**
- **Función:** Contabiliza pacientes en consultorios
- **Utilidad:** Control de ocupación y flujo

#### Área de Consultorios Especializados

**Bloque: "CONSULTORIO TIEMPO ESPERA PROMEDIO DE SERV"**
- **Función:** Modela consultorios especializados
- **Características:**
  - Atención más prolongada
  - Recursos especializados
  - Menor capacidad de atención simultánea

### 6. **Sistema de Salida y Métricas**

#### Bloque: "PACIENTES ATENDIDOS"
- **Función:** Contabiliza pacientes que completaron su atención
- **Métricas:** Total de pacientes procesados exitosamente

#### Bloques de Distribución de Tiempo:
- **"Recepción distribución (Weibull)"**: Modela distribuciones de tiempo realistas
- **"Random Number2"**: Generación de variabilidad estocástica

---

## Distribuciones Probabilísticas Utilizadas

### 1. **Distribución Triangular**
- **Aplicación:** Tiempos de recepción
- **Justificación:** Refleja tiempos con valores mínimo, más probable y máximo conocidos

### 2. **Distribución Weibull**
- **Aplicación:** Tiempos de consulta médica
- **Justificación:** Modelado de procesos con tasas de falla variable

### 3. **Distribuciones Uniformes**
- **Aplicación:** Generación de números aleatorios base
- **Función:** Entrada para transformaciones a otras distribuciones

---

## Métricas y Variables de Rendimiento

### Indicadores Clave de Desempeño (KPIs)

#### 1. **Tiempos de Espera**
- Tiempo promedio en cola de recepción
- Tiempo promedio en cola de triaje  
- Tiempo promedio en cola de consultorios
- Tiempo total de permanencia en el sistema

#### 2. **Utilización de Recursos**
- Porcentaje de ocupación de personal de recepción
- Utilización de personal de triaje
- Ocupación de consultorios generales
- Ocupación de consultorios especializados

#### 3. **Throughput del Sistema**
- Número de pacientes atendidos por hora
- Tasa de procesamiento por servicio
- Capacidad máxima del sistema

#### 4. **Métricas de Calidad**
- Tiempo máximo de espera
- Variabilidad en tiempos de atención
- Nivel de servicio por tipo de paciente

---

## Flujo de Procesos del Modelo

### Secuencia de Eventos

1. **Llegada de Pacientes**
   - Generación estocástica de llegadas
   - Entrada al sistema hospitalario

2. **Proceso de Recepción**
   - Cola de espera inicial
   - Registro y documentación básica
   - Tiempo de servicio variable

3. **Proceso de Triaje**
   - Evaluación médica inicial
   - Clasificación por prioridad
   - Asignación de ruta de atención

4. **Atención Médica**
   - Asignación a consultorio apropiado
   - Atención médica especializada
   - Tiempo de consulta variable

5. **Salida del Sistema**
   - Finalización de la atención
   - Registro de métricas finales

---

## Aplicaciones y Beneficios del Modelo

### Análisis Operacional
- **Identificación de cuellos de botella** en el proceso
- **Optimización de recursos** humanos y materiales
- **Planificación de capacidad** para diferentes escenarios de demanda

### Toma de Decisiones Estratégicas
- **Dimensionamiento óptimo** de personal por turno
- **Configuración eficiente** de áreas de atención
- **Políticas de triaje** más efectivas

### Simulación de Escenarios
- **Picos de demanda** (epidemias, emergencias)
- **Reducción de personal** (vacaciones, licencias)
- **Implementación de nuevos protocolos** de atención

---

## Validación y Calibración del Modelo

### Datos de Entrada Requeridos
- **Patrones históricos** de llegada de pacientes
- **Tiempos observados** de cada proceso
- **Distribuciones reales** de tipos de casos
- **Capacidades actuales** de recursos

### Proceso de Validación
1. **Comparación con datos históricos** de rendimiento
2. **Validación de expertos** médicos y administrativos
3. **Análisis de sensibilidad** de parámetros críticos
4. **Pruebas de escenarios extremos**

---

## Conclusiones y Recomendaciones

### Ventajas del Modelo en Simulink
- **Visualización clara** del flujo de procesos
- **Flexibilidad** para modificar parámetros
- **Capacidad de análisis** estadístico integrado
- **Facilidad para experimentar** con diferentes configuraciones

### Limitaciones Consideradas
- **Simplificación** de procesos complejos reales
- **Dependencia** de la calidad de datos de entrada
- **Necesidad de actualización** constante del modelo

### Recomendaciones de Implementación
1. **Recolección sistemática** de datos operacionales
2. **Capacitación del personal** en interpretación de resultados
3. **Integración** con sistemas de información hospitalaria
4. **Revisión periódica** y actualización del modelo

---

## Referencias Técnicas

- **Herramienta:** MATLAB Simulink con SimEvents Toolbox
- **Metodología:** Simulación de eventos discretos
- **Framework teórico:** Teoría de colas (Queueing Theory)
- **Tipo de modelo:** Estocástico con distribuciones probabilísticas

Este modelo representa un ejemplo práctico de cómo la simulación puede aplicarse para resolver problemas complejos del mundo real, proporcionando una herramienta valiosa para la gestión eficiente de sistemas de salud.