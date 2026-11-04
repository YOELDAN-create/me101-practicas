# PASO 9: RECONSTRUIR EL DATASET DEL TEMA 9


library(tidyverse)

# Crear el dataset original
datos <- data.frame(
  estacion = c(
    "Centro",
    "San Jerónimo",
    "Wanchaq",
    "San Sebastián",
    "Poroy"
  ),
  
  pm10_ugm3 = c(45, 28, 62, 35, NA),
  
  no2_ppb = c(
    18.2, 12.5, 25.4, 15.0, 9.8
  ),
  
  ruido_db = c(72, 58, 81, 65, 52)
)

# Establecer nombres de filas
rownames(datos) <- datos$estacion

# Seleccionar variables numéricas
datos_numericos <- datos %>%
  select(pm10_ugm3, no2_ppb, ruido_db)

# Imputar valores faltantes con la mediana
for (col in names(datos_numericos)) {
  
  mediana <- median(
    datos_numericos[[col]],
    na.rm = TRUE
  )
  
  datos_numericos[[col]][
    is.na(datos_numericos[[col]])
  ] <- mediana
}

# Construir matriz de correlación
matriz_corr <- cor(
  datos_numericos,
  method = "pearson"
)

# Mostrar resultados
cat("DATASET LIMPIO:\n")
print(datos_numericos)

cat("\nMATRIZ DE CORRELACIÓN:\n")
print(round(matriz_corr, 4))






# PASO 10: CONVERTIR LA MATRIZ A FORMATO LARGO

corr_larga <- as.data.frame(matriz_corr) %>%
  rownames_to_column(var = "variable_fila") %>%
  pivot_longer(
    cols = -variable_fila,
    names_to = "variable_columna",
    values_to = "correlacion"
  )

# Mostrar los datos en formato largo
print(corr_larga)

# Imprimir número de filas
cat(
  "\nNúmero de filas:",
  nrow(corr_larga),
  "\n"
)

# Verificar número de variables al cuadrado
cat(
  "Número esperado:",
  ncol(matriz_corr)^2,
  "\n"
)









# PASO 11: HEATMAP CON GGPLOT2

grafico <- ggplot(
  corr_larga,
  aes(
    x = variable_columna,
    y = variable_fila,
    fill = correlacion
  )
) +
  
  # Crear los cuadros del mapa de calor
  geom_tile(
    color = "white",
    linewidth = 1
  ) +
  
  # Mostrar los valores de correlación
  geom_text(
    aes(label = sprintf("%.3f", correlacion)),
    color = "black",
    size = 4
  ) +
  
  # Escala de colores divergente
  scale_fill_gradient2(
    low = "#2166AC",
    mid = "white",
    high = "#B2182B",
    midpoint = 0,
    limits = c(-1, 1),
    name = "Correlación"
  ) +
  
  # Títulos y etiquetas
  labs(
    title = "Mapa de Calor de Correlación Ambiental",
    x = "Variables ambientales",
    y = "Variables ambientales"
  ) +
  
  # Mantener las proporciones de los cuadros
  coord_fixed() +
  
  # Diseño del gráfico
  theme_minimal() +
  
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 14
    ),
    
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )

# Mostrar gráfico
print(grafico)

# Guardar imagen
ggsave(
  filename = "heatmap_pheatmap_sin_agrupar.png",
  plot = grafico,
  width = 8,
  height = 6,
  dpi = 300
)

#TAREA 3
# =====================================================
# PASO 13: HEATMAP CON AGRUPAMIENTO JERARQUICO
# =====================================================

library(pheatmap)

# Paleta de colores
colores <- colorRampPalette(
  c("#2166AC", "white", "#B2182B")
)(100)

# Crear y mostrar el grafico
grafico_agrupado <- pheatmap(
  matriz_corr,
  
  color = colores,
  breaks = seq(-1, 1, length.out = 101),
  
  display_numbers = TRUE,
  number_format = "%.3f",
  
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  
  fontsize = 12,
  fontsize_number = 12,
  
  border_color = "gray80",
  
  main = "Heatmap con Agrupamiento Jerarquico"
)

# Guardar el grafico como imagen PNG
png(
  "heatmap_pheatmap_agrupado.png",
  width = 2400,
  height = 1800,
  res = 300
)

grid::grid.newpage()
grid::grid.draw(grafico_agrupado$gtable)

dev.off()

# ============================================================
# PASO 14: HEATMAP SIN AGRUPAMIENTO JERARQUICO
# ============================================================

# Construir heatmap sin agrupamiento
pheatmap(
  matriz_corr,
  
  # Mantener la misma escala de colores
  color = colores,
  breaks = cortes,
  
  # Mostrar valores numericos
  display_numbers = TRUE,
  number_format = "%.3f",
  
  # Personalizacion
  fontsize = 12,
  fontsize_number = 12,
  fontsize_row = 11,
  fontsize_col = 11,
  
  border_color = "gray80",
  
  # Desactivar agrupamiento jerarquico
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  
  # Titulo
  main = "Correlacion Ambiental sin Agrupamiento Jerarquico",
  
  # Guardar imagen
  filename = "heatmap_pheatmap_sin_agrupar.png",
  
  width = 8,
  height = 6
)

