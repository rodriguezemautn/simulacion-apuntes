# U6 — Formulario

> Todo `[DATO]` del material de la cátedra. **Leé primero la advertencia del final: la cátedra usa un ANOVA que NO es el estándar.**

---

## Diseño de experimentos

### Modelo estructural y funcional
```
Ns = ∏ qᵢ              ← nº de celdas (k factores con qᵢ niveles)
Nf ≤ Ns                ← celdas efectivamente medidas (completo si Nf = Ns)
N  = p · q^k           ← total de corridas (p = repeticiones, diseño simétrico)
```

### Variable dominante (derivadas parciales de N)
```
∂N/∂p = q^k
∂N/∂q = p · k · q^(k−1)
∂N/∂k = p · q^k · ln q
```
La mayor de las tres **es la variable dominante**: la que más conviene ajustar para reducir el costo.

### Costo de un diseño
```
N = corridas totales
t = N · t_u                    (t_u = tiempo por corrida)
Costo = t · (costo por hora)
```

---

## ANOVA

### Factor de corrección y sumas de cuadrados
```
fc = T² / N                    (T = suma total de todos los datos, N = cantidad de datos)

SS_total  = Σxᵢ² − fc
SS_entre  = ΣMᵢ²/n − fc        (Mᵢ = media del grupo i, n = tamaño de cada grupo)
SS_dentro = SS_total − SS_entre
```

### Varianzas y test de Snedecor
```
V_entre  = SS_entre  / (k − 1)
V_dentro = SS_dentro / (N − k)

F = V_entre / V_dentro
```

### Caso de la cátedra (ancho de banda / throughput, 4 grupos × 5)
```
N = 20   ·   T = 741
fc      = T²/N = 27454,05
VG_comp = Σxᵢ² − fc       = 12046,95     (gl = 19)        → VG = 634,05
VI_comp = ΣMᵢ²/n − fc     = 5392,55      (gl = k−1 = 3)   → VI = 1797,51
VD      = (VG_comp − VI_comp)/(19 − 3) = 6654,4/16 = 415,19
F       = VI/VD = 1797,51/415,19 = 4,32
F_tabla = F_0,05;3;16 = 3,24
F > F_tabla  →  se rechaza H₀
```

---

## Superficie de respuesta (RSM)

```
Primer orden:    z = a + bλ + cμ
Segundo orden:   z = a + bx + cy + dxy + ex² + fy²
Función predicha: Y = β₀ + β₁x₁ + β₂x₂
```

**Calidad y significación**
```
R² = SSR / SST

F = (SSR / k) / (SSE / (n − k − 1))
```

**Caso resuelto (router M|M|1)**
```
Región:  30 ≤ λ ≤ 50   ·   60 ≤ μ ≤ 80          (3 niveles, 9 puntos)
Ajuste:  ẑ = 36,5 + 0,9x + 0,08y
SSR = 490,16   ·   SST = 680   ·   SSE = 189,83
R²  = 0,72
F   = 7,74   vs   F_0,05;2;6 = 5,143   →  significativa
Siguiente punto: descenso más rápido hacia (30, 60)
```

**Ejemplo de costo (k = 7, q = 4, p = 1000)**
```
N = 1000 · 4⁷ = 16.384 × 10⁶ corridas  ·  variable dominante: q
```

---

## Valores críticos de Fisher
La cátedra provee **`Tabla-F.pdf`** y **`TablaF05.pdf`** con los valores críticos de `F` para **α = 0,05** y **α = 0,10**. Es la tabla estándar.

---

## ⚠️⚠️ ADVERTENCIA CENTRAL

**El método manual de ANOVA de la cátedra NO es el estándar.** Dos rasgos:

1. **Unifactorial**: la cátedra compara **`F = Máx Varianza / Mín Varianza`**.
2. **Multifactorial**: usa **tablas de influencia combinada `D1/D2/D3`** (eliminando un factor por vez) y **tablas individuales `E1/E2/E3`**, y **reporta varianzas por factor y por par de interacciones**, sin tabla de ANOVA con un `F` por término.

**El ANOVA estándar de dos vías** (Montgomery, Walpole, y JMP) tiene en cambio:
```
SS_A, SS_B, SS_AB, SS_error
gl:  (a−1), (b−1), (a−1)(b−1), ab(n−1)
F por término = MS_término / MS_error     ← un F distinto por cada término
```
con notación `MS_entre` / `MS_dentro` (o `SSTr` / `SSE`) en lugar de `VI` / `VD`.

**Regla para rendir**: escribí **el método de la cátedra**. Si el oral se abre, mostrá que conocés el estándar y **por qué difieren** (la cátedra compara dispersiones; el estándar contrasta hipótesis). Esa distinción es la que te hace quedar bien, no mal.

**Para JMP sí se usa el estándar** (`Fit Model` + `Full Factorial` + `Effect Tests`), porque ahí la herramienta impone su propia tabla.
