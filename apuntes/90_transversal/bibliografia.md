# Bibliografía — mapa transversal

> Resultado de revisar las **49 fuentes** de `Bibliografia/` contra lo que enseña la cátedra.
> Alcance: U1, U2, U3, U5 (las unidades documentadas).

---

## 1. El hallazgo principal

**La bibliografía OBLIGATORIA de la cátedra es, en su mayoría, ILEGIBLE.**

Según `28 - Simulacion - ocr.pdf` (el propio programa de la cátedra), las fuentes obligatorias son **Shannon, Fishman, Law & Kelton, Coss Bu, Borelli-Coleman y Braun**. De todas ellas, en este directorio:

| Título obligatorio | Estado |
|---|---|
| **Shannon** — *Simulación de Sistemas* (caps. 1 a 5, y las 6 variantes de archivo) | **Escaneo sin capa de texto** |
| **Coss Bu** — *Simulación: un enfoque práctico* (2 archivos + variante) | **Escaneo sin capa de texto** |
| Fishman | ❌ **No está en el directorio** |
| Law & Kelton | ❌ **No está en el directorio** |
| Borelli-Coleman / Braun | ❌ **No están en el directorio** |

`[DATO]` El test de legibilidad: `pdftotext | wc -c` devuelve **≈ 1 carácter por página**. Es decir: no hay texto.

**Y ojo con esto**, porque es contraintuitivo: **las versiones `_ocr` de Shannon tampoco son legibles**. Dan exactamente el mismo conteo que las originales (`cap 1` = 874 chars, `cap 1 a 5` = 5336). Fueron OCR-eadas **como imagen**, no como texto. El sufijo `ocr` es engañoso.

`[INFERENCIA]` **Consecuencia práctica**: cuando la cátedra cita a Shannon o a Coss Bu, **no podés verificarlo contra la fuente**. Solo podés hacerlo por fuentes secundarias legibles. Eso es un riesgo real en un oral: si te piden "¿qué dice Shannon?" y citás de memoria, podés estar citando mal.

**La excepción valiosa**: `Librodesimulacion.pdf` (Castillón Domínguez) reproduce la **definición de Shannon casi textual** y sus **8 etapas coinciden exactamente** con la columna "Coss Bu" del cuadro que armó la cátedra. Es el puente legible hacia las fuentes que no se pueden leer.

---

## 2. Mapa de legibilidad completo

### Legibles y útiles

| Archivo | Págs. | Qué es |
|---|---|---|
| `Iversen.pdf` | 399 | Teletráfico. Erlang, M/M/n, M/G/1, Kendall extendido |
| `Teletraffic engineering Handbook.pdf` | 321 | Teletráfico. Little, Erlang, Kendall |
| `DESS-JBanks-4thEd.pdf` | 271 | Banks, *Discrete-Event System Simulation* 4ª ed. **La mejor metodología de U4 y el mejor catálogo de generación de U3** |
| `Fundamentals_of_queueing_theory.pdf` | 556 | Gross et al. 5ª ed. (2018). **Núcleo de U5** |
| `Taha.pdf` | 827 | Investigación de operaciones, **en español**, con **notación de 6 campos** |
| `Diseno_y_analisis_de_experimentos_Dougla.pdf` | 700 | Montgomery. DOE — para **U6** |
| `Walpole.pdf` | 816 | Probabilidad y estadística, español. Poisson + bondad de ajuste |
| `Papoulis.pdf` | 861 | Probabilidad. Solo sirve §7 (Montecarlo) |
| `Ross-Simulation ocr.pdf` | 157 | **Ross legible**. Núcleo de U3: generación, Montecarlo, TCL, intervalos |
| `Barcelo-simulacion_de_sistemas_discretos.pdf` | 247 | **Mejor cobertura U1/U2 en español** |
| `Librodesimulacion.pdf` | 177 | Castillón. **Mejor coincidencia directa con U1/U2** |
| `Simulacion_de_sistemas.pdf` | 79 | UPM, García Sánchez & Ortega Mier |
| `DH-Lehmer.pdf` | 431 | Actas del simposio Harvard 1949. **Contiene el paper de Lehmer** |
| `TestU01-Paper.pdf` | 40 | L'Ecuyer & Simard. Baterías de test de RNG |
| `MersenneTwister.pdf` | 28 | Matsumoto & Nishimura (1998) |
| `Leemis-Parks.pdf` | 10 | Extracto, §2.1 Lehmer RNG |
| `Efficient_PRNG_..._CUDA.pdf` | 27 | GPU Gems 3, cap. 37 |
| `Yates (1934).pdf` | 20 | **Fuente primaria del criterio FE ≥ 5** |
| `RED_Floyd.pdf` | 22 | Floyd & Jacobson (1993). **El algoritmo RED** |
| `Queueing Delays.pdf` | 12 | Medición de delay en routers |
| `Queueing-DNS-AMP.pdf` | 15 | DDoS sobre DNS, modelo de colas |
| `Capitulo2.pdf` | 17 | **Teoría de colas** (M/M/1, M/M/1/K, M/M/C) — es de U5, no de U1/U2 |
| `Optimizacion de una RS utilizando JMP.pdf` | 7 | RSM con JMP — **U6** |
| `28 - Simulacion - ocr.pdf` | 18 | Programa de la cátedra UTN FRLP |
| `simulacion_1150 - ocr.pdf` | 5 | Programa analítico viejo (Ord. 1150, plan 2008) |

### Escaneos — peso muerto

`Papoulis2.pdf` (433 págs.) · `kendall.pdf` · `Erlang1909.pdf` · `The Art of Computer Programming_Knuth.pdf` (**774 págs., 774 chars**) · `CossBu.pdf` · `Simulacion_-_Un_enfoque_Practico_-_Raul.pdf` (+ variante) · los **6 archivos de Shannon** · `Proyecto TF.pdf` · `Raúl Coss Bu... (tablas acomodadas).pdf`

---

## 3. Lo que hay que saber de cada título obligatorio

| Fuente | ¿Legible? | Cómo se reemplaza |
|---|---|---|
| **Shannon (1988)** | ❌ Escaneo | `Librodesimulacion.pdf` reproduce la definición casi textual |
| **Coss Bu (1993)** | ❌ Escaneo | `Librodesimulacion.pdf` da las **mismas 8 etapas** |
| **Fishman (1978)** | ❌ No está | `Banks` y `Ross` cubren lo mismo con más detalle |
| **Law & Kelton (2007)** | ❌ No está | `Banks` (§3.1) y `Fundamentals` |
| **Borelli-Coleman / Braun** | ❌ No están | Nada disponible en el directorio para U7 |

---

## 4. Regla de uso

1. **La cátedra manda.** La bibliografía sirve para (a) entender mejor y (b) detectar dónde la cátedra se aparta del libro.
2. **Cuando la cátedra y el libro discrepen**: en el examen, **contestá como la cátedra**; si el oral se abre, **mostrá que sabés la diferencia**. Eso suma.
3. **No cites de memoria una fuente que no pudiste leer.** Decir "Shannon dice…" sin haberlo leído es el tipo de riesgo que se paga caro en un oral.
