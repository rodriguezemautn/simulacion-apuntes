# Estado del estudio — Simulación

**Última actualización**: 2026-09-24

## Objetivo

Rendir el **examen final** de Simulación. Dos fechas posibles: **13/10** (19 días) o **14–18/12** (≈12 semanas).
Decisión pendiente: por reglamento, si se puede rendir en octubre y **volver a rendir en diciembre sin penalidad**, la estrategia es *octubre como disparo, diciembre como red*.

## Documentado hasta ahora

| Archivo | Estado |
|---|---|
| `README.md` | Regla de evidencia, estructura, trazabilidad RA↔U↔horas, estado de cobertura |
| `U1_sistemas-y-modelos/teoria.md` | **Completo** (13 secciones, trazado a D1–D38) |
| `U1_sistemas-y-modelos/autoevaluacion.md` | **Parcial** — ver más abajo |
| `U1_sistemas-y-modelos/recursos-externos.md` | Completo (videos filtrados + texto UOC) |
| `U5_modelos-dinamicos-y-colas/teoria.md` | Completo |
| `U5_modelos-dinamicos-y-colas/formulario.md` | Completo |
| `U5_modelos-dinamicos-y-colas/autoevaluacion.md` | Completo |
| `U5_modelos-dinamicos-y-colas/recursos-externos.md` | Completo |
| `90_transversal/fuentes-externas.md` | Tutorial SimEvents M/M/1 registrado |
| `95_fuentes-ocr/` | Solo un OCR parcial de la Clase 1 (baja utilidad) |
| `U2_simulacion-y-aleatorios/` | teoría · formulario · **autoevaluación** · recursos externos |
| `U3_variables-aleatorias-continuas/` | teoría · formulario |

**Sin documentar**: U4, **U6 (crítico)**, U7, U8.

## Repositorio

Versionado en git y publicado: **https://github.com/rodriguezemautn/simulacion-apuntes**
Solo texto (28+ archivos). Quedan fuera `simulacion-ursada/` (9,5 G), `Matlab/` + `Matlab.rar` (14,7 G), `Bibliografia/` (958 M) y todos los binarios.

## Autoevaluación U1 — resultado

| Punto | Resultado |
|---|---|
| **1. Definiciones** | ✅ Aprobado con **4 marcas**: faltó *"y arte"* en simulación · dijo *simbólica* en vez de *abstracta* · omitió *física* en la lista · dijo *Frontera* en vez de *Ambiente* |
| **2. Formas de estudiar un sistema** | ✅ Aprobado con **1 error de anidamiento**: la rama *analítica/simulación* cuelga solo del **modelo matemático**, no de "físico o matemático" |
| **3. Proceso de simulación** | 🟡 **Los 10 pasos, en orden, perfectos** (=10/10 en la lista). **Falta explicar cada uno** — es el otro medio punto |
| **4. Verificación y validación** | 🔲 Pendiente |
| **5. Clasificación** | 🔲 Pendiente |

### Dato importante
El `Resumen.pdf` propio tenía **5 pasos** del proceso; en la evaluación recordó **los 10** sin mirar. **Sabe más de lo que su material dice.**

## Pendientes inmediatos (en orden)

1. Rendir la **evaluación de U2** (ya diseñada) y cerrar la de U1 (explicar los 10 pasos · Punto 4 · Punto 5).
2. Documentar **U6** (diseño de experiencias + ANOVA + RSM): es el **hueco crítico** y el bloque de mayor peso horario (22,5 de 67,5).
3. U7 y U8 (continuos, software, dinámica de sistemas).
4. U4.
5. Confirmar por reglamento si octubre y diciembre son compatibles.

## Trampas de examen ya identificadas

- **U1**: verificación ≠ validación · clasificación tiene **4 tablas**, no un eje · los ejemplos por celda son parte de la respuesta · *"modelo NO simulable: cuadro / simulable: plano de una casa"*.
- **U5**: Kendall de **6 campos** (`A|B|X|Y|Z|V`), no 5 · M/M/K, M/M/1/K y M/G/1 **no se derivan** en clase.
- **U6**: el ANOVA de la cátedra es **idiosincrático** (no es el estándar de dos vías) · la cátedra usa **JMP**.
