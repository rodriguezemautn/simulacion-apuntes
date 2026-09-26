# U1 — Bibliografía cruzada

> Qué dice la bibliografía sobre cada tema de U1, y **dónde se aparta de la cátedra**.

---

## 1. Cobertura por tema

| Tema de la cátedra | ¿Dónde está? |
|---|---|
| **Definición de sistema** | `Librodesimulacion` 1.4.1: *"conjunto de elementos interrelacionados entre sí y con el medio circundante"*. `Simulacion_de_sistemas`: *"conjunto de elementos unidos por relaciones de interacción o interdependencia"* |
| **Definición de modelo** | `Librodesimulacion` 1.4.2: *"representación de la realidad por medio de abstracciones"* |
| **Definición de simulación (Shannon)** | `Librodesimulacion` la cita **casi textual** |
| **Cuadro "formas de estudiar un sistema"** | `Simulacion_de_sistemas`, Fig. 1 reproduce **el árbol exacto**. **`Barcelo` p. 64 atribuye el mismo diagrama a Law & Kelton [27]** |
| **El proceso de simulación** | ⚠️ **Ninguna fuente da 10 pasos.** Ver §2 |
| **Ventajas y desventajas** | `Librodesimulacion` 1.3.1/1.3.2 (7 ventajas de Naylor) · `Simulacion_de_sistemas` 1.6/1.7 (5 ventajas, 4 inconvenientes) + 1.8 *"principales errores"* · `Barcelo` pp. 62–66 |
| **Clasificación de sistemas** | ⚠️ **Parcial**. Ver §2 |
| **Clasificación de modelos** | `Librodesimulacion` 1.4.2 da **otra** taxonomía · `Simulacion_de_sistemas` cubre físico/analógico vs matemático |
| **Tipos de simulación / agentes** | ⚠️ Solo continuo vs discreto. Ver §2 |

---

## 2. Discrepancias con la cátedra

### 2.1 El proceso de simulación: nadie da 10 pasos
- **Cátedra: 10 pasos.** `Librodesimulacion` (p. 7) da **8**: *"1) Definir el sistema, 2) Formular el modelo, 3) Recopilar los datos, 4) Implementar el modelo en la computadora, 5) Validar, 6) Experimentar, 7) Interpretar, y 8) Documentar."*
- `Simulacion_de_sistemas` da un flujo de **6 fases** distinto.
- `Barcelo` lista las **6 "condiciones de utilización" de Shannon** (p. 116).
- `[INFERENCIA]` **Los 10 pasos son un recorte propio de la cátedra.** Y las 8 etapas de `Librodesimulacion` **coinciden exactamente** con la columna "Coss Bu" del cuadro comparativo que ya está en `U1/teoria.md`. O sea: el cuadro de la cátedra está bien armado, pero el número 10 no viene de la bibliografía.

### 2.2 Clasificación de sistemas: la cátedra tiene dos ejes que la bibliografía NO da
`[DATO]` Grep sobre **abierto/cerrado/aislado** y **estable/inestable** en las fuentes legibles: **cero resultados**.
- La bibliografía solo cubre tres pares: **estático/dinámico**, **determinista/estocástico**, **continuo/discreto** (`Simulacion_de_sistemas`).
- `Librodesimulacion` agrega *"descripción interna/externa"*.
- `[INFERENCIA]` Los ejes **abierto/cerrado/aislado** y **estable/inestable** son de **la cátedra**, no de la bibliografía. Si te los toman, la única fuente es el apunte.

### 2.3 Taxonomía de modelos: dos clasificaciones incompatibles
- **Cátedra** (D30-31): estático/dinámico · determinístico/estocástico · continuo/discreto · **físicos/analógicos** · **matemáticos/mental**.
- **`Librodesimulacion` 1.4.2**: *"abstractos y materiales. Los materiales se subdividen en **icónicos** y **analógicos o simbólicos**"*; y los modelos de simulación en *"determinísticos, estocásticos, estáticos, dinámicos y **a escala**"*.
- `[DATO]` **"Mental" no aparece en ninguna fuente legible.** Es terminología de la cátedra.

### 2.4 Los basados en agentes
`[DATO]` **Ninguna fuente legible cubre simulación basada en agentes ni discreta-continua.** `Simulacion_de_sistemas` y `Barcelo` solo distinguen continuo vs discreto.
`[INFERENCIA]` Es el contenido más "moderno" de la clase y **no tiene respaldo bibliográfico** en este directorio.

### 2.5 La atribución de Shannon
`[DATO]` La cátedra cita **"Shannon 1975"**; `Librodesimulacion` usa la misma redacción pero referencia la **edición Trillas de 1988**. El texto también difiere levemente (*"conducir"* vs *"llevar a cabo"*; *"entender"* vs *"comprender"*).
`[INFERENCIA]` No es grave, pero si te piden el año exacto, conviene saber que circulan **1975 y 1988** para la misma definición.

---

## 3. Aportes que la cátedra NO da

Fuera del programa, pero útiles si el oral se abre:

- **`Barcelo` (pp. 80–90)**: un ejemplo de toma de datos **mucho mejor** que el de la cátedra — **240 observaciones** de intervalos entre llegadas en una cabina de peaje, con histograma → coeficiente de variación → ajuste exponencial → **reajuste a gamma**.
- **`Librodesimulacion`**: batería de **tests de aleatoriedad** con fórmulas y ejemplos (corridas, huecos, póker, Yule, autocorrelación), usando corrección de continuidad de ±0.5.
- **`Librodesimulacion` 2.2.1.2**: el **procedimiento completo de Kolmogorov-Smirnov** con ejemplo resuelto — la cátedra lo nombra pero no lo desarrolla.
- **`Barcelo` p. 82**: la **regla de Sturges** en su forma doble: `k = ⌊1 + log₂ n⌋ = ⌊1 + 3,322 log₁₀ n⌋`.

---

## 4. Veredicto

**Usable para U1**: `Librodesimulacion.pdf` (definiciones, Shannon, 8 etapas), `Simulacion_de_sistemas.pdf` (taxonomía y el árbol de formas de estudiar), `Barcelo.pdf` (el árbol, atribuido a Law & Kelton).

**Peso muerto**: Shannon (6 archivos) y Coss Bu — **justamente las fuentes obligatorias**, ambas escaneadas. Ver `90_transversal/bibliografia.md`.
