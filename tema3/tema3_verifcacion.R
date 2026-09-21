#PASO 6
notas <- c(11, 14, 20, 8, 16, 13)

primero <- notas[1]
ultimo <- notas[6]

print(primero)
print(ultimo)

#PASO 8
promedio <- mean(notas)
maximo <- max(notas)
cantidad_aprobados <- sum(notas >= 13.5)

print(promedio)
print(maximo)
print(cantidad_aprobados)

#PASO 9

library(tidyverse)

datos <- data.frame(
  nombre = c("Yoel", "Ana", "Carlos", "Maria", "Luis"),
  nota = c(15, 9, 18, 12, 8),
  asistencia_pct = c(19, 16, 18, 14, 17)
)

print(datos)

