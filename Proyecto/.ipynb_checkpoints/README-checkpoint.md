## Proyecto de Investigación: Análisis de los Ingresos Principales en Chile: Una Perspectiva Demográfica, Regional y Comparativa con el Sueldo Mínimo

El presente proyecto de investigación utiliza la Encuesta de Caracterización Socioeconómica Nacional 2022 (CASEN). El [enlace de descarga](https://observatorio.ministeriodesarrollosocial.gob.cl/storage/docs/casen/2022/Base%20de%20datos%20Casen%202022%20SPSS_18%20marzo%202024.sav.zip 'Casen 2022') nos entrega datos en formato .sav, el cual a efectos de tamaño de archivo no es el más eficiente. 

Recomiendo seguir los siguientes pasos en caso de clonar el repositorio (y no querer descargar el archivo en extensión .sav):

1. Abrir la Carpeta R y ejecutar el .Rproj en Rstudio.
2. Utilizar el script 'Casen2022_proc.R' ubicado en la carpeta script.
3. Ejecutar el script (hasta la línea 17), ya que el archivo Casen2022.sav fue convertido a formato .rds, pero desde aquí lo pasaremos a .csv para trabajarlo en Python.
4. Puedes continuar con el archivo .csv en Python o seguir con el archivo .rds en Rstudio, ya que presentan el mismo procesamiento.

**NOTA**: el procesamiento realizado en Python se hizo en datos con extensión .csv, la conversión se realizó en R, en caso de descargar los datos desde el link, asegurarse de leer los datos en formato .sav o en su defecto, convertirlos a .csv.

El repositorio presenta las siguientes carpetas:

- **Casen/**: Correspondiente a pdf de la misma encuesta y libro de código (excel).

- **input/**: Contiene datos de origen (carpeta data). 

- **output/**: Contiene datos procesados (carpeta data) y gráficas correspondientes (carpeta fig).

- **Python/**: Corresponde a procesamiento en Python de la encuesta CASEN (.csv).

- **R/**: Corresponde a conversión de formato de datos originales + procesamiento en R de la encuesta CASEN.
