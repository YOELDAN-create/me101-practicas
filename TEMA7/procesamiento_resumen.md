
1. Figuras dibujadas
En esta práctica creé una imagen de 120 × 120 píxeles utilizando la librería Pillow. 
Dibujé un círculo amarillo, un triángulo verde y una estrella roja sobre un fondo azul oscuro. 
Después guardé la imagen en formato PNG y comprobé sus dimensiones, 
su modo de color y algunos píxeles para verificar que las figuras se habían creado correctamente.

2. Comparación de escala de grises
Convertí la imagen a escala de grises utilizando dos metodos: 
convert("L") de Pillow y color.rgb2gray() de scikit-image. 
Al comparar el píxel del fondo, observé que los resultados eran muy parecidos, 
aunque existía una pequeña diferencia. 
Esto ocurre porque ambas librerías utilizan diferentes ponderaciones para calcular la intensidad de los tonos grises.

3. Umbral de Otsu
Utilicé la función threshold_otsu() de scikit-image para calcular automáticamente el umbral de la imagen.
Luego convertí la imagen a blanco y negro, clasificando los píxeles según su intensidad. 
Finalmente, calculé la proporción de píxeles que quedaron por encima del umbral para conocer qué parte de la imagen se clasificó como blanca.

4. Conclusión
Con esta práctica aprendí a crear y modificar imágenes con Python, aplicar filtros y trabajar con los píxeles utilizando NumPy y scikit-image. 
También comprendí que Pillow es útil para realizar modificaciones básicas, mientras que scikit-image facilita el análisis de imágenes.
Considero que ambas librerías son importantes porque permiten realizar diferentes tareas de procesamiento de imágenes de manera sencilla.
