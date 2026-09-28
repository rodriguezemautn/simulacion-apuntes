# U7 — Formulario

> ⚠️ **Advertencia de honestidad**: en el deck de U7 **casi todas las fórmulas están en imagenes**. Lo que sigue distingue:
> - `[DATO]` = recuperado del texto de la cátedra.
> - `[ESTÁNDAR]` = fórmula **estándar de análisis numérico**, que **no pude verificar contra el deck** porque está en imagen. Usala para entender, **no la cites como "lo que dijo la cátedra"**.

---

## Lo que sí es de la cátedra `[DATO]`

### Diferencias finitas — la idea
```
sustituir una derivada por una diferencia
```

### Cálculo de Laplace — método
```
Se calcula VALOR POR VALOR.
La primera vez, los valores desconocidos se toman IGUAL A CERO.
```

### Relajación de Liebmann
```
Esquema con peso w.
Buena elección de w → ahorro de tiempo de cómputo de hasta 20:1.
```

---

## Formulario estándar `[ESTÁNDAR]`

> Recordá: estos son los **formatos corrientes** de diferencias finitas. El deck los muestra **como imagen**; no pude confirmar que use exactamente esta notación.

### Aproximaciones de derivadas (paso `h`)

**Primera derivada**
```
Hacia adelante:   u'(x) ≈ [u(x+h) − u(x)] / h        error O(h)
Hacia atrás:      u'(x) ≈ [u(x) − u(x−h)] / h        error O(h)
Central:          u'(x) ≈ [u(x+h) − u(x−h)] / (2h)   error O(h²)
```

**Segunda derivada**
```
u''(x) ≈ [u(x+h) − 2u(x) + u(x−h)] / h²              error O(h²)
```

### Serie de Taylor
```
u(x+h) = u(x) + h·u'(x) + (h²/2)·u''(x) + (h³/6)·u'''(x) + …
u(x−h) = u(x) − h·u'(x) + (h²/2)·u''(x) − (h³/6)·u'''(x) + …
```

### Estencil de Laplace (5 puntos)
Sobre una grilla con `h` constante en ambas direcciones:
```
u(i+1,j) + u(i−1,j) + u(i,j+1) + u(i,j−1) − 4·u(i,j) = 0

→  u(i,j) = [ u(i+1,j) + u(i−1,j) + u(i,j+1) + u(i,j−1) ] / 4
```
`[INFERENCIA]` Es la recurrencia a la que el deck llega *"multiplicando y renombrando"*, y la que justifica calcular **valor por valor** con los desconocidos inicializados en cero.

### Relajación (SOR) — familia del método de Liebmann
```
u_nuevo(i,j) = (1 − w)·u_viejo(i,j) + w·u_promedio_vecinos
```
- `w = 1` → Gauss-Seidel puro (sin sobre-relajación).
- `1 < w < 2` → sobre-relajación: acelera la convergencia. **Es el origen del ahorro 20:1 que cita la cátedra.**
- `w ≥ 2` → diverge.

`[INFERENCIA]` El método de Liebmann es la **sobre-relajación sucesiva (SOR)** aplicada al estencil de Laplace. El `w` que la cátedra menciona es el **factor de sobre-relajación**.

### Clasificación de EDP de 2.º orden
Para `A·u_xx + B·u_xy + C·u_yy + … = 0`, el **discriminante** `B² − 4AC`:
```
B² − 4AC < 0  →  ELÍPTICA     (ej. Laplace)
B² − 4AC = 0  →  PARABÓLICA   (ej. calor)
B² − 4AC > 0  →  HIPERBÓLICA  (ej. onda)
```
`[INFERENCIA]` Este es el discriminante que el deck presenta **como imagen**. Sirve para responder "¿cómo se clasifican?" — pero **aclarando que el desarrollo de la cátedra es solo el caso elíptico**.

---

## Lo que NO existe en U7

- ❌ Ninguna fórmula de **EDO**.
- ❌ **Euler**, **Runge-Kutta**, tamaño de paso, error, estabilidad.
- ❌ Desarrollo de **parabólicas** o **hiperbólicas**.
- ❌ Cualquier **ejemplo numérico** con valores.
- ❌ Cualquier **software**.
