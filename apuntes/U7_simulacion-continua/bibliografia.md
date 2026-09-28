# U7 — Bibliografía cruzada

> La situación de U7 es distinta a la de las otras unidades: **la bibliografía que el programa cita no existe en el directorio**, y el material propio **existe en tres copias** con distinto grado de legibilidad.

---

## 1. La bibliografía del programa: ausente

`[DATO]` El programa cita para U7:
- **Borelli y Coleman (2002)**, *Ecuaciones diferenciales — Una perspectiva de modelación* (Oxford)
- **M. Braun (1990)**, *Ecuaciones diferenciales y sus aplicaciones* (Iberoamérica)

`[DATO]` Búsqueda en todo el árbol del proyecto (`find -iname "*borelli*" -o -iname "*braun*"`): **cero resultados**.

**Ninguno de los dos está en el directorio, ni en versión legible ni escaneada.**

`[INFERENCIA]` Esto deja a U7 **sin respaldo bibliográfico para la parte de EDO** — que es justamente la parte que el deck tampoco da. Es el hueco más profundo de toda la materia.

---

## 2. El material propio existe en TRES copias

`[DATO]` El mismo deck de U7 está repetido:

| Ubicación | Págs. | Chars extraídos |
|---|---|---|
| `11_Simulacion Continua/Simulación Continua.pdf` | 26 | 6.035 |
| `simulacion-ursada/12- Ecuaciones diferenciales parciales (1).pdf` | 24 | **6.869** |
| `simulacion-ursada/Ecuaciones diferenciales parciales.pdf` | 12 | **7.049** |

`[DATO]` Las tres versiones tienen **el mismo texto** — se verificó comparando la introducción, que es idéntica palabra por palabra.

`[INFERENCIA]` **La copia de `simulacion-ursada` tiene un poco más de texto extraíble** que la de `11_Simulacion Continua`. Si vas a estudiar desde el texto, usá esa. Pero la diferencia es marginal: **las fórmulas siguen siendo imágenes en las tres**.

---

## 3. Qué se gana (y qué no) con las copias

`[DATO]` Con las copias de `simulacion-ursada` **sí se recupera** un poco más de contexto que con la del directorio principal:

- **La forma general de la EDP** se describe mejor: *"en que A, B, C, D, E, F y G son funciones de x e y (variables independientes). La variable dependiente es **u** y **los subíndices denotan derivación parcial**"*.
- **La clasificación** aparece como *"Si [fórmula] → Ecuación elíptica / parabólica / hiperbólica"* — o sea, **se confirma que el discriminante existe y decide los tres tipos**, aunque **la fórmula en sí sigue siendo imagen**.
- **Las ecuaciones de diferencias** traen más prosa: *"La definición clásica de la derivada… En una computadora digital **no podemos tomar límites**. Podemos sin embargo hacer que **h** tenga un valor pequeño (pero obviamente **no nulo**) y trataremos de demostrar que la aproximación es **suficientemente cercana (precisión)** y que **los errores no crecen** conforme continúa el proceso."*
- **Los campos de aplicación** se listan explícitamente: *ecuación de movimiento de los cuerpos · sistemas oscilantes · propagación de las ondas · transmisión de calor · difusión · movimiento de partículas subatómicas*.

`[DATO]` **Lo que NO se recupera en ninguna copia**: el discriminante, las fórmulas de Taylor y de diferencias, el error de truncamiento, el estencil de Laplace, la fórmula de Liebmann y su diagrama.

---

## 4. Veredicto

**No hay bibliografía usable para U7.** Ni la citada por el programa (ausente) ni una alternativa en `Bibliografia/`.

**Lo que hay que hacer**:
1. **Mirar el deck** — es la única fuente, y es un deck para *ver*, no para leer.
2. Si querés un desarrollo formal de diferencias finitas, Laplace y sobre-relajación, **hay que buscarlo afuera** del directorio. El `formulario.md` de esta unidad trae las formas **estándar** marcadas como tales, para que sepas qué estás aplicando aunque no puedas citarlas como "lo que dio la cátedra".

---

## 5. Advertencia para el oral

`[INFERENCIA]` Si te toca U7 y el tribunal repregunta, tené presente esta asimetría: **el programa promete EDO y el material no las da.** No inventes que "se dio EDO". Podés decir con honestidad: *"el material que tengo cubre diferencias finitas aplicadas a ecuaciones elípticas; la parte de EDO del programa no está desarrollada en las clases a las que tuve acceso"*. Eso es más defendible que improvisar un método numérico que la cátedra nunca mostró.
