

import excel "H:\Mi unidad\2022\EN DEMOCRACIA\VOLATILIDAD ELECTORAL\datos diego\Votos Totales 2009.xlsx", clear first 

 collapse (sum)  AS BSD GENTE MASIPSP MUSPA PPBCN PULSO UN BLANCOS EMITIDOS NULOS VALIDOS, by(CodigoMUNICIPIO)

export excel "H:\Mi unidad\2022\EN DEMOCRACIA\VOLATILIDAD ELECTORAL\datos diego\Mod Votos Totales 2009.xlsx", replace firstrow(variable) 
