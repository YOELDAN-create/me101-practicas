
# 1. Librerías
library(tidyverse)
library(e1071)

estudiantes_limpio_1_ <- read_csv("C:/Users/Yoel Dan/Downloads/estudiantes_limpio (1).xls")
View(estudiantes_limpio_1_)

head(df)
str(df)

media <- mean(df$nota, na.rm = TRUE)

mediana <- median(df$nota, na.rm = TRUE)

desv_std <- sd(df$nota, na.rm = TRUE)

varianza <- var(df$nota, na.rm = TRUE)

q1 <- quantile(df$nota, 0.25, na.rm = TRUE)

q3 <- quantile(df$nota, 0.75, na.rm = TRUE)

iqr <- IQR(df$nota, na.rm = TRUE)


cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("Desviación estándar:", desv_std, "\n")
cat("Varianza:", varianza, "\n")
cat("Q1:", q1, "\n")
cat("Q3:", q3, "\n")
cat("IQR:", iqr, "\n")


# ============================================================
# 5. SKEWNESS Y KURTOSIS
# ============================================================

skew_nota <- skewness(df$nota, na.rm = TRUE)

kurt_nota <- kurtosis(df$nota, na.rm = TRUE)

cat("Skewness:", skew_nota, "\n")
cat("Kurtosis:", kurt_nota, "\n")


# ============================================================
# 6. FUNCIÓN RESUMEN_ESTADISTICO
# ============================================================

resumen_estadistico <- function(vector, decimales = 4) {
  
  n <- sum(!is.na(vector))
  
  media <- mean(vector, na.rm = TRUE)
  
  mediana <- median(vector, na.rm = TRUE)
  
  desv_std <- sd(vector, na.rm = TRUE)
  
  cv_pct <- (desv_std / media) * 100
  
  return(list(
    n = n,
    media = round(media, decimales),
    mediana = round(mediana, decimales),
    desv_std = round(desv_std, decimales),
    cv_pct = round(cv_pct, decimales)
  ))
}


# Probar función con nota
print(resumen_estadistico(df$nota))


clasificar_dispersion <- function(cv_pct) {
  
  if (cv_pct < 15) {
    
    return("Baja")
    
  } else if (cv_pct < 30) {
    
    return("Moderada")
    
  } else {
    
    return("Alta")
  }
}

for (columna in c("nota", "asistencia_pct")) {
  
  resumen <- resumen_estadistico(df[[columna]])
  
  nivel <- clasificar_dispersion(resumen$cv_pct)
  
  cat("\nColumna:", columna, "\n")
  
  print(resumen)
  
  cat("Nivel de dispersión:", nivel, "\n")
}

