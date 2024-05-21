# Preparación de datos ---------------------------------------------------------

options(scipen=999)
rm(list=(ls()))

# Carga de paquetes ------------------------------------------------------------

pacman::p_load(haven, tidyverse, sjmisc)

# Carga de datos ---------------------------------------------------------------

# data = read_sav("../input/data/Casen2022.sav")
# saveRDS(data, "../input/data/Casen2022.rds") # Pasamos de .sav a .rds por tamaño del archivo
# rm(list=(ls()))

data = readRDS("../input/data/Casen2022.rds")
write.csv(data, "../input/data/Casen2022.csv") # Para trabajar con csv en Python a solicitud del profesor

# Exploración de variables -----------------------------------------------------

dim(data)
names(data)
head(data)


find_var(data, "ingreso")
find_var(data, "sueldo")

str(data)

frq(data$sexo)
frq(data$region)
frq(data$edad)
descr(data$edad)
frq(data$e6a_no_asiste)
frq(data$e6c_completo)
frq(data$y1)


# Procesamiento ----------------------------------------------------------------

datos_proc = data%>%
  mutate(sexo = case_when(sexo==1~"Hombre", sexo==2~"Mujer", T~NA_character_),
         edad_tr = case_when(edad>=18 & edad<=39~"Jovenes",
                             edad>=40 & edad<=64~"Adultos",
                             edad>=65~"Adultos mayores",
                             T~NA_character_),
         sexo_edad = case_when(sexo=="Mujer" & edad_tr=="Jovenes"~"Mujer joven",
                               sexo=="Mujer" & edad_tr=="Adultos"~"Mujer adulta",
                               sexo=="Mujer" & edad_tr=="Adultos mayores"~"Mujer mayor",
                               sexo=="Hombre" & edad_tr=="Jovenes"~"Hombre joven",
                               sexo=="Hombre" & edad_tr=="Adultos"~"Hombre adulto",
                               sexo=="Hombre" & edad_tr=="Adultos mayores"~"Hombre mayor",
                               T~NA_character_),
         e6a_no_asiste = case_when(e6a_no_asiste>=6 & e6a_no_asiste<=7~"Basica",
                                   e6a_no_asiste>=8 & e6a_no_asiste<=11~"Media",
                                   e6a_no_asiste==12~"Tecnico",
                                   e6a_no_asiste==13~"Universitaria",
                                   e6a_no_asiste>=14 & e6a_no_asiste<=15~"Postgrado",
                                   T~"Otro"),
         educa = case_when(e6a_no_asiste=="Otro"~"Otro nivel educativo",
                           e6a_no_asiste=="Basica"~"Educación Basica",
                           e6a_no_asiste=="Media"~"Educación Media",
                           e6a_no_asiste=="Tecnico" & e6c_completo==1~"Técnica completa",
                           e6a_no_asiste=="Tecnico" & e6c_completo==2~"Técnica incompleta",
                           e6a_no_asiste=="Universitaria" & e6c_completo==1~"Universitaria completa",
                           e6a_no_asiste=="Universitaria" & e6c_completo==2~"Universitaria incompleta",
                           e6a_no_asiste=="Postgrado" & e6c_completo==1~"Postgrado",
                           e6a_no_asiste=="Postgrado" & e6c_completo==2~"Universitaria completa",
                           T~NA_character_),
         region = case_when(region==1~"Región de Tarapacá",
                            region==2~"Región de Antofagasta",
                            region==3~"Región de Atacama",
                            region==4~"Región de Coquimbo",
                            region==5~"Región de Valparaíso",
                            region==6~"Región de O'Higgins",
                            region==7~"Región del Maule",
                            region==8~"Región del Biobío",
                            region==9~"Región de La Araucanía",
                            region==10~"Región de Los Lagos",
                            region==11~"Región de Aysén",
                            region==12~"Región de Magallanes y Antártica",
                            region==13~"Región Metropolitana",
                            region==14~"Región de Los Ríos",
                            region==15~"Región de Arica y Parinacota",
                            region==16~"Región de Ñuble",
                            T~NA_character_))%>%
  select(sexo, edad, edad_tr, sexo_edad, educa, region, ingreso=y1)%>%
  filter(!is.na(ingreso) & ingreso >=0 & edad>=18)%>%
  group_by(educa)%>%
  mutate(prom_ing_educ = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(educa, sexo_edad)%>%
  mutate(prom_ing_educa_sexo_edad = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(educa, sexo_edad, region)%>%
  mutate(prom_ing_educa_sexo_edad_region = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(region)%>%
  mutate(prom_ing_region = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(sexo_edad, region)%>%
  mutate(prom_ing_sexo_edad_region = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(educa, region)%>%
  mutate(prom_ing_educa_region = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(sexo_edad)%>%
  mutate(prom_ing_sexo_edad = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  group_by(sexo, educa)%>%
  mutate(prom_ing_sexo_educa = mean(ingreso, na.rm=T))%>%
  ungroup%>%
  mutate(prom_ing_educ = as.integer(prom_ing_educ),
         prom_ing_educa_sexo_edad = as.integer(prom_ing_educa_sexo_edad),
         prom_ing_educa_sexo_edad_region = as.integer(prom_ing_educa_sexo_edad_region),
         prom_ing_region = as.integer(prom_ing_region),
         prom_ing_sexo_edad_region = as.integer(prom_ing_sexo_edad_region),
         prom_ing_educa_region = as.integer(prom_ing_educa_region),
         prom_ing_sexo_edad = as.integer(prom_ing_sexo_edad),
         prom_ing_sexo_educa = as.integer(prom_ing_sexo_educa))

# Revisión de variables --------------------------------------------------------

frq(datos_proc$ingreso)
descr(datos_proc$ingreso)
frq(datos_proc$sexo)
frq(datos_proc$edad_tr)
frq(datos_proc$sexo_edad)
frq(datos_proc$educa)
frq(datos_proc$region)

# Guardar datos ----------------------------------------------------------------

saveRDS(datos_proc, "../output/data/Casen2022.rds")
