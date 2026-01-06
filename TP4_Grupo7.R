setwd("COMPLETAR") # Cambiar el argumento por la working directory propia

## Ejercicio 1 
datos_historicos <- read.csv("datos_historicos.csv")
play_delay_historico <- datos_historicos$play.delay # Vector con datos historicos

# Inciso a
mu_cero <- mean(play_delay_historico) # Media muestral
mu_cero
sigma2_cero <- var(play_delay_historico) # Varianza muestral
sigma2_cero

# Inciso b
hist(play_delay_historico, freq = FALSE, breaks = 20, main = "Histograma de datos históricos", xlab = "Play delay", ylab = "Densidad") # Histograma
curve(dnorm(x, mean = mean(play_delay_historico), sd = sd(play_delay_historico)), col = "cyan", lwd = 2, add = TRUE) # Normal con los datos historicos

## Ejercicio 2
datos_nuevos <- read.csv("datos_nueva_version.csv")
play_delay_nuevo <- datos_nuevos$play.delay # Vector con datos después de la actualización

# Inciso a
mu_nuevo <- mean(play_delay_nuevo) # Media con datos nuevos
mu_nuevo

## Ejercicio 4

# Inciso c
menorque <- function(x) {
  return(x < 42.9895)
}
Alpha <- seq(0.01, 0.1, 0.01)
Z_Alpha <- qnorm(1 - Alpha)
Umb_Critico <- Z_Alpha * 0.5120183 + 41.98465
Rechazo_H0 <- sapply(Umb_Critico, menorque)
tabla1 <- data.frame(Alpha, Z_Alpha, Umb_Critico, Rechazo_H0)
tabla1 # Decisiones tomadas para el conjunto de alphas con dos decimales

# Inciso d
Alpha <- seq(0.01, 0.1, 0.001)
Z_Alpha <- qnorm(1 - Alpha)
Umb_Critico <- Z_Alpha * 0.5120183 + 41.98465
Rechazo_H0 <- sapply(Umb_Critico, menorque)
tabla2 <- data.frame(Alpha, Z_Alpha, Umb_Critico, Rechazo_H0)
tabla2 # Decisiones tomadas para el conjunto de alphas con tres decimales

## Ejercicio 5

# Inciso a
set.seed(7)
n <- 200
sigma_cero <- sqrt(sigma2_cero)
sd_muestral <- (sigma_cero/sqrt(n)) # Bajo H0

Test_Hipotesis <- function() { # Genera datos y realiza un test de hipótesis
  
  
  nueva_muestra <- rnorm(n,mu_cero,sigma_cero)
  promedio_muestral <- mean(nueva_muestra)
  
  estadistico_obs <- (promedio_muestral-mu_cero)/sd_muestral
  z_alpha <- qnorm(1-0.05)
  
  Rechazo_H0 <- estadistico_obs > z_alpha
  # TRUE -> RECHAZO HIPOTESIS NULA
  # FALSE -> NO RECHAZO HIPOTESIS NULA
}

resultado <- Test_Hipotesis() # Test de hipótesis con nuevos datos generados
if(resultado) {cat("Rechazo H0")} else {cat("No rechazo H0")}

# Inciso b
set.seed(7)
decision_tomada <- function(x) { # Para generar un vector con las decisiones tomadas cada vez
  if(x) {return("Rechazo H0")} else {return("No rechazo H0")}
}

R <- 10000
decisiones <- replicate(R,Test_Hipotesis()) # Repetimos el test 10000 veces
rechazos <- sapply(decisiones, decision_tomada)
rechazos # Resultado de cada una de las simulaciones
porcentaje_correctos <- 1-mean(decisiones)
porcentaje_correctos # Proporción de test donde se decidió correctamente

## Ejercicio 6

# Inciso a
estadistico_obs <- (mu_nuevo-mu_cero)/sd_muestral
p_valor <- 1-pnorm(estadistico_obs)
p_valor

## Ejercicio 7
shapiro.test(play_delay_historico)
shapiro.test(play_delay_nuevo)