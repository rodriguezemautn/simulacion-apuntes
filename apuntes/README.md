# Apuntes — Simulación (UTN FRLP, Ing. en Sistemas de Información)

Directorio de estudio para el **examen final** de Simulación (Ord. 1877).
Alumno: Emanuel. Objetivo: llegar al final con las **8 unidades** cubiertas y entrenado para el formato real de examen.

---

## Regla de evidencia (no negociable)

Todo lo que se escriba acá respeta tres etiquetas:

- `[DATO]` — literal en el material de la cátedra o en la bibliografía (con cita de archivo).
- `[INFERENCIA]` — deducción propia, con la regla indicada.
- `[VERIFICAR]` — pendiente de confirmar contra la fuente.

No se escribe contenido "de manual" atribuido a la cátedra. Si la cátedra tiene una versión propia de un método, manda la de la cátedra.

---

## Estructura

```
apuntes/
├── README.md                     (este archivo: método y estado)
├── 00_plan/                      planificación de estudio y trazabilidad
├── U1..U8_/                      una carpeta por unidad del programa analítico
├── 90_transversal/               formulario, banco de preguntas, glosario
├── 95_fuentes-ocr/               texto OCR de las clases (los PDF son imágenes)
└── 99_simulacros/                exámenes de práctica con tiempo
```

### Convención dentro de cada unidad

| Archivo | Contenido |
|---|---|
| `teoria.md` | Los conceptos, en el orden y con la notación de la cátedra |
| `formulario.md` | Solo las fórmulas que la cátedra usa (con su versión, no la estándar si difieren) |
| `casos.md` | Ejemplos numéricos resueltos en clase y en la guía de TPs |
| `autoevaluacion.md` | Preguntas a desarrollar, en el formato del final |
| `dudas.md` | Lo que quedó flojo y hay que volver a atacar |

---

## Trazabilidad RA ↔ Unidad ↔ Horas (de la planificación)

| RA | Contenido | Unidad | Horas reloj |
|----|-----------|--------|-------------|
| RA01 | Modelado y simulación en casos reales; etapas; clasificación de modelos | U1 | 4,5 |
| RA02 | Genera VA desde números aleatorios, optimizando corridas | U2 | 9 |
| RA03 | Experiencia de Montecarlo con VA discretas y continuas | U3 y U4 | 9 |
| RA04 | Simulación discreta con metodología de la cátedra (Simul8) | U4 y U5 | 13,5 |
| RA05 | Simulación de procesos continuos con software específico | U7 y U8 | 9 |
| RA06 | ANOVA para optimizar selección de variables | U6 | 13,5 |
| RA07 | Superficie de respuesta y optimización económica | U6 | 9 |
| | | | **Σ 67,5** |

> `[DATO]` La suma de horas reloj de los RA (67,5) no coincide con el total declarado (72 h). Hay una semana sin asignar en el documento.

---

## Estado de cobertura

| Unidad | Carpetas de origen | Material propio | Estado |
|---|---|---|---|
| U1 | `00_Intro`, `01_Sistemas Modelos y Simulacion` | Resumen (incompleto) | OCR en curso |
| U2 | `02_Toma de Datos`, `03_Generacion de Num Aleatorios` | Resumen | pendiente |
| U3 | `05_Generacion de Variables Aleatorias` | Resumen | pendiente |
| U4 | `04_Metodo Montecarlo`, `10_Simulacion de Sistemas Discretos` | Resumen | pendiente |
| U5 | `06_Fenomenos de Espera`, `07_Teoria de Colas Fundamentos` | Resumen | pendiente |
| U6 | `08_Diseño de Experiencias`, `09_Analisis de Varianza` | **ninguno** | crítico |
| U7 | `11_Simulacion Continua` | **ninguno** | crítico |
| U8 | `10_Simulacion de Sistemas Discretos`, `12_Simulacion de Sisremas Dinamicos` | **ninguno** | crítico |

> `[DATO]` El resumen propio (`Resumen.pdf`) cubre U1–U5 y termina ahí. U6–U7–U8 están **sin material propio**.
> `[DATO]` U6 concentra el mayor peso horario (RA06 + RA07 = 22,5 h de 67,5).
> `[INFERENCIA]` El mapeo carpeta↔unidad es una propuesta: la numeración de las carpetas (00–12) **no** coincide con la numeración de unidades (U1–U8) del programa analítico.

---

## Método de estudio (tres pasadas por unidad)

1. **Pasada 1 — Entender**: leer el material OCR de la clase + los apuntes. Escribir `teoria.md` con las palabras de la cátedra.
2. **Pasada 2 — Fijar**: `formulario.md` + resolver `casos.md` sin mirar.
3. **Pasada 3 — Rendir**: responder `autoevaluacion.md` a mano, cronometrado, y **defenderlo en voz alta** (el final tiene oral de refuerzo).

---

## Pendientes inmediatos

- `[VERIFICAR]` Confirmar el mapeo carpeta↔unidad contra la secuencia real de clases.
- `[VERIFICAR]` Cuál de las versiones de "el proceso de simulación" usa la cátedra (hay al menos 3 en el material).
- `[VERIFICAR]` La notación Kendall de la cátedra es de 6 campos (`A|B|X|Y|Z|V`), no la de 5 estándar.
- `[DATO]` El método manual de ANOVA de la cátedra es propio (idiosincrático): no es el ANOVA estándar de dos vías.
