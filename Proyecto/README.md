## Proyecto de Investigación: Análisis de los Ingresos Principales en Chile: Una Perspectiva Demográfica, Regional y Comparativa con el Sueldo Mínimo

El presente proyecto de investigación utiliza la Encuesta de Caracterización Socioeconómica Nacional 2022 (CASEN). El [enlace de descarga](https://observatorio.ministeriodesarrollosocial.gob.cl/storage/docs/casen/2022/Base%20de%20datos%20Casen%202022%20SPSS_18%20marzo%202024.sav.zip 'Casen 2022') nos entrega datos en formato .sav, el cual a efectos de tamaño de archivo no es el más eficiente. 

Recomiendo seguir los siguientes pasos en caso de clonar el repositorio (y no querer descargar el archivo en extensión .sav):

1. Abrir la Carpeta `R` y ejecutar el `.Rproj`en RStudio.
2. Utilizar el script `Casen2022_proc.R` ubicado en la carpeta `R/script`.
3. Ejecutar el script (hasta la línea 17), ya que el archivo `Casen2022.sav` fue convertido a formato .rds, pero desde aquí lo pasaremos a .csv para trabajarlo en Python.
4. Puedes continuar con el archivo .RStudio en Python o seguir con el archivo .csv en Pyrhon, ya que presentan el mismo procesamiento.
 
   4.1. Para continuar con el procesamiento en Python debes dirigirte a la carpeta `Python` y ejecutar el archivo `Casen2022_proc.ipynb` y posteriormente ejecutar el script de análisis `Casen2022_analisis.ipynb`
   
   4.2. Para continuar con el procesamiento en RStudio prosigue ejecutando todo el script `Casen2022_proc.R`. Considera guardar los datos procesados en formato .csv y analizarlos en Python. Ya que no está completo el análisis en R (`Casen2022_analisis.R`)

**NOTA**: el procesamiento realizado en Python se hizo en datos con extensión .csv, la conversión se realizó en R, en caso de descargar los datos desde el link, asegurarse de leer los datos en formato .sav o en su defecto, convertirlos a .csv.

El repositorio presenta las siguientes carpetas:

- **Casen/**: Correspondiente a pdf de la misma encuesta y libro de código (excel).

- **Informe/**: Esta carpeta contiene el informe en $LaTeX$ (.tex) y en pdf. 

- **input/**: Contiene datos de origen (carpeta `data`). 

- **output/**: Contiene datos procesados (carpeta `data`) y gráficas correspondientes (carpeta `fig`).

- **Python/**: Corresponde a procesamiento en Python de la encuesta CASEN (.csv).

- **R/**: Corresponde a conversión de formato de datos originales + procesamiento en R de la encuesta CASEN.
