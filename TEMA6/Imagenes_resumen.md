Resumen del Tema 6: Imágenes como datos
1. Dimensiones de las imágenes

En esta práctica aprendí a crear imágenes utilizando Python y NumPy. 
Primero hice una imagen en escala de grises de 5 × 5 píxeles, 
donde los tonos iban de oscuro a claro. Después creé una imagen a color de 4 × 4 píxeles, dividida en dos 
partes: una roja y otra azul. Esta última tiene tres canales de color: rojo, verde y azul, por eso su forma es (4, 4, 3).

2. Colores y valores de luminosidad

Para mi imagen elegí el rojo (255, 0, 0) y el azul (0, 0, 255).
Al convertirlos a escala de grises, el rojo obtuvo una luminosidad de 76.245 y el azul de 29.07.
Esto me permitió darme cuenta de que, aunque ambos colores tengan una intensidad máxima de 255 en uno de sus canales, 
no se ven igual de brillantes. El rojo tiene una luminosidad mayor que el azul.

3. Umbral de binarización

Para convertir la imagen en blanco y negro elegí un umbral de 50, 
porque se encuentra entre los valores de luminosidad del rojo y el azul. De esta manera, 
los píxeles rojos se representaron con el número 1 y los azules con el número 0.
Con esta actividad comprendí mejor que una imagen no solo está hecha para observarse,
sino que también contiene datos numéricos que podemos utilizar para realizar operaciones y analizar sus características.
