* Cargar el archivo de datos
use "C:\Users\m_ile\Downloads\esi_2023.dta", clear


* Inspeccionar las variables disponibles
describe

* Realizar un análisis descriptivo de la duración de la estancia
summarize


* Mantener solo las variables relevantes para el análisis
keep tip_movi anio_movi mes_movi dia_movi sex_migr nac_migr via_tran mot_viam pais_prod cont_res edad

drop nac_migr
drop pais_prod
* Crear variables binarias para cada tipo de movimiento
gen entrada = (tip_movi == 1)
gen salida = (tip_movi == 2)

* Modelo de Regresión Logística para Entradas
logistic entrada i.sex_migr i.via_tran i.mot_viam i.cont_res edad, coef

* Interpretación:
* - Este modelo estima la probabilidad de que un movimiento sea una entrada, dada la información del viajero y del viaje.

* Modelo de Regresión Logística para Salidas
logistic salida i.sex_migr i.via_tran i.mot_viam i.cont_res edad

* Interpretación:
* - Este modelo estima la probabilidad de que un movimiento sea una salida, considerando los mismos factores del viajero y del viaje.


// Generate a variable indicating whether the movement is an entry (1) or exit (0)
gen is_entry = (tip_movi == 1)

// Two-sample t-test to compare mean age between entries and exits
ttest edad, by(is_entry)

// Generate a variable indicating whether the traveler is male (1) or female (0)
gen is_male = (sex_migr == 1)

// Proportion test to compare the proportion of males between entries and exits
prtest is_male, by(is_entry)


* Crear una variable para el mes completo combinando el año y el mes
gen fecha_movi = ym(anio_movi, mes_movi)
format fecha_movi %tm

* Crear una variable de entradas y salidas
gen movi = ""
replace movi = "Entrada" if tip_movi == 1
replace movi = "Salida" if tip_movi == 2

* Calcular las frecuencias de entradas y salidas por mes
collapse (count) total_movi = tip_movi, by(fecha_movi movi)

* Generar un gráfico de barras apiladas para las frecuencias por mes
graph bar total_movi, over(fecha_movi) over(movi) stack ///
    title("Frecuencia de Entradas y Salidas por Mes") ///
    ytitle("Frecuencia") ///
    xtitle("Mes")

