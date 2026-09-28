# Resumen de limpieza de datos
## Dataset original
El dataset original tenía 6 filas y 4 columnas: nombre, curso, nota y asistencia_pct.
## Limpieza realizada
Después de revisar los datos se encontraron valores faltantes en las columnas `nota` y `asistencia_pct`.
Las filas que tenían la nota faltante fueron eliminadas porque la nota era necesaria para calcular los promedios por curso.
Los valores faltantes de `asistencia_pct` fueron reemplazados utilizando el promedio de esa columna.
## Resultado
El dataset pasó de 6 filas originales a 5 filas después de la limpieza.
Finalmente, se verificó que el dataset limpio no tuviera valores faltantes.
