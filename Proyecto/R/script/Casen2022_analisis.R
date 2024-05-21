# Limpiar entorno --------------------------------------------------------------

rm(list = ls())
options(scipen = 999)

# Cargar paquetes --------------------------------------------------------------

pacman::p_load(tidyverse, sjmisc, sjPlot, ggplot2)

# Cargar datos -----------------------------------------------------------------

data = readRDS("../output/data/Casen2022.rds")

# Plots ------------------------------------------------------------------------

frq(data$prom_ing_educa)

sjt.xtab(data$educa, data$sexo_edad,
         show.summary = T,
         show.col.prc = T,
         show.row.prc = T)

sjt.xtab(data$educa, data$sexo,
         show.summary = T,
         show.col.prc = T,
         show.row.prc = T)

sjt.xtab(data$educa, data$edad_tr,
         show.summary = T,
         show.col.prc = T,
         show.row.prc = T)

tabla = unique(datos_proc[, c("educa", "prom_ing_educa", "sexo_edad", "prom_ing_sexo")])
tabla = tabla[!is.na(tabla$prom_ing_sexo) & !is.na(tabla$sexo_edad) & !is.na(tabla$educa), ]

ggplot(tabla, aes(x = prom_ing_educa, y = educa)) +
  geom_col(fill = "skyblue") +
  geom_text(aes(label = prom_ing_educ), hjust = -1.5, size = 3, color = "black") +
  labs(x = "Promedio de Sueldos", y = "Nivel Educativo") +
  theme_minimal()



tabla$grupo = interaction(tabla$sexo_edad, tabla$educa)

ggplot(tabla, aes(x = grupo, y = prom_ing_sexo)) +
  geom_col(fill = "black") +
  geom_text(aes(label = prom_ing_sexo), hjust = 1.2, size = 3, color = "white") +
  labs(x = "Nivel educativo y Sexo/Edad", y = "Promedio de Ingresos") +
  coord_flip() +
  theme_minimal() +
  theme(axis.text.x = element_blank())
