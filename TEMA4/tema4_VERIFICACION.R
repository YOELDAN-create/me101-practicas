library(readr)
estudiantes_1_ <- read_csv("C:/Users/Yoel Dan/Downloads/estudiantes (1).xls")
View(estudiantes_1_)

library(tidyverse)

# Leer CSV
df <- read_csv("C:/Users/Yoel Dan/Downloads/estudiantes (1).xls")

# Ver estructura y NA
glimpse(df)
colSums(is.na(df))

# Limpiar datos
df_limpio <- df %>%
  drop_na(nota) %>%
  mutate(
    asistencia_pct = replace_na(
      asistencia_pct,
      mean(asistencia_pct, na.rm = TRUE)
    )
  )

# Verificar NA
colSums(is.na(df_limpio))

# Promedio por curso
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(promedio_nota = mean(nota))

print(promedio_por_curso)

# Guardar
write_csv(df_limpio, "estudiantes_limpio_R.csv")

