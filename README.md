# Simulación — documentación de estudio

Repositorio de **documentación** de la asignatura **Simulación** (UTN Facultad Regional La Plata, Ingeniería en Sistemas de Información, Ordenanza 1877).

Acá **no** está el material crudo de la cátedra (PDFs, presentaciones, videos, bibliografía). Eso vive fuera del repo: es binario, pesa gigas y no se puede diferenciar. **Acá está el producto del estudio**: la planificación, las transcripciones y los apuntes.

---

## Regla de evidencia

Todo enunciado de contenido lleva una etiqueta:

- `[DATO]` — literal en el material de la cátedra o en la bibliografía, con cita de origen (`D12`, `línea 40`, etc.).
- `[INFERENCIA]` — deducción propia, con la regla indicada.
- `[VERIFICAR]` — pendiente de confirmar contra la fuente.

**No se escribe contenido "de manual" atribuido a la cátedra.** Si la cátedra tiene una versión propia de un método, manda la de la cátedra.

---

## Estructura

```
.
├── README.md                            este archivo
├── Simulacion_Planificacion_Ord1877.md  planificación oficial (es el programa de examen)
├── apuntes/                             el sistema de estudio
│   ├── README.md                        método y estado de cobertura
│   ├── 00_plan/                         planificación del estudio
│   ├── U1..U8_/                         una carpeta por unidad del programa analítico
│   ├── 90_transversal/                  formulario, banco de preguntas, glosario
│   ├── 95_fuentes-ocr/                  texto OCR de material que solo existe como imagen
│   └── 99_simulacros/                   exámenes de práctica
└── <carpetas de la cátedra>/            solo se versionan los .md, .txt y .m
```

### Convención dentro de cada unidad

| Archivo | Contenido |
|---|---|
| `teoria.md` | Los conceptos, en el orden y con la notación de la cátedra |
| `formulario.md` | Solo las fórmulas que la cátedra usa (con su versión, no la estándar si difieren) |
| `casos.md` | Ejemplos numéricos resueltos en clase y en la guía de TPs |
| `autoevaluacion.md` | Preguntas a desarrollar, en el formato del final |
| `recursos-externos.md` | Videos y textos complementarios, con lo que aportan y lo que NO |

---

## Cobertura actual

| Unidad | Estado |
|---|---|
| U1 — Sistemas y modelos | teoría · autoevaluación · recursos externos · bibliografía |
| U2 — Toma de datos, bondad de ajuste, números aleatorios | teoría · formulario · autoevaluación · recursos externos · bibliografía |
| U3 — Variables aleatorias continuas y Montecarlo | teoría · formulario · bibliografía |
| U4 — Sistemas discretos y Simul8 | teoría |
| U5 — Modelos dinámicos y colas | teoría · formulario · autoevaluación · recursos externos · bibliografía |
| U6 — Diseño de experiencias, ANOVA y RSM | **pendiente (crítico)** |
| U7 — Simulación continua | pendiente |
| U8 — Software de simulación y dinámica de sistemas | pendiente |

El cruce de la **bibliografía** contra las unidades documentadas está en [`apuntes/90_transversal/bibliografia.md`](apuntes/90_transversal/bibliografia.md) — incluye el hallazgo de que **la bibliografía obligatoria de la cátedra (Shannon, Coss Bu) está escaneada y no es legible**.

El detalle del estado, las trampas de examen detectadas y los pendientes están en [`apuntes/00_plan/estado.md`](apuntes/00_plan/estado.md).

---

## Qué queda fuera del repo

Material que **no** se versiona, a propósito:

| Excluido | Peso aprox. | Por qué |
|---|---|---|
| `simulacion-ursada/` | 9.5 G | PDFs, videos, instaladores |
| `Matlab/` y `Matlab.rar` | 14.7 G | instalación de software |
| `Bibliografia/` | 958 M | libros en PDF (binarios y con derechos) |
| `*.zip` | 285 M+ | comprimidos |
| PDFs y presentaciones de cada unidad | variable | binarios sin diff |

Los únicos archivos **no** markdown que se versionan son 3 scripts `.m` de la carpeta de números aleatorios, porque son **el código de la cátedra** (generador congruencial) y son texto.

---

## Notas

- Los PDFs de las clases son, en gran parte, **imágenes** (powerpoint impreso a PDF). Por eso existen las transcripciones `.md`: son la forma de tener ese contenido en texto.
- Cuando una unidad no tenga transcripción, la fuente se transcribe a demanda, no se procesa en masa.

---

## Origen y uso del material

- Las transcripciones de las presentaciones de clase son de **uso académico personal** y reproducen material cuyos derechos pertenecen a sus autores: la cátedra de Simulación de la UTN FRLP (Prof. Bernardo G. López Armengol; Francisco Roqué; Leslie Monges).
- `Simulacion_Planificacion_Ord1877.md` es la transcripción de un **documento oficial** de la Universidad Tecnológica Nacional — Facultad Regional La Plata.
- Los apuntes, resúmenes y formularios de `apuntes/` son de elaboración propia a partir de ese material.
- Se omitieron datos de contacto personales de terceros.
