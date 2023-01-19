
********************************************************************************
*								2012
********************************************************************************

clear all
use "C:\Users\Usuario\Documents\GitHub\VOLATILIDAD_ELEC\Censo 2012\DBpersonas2012vf_2.dta", clear

keep mzn urbrur p29a p29c p30b p35 p37a p37a_niveln p37b p38a p38b p39 p43 p44b 
*------------------------------
*	TRATAMIENTO DE VARIABLES
*------------------------------

*** area
cap drop area
gen area =(urbrur==1)
label define area 1 "urbano" 0 "rural"
label values area area

*** nación o pueblo indígena
cap drop pioc 
gen pioc=(p29a==1)
replace pioc=. if p29a==3 | p29a==9
label define pioc 1 "si pertenece" 0 "no pertenece"
label values pioc pioc

*** analfabetismo
cap drop anf
gen anf=(p35==1)
replace anf=. if p35==9 | p35==.
label define anf 1 "Si" 0 "No"
label values anf anf

*** culmino primaria 
cap drop nn_r
gen nn_r=1 if p38a==1
replace nn_r=1 if p38a==2 & p38b==1
replace nn_r=1 if p38a==4 & (p38b>=1 & p38b<=6)
replace nn_r=1 if p38a==6
replace nn_r=2 if p38a==2 & (p38b==2 | p38b==3)
replace nn_r=2 if p38a==3 | p38a==5 | p38a==7
replace nn_r=2 if p38a==4 & (p38b==7 | p38b==8)


rename p37a_niveln nivel
cap drop prim
gen prim=1 if nivel>=9 & nivel<=14
replace prim=1 if (nivel>=15 & nivel<=18) & (nn_r==2)
replace prim=0 if (prim!=1 & nivel!=.)
label define prim 1 "Culmino primaria" 0 "No culmino primaria"
label values prim prim 


*** ocupado 
cap drop ocu
gen ocu=(p39==1)
replace ocu=. if p39==.
label define ocu 1 "Ocupado" 0 "Desocupado"
label values ocu ocu 

*** informales
cap drop inf
gen inf=1 if p43==2 | p43==3 | p43==6
replace inf=0 if p43==1 | p43==4 
label define inf 1 "Trabajador informal" 0 "Trabajador formal"
label values inf inf 

*--------------------------
*		PROPORCIONES
*--------------------------

gen nro=1
egen tot=sum(nro), by(mzn)

*** pioc
cap drop tot_pioc
egen tot_pioc=sum(pioc), by(mzn)
gen prop_pioc=(tot_pioc/tot)*100

*** analfabetismo
cap drop tot_anf
egen tot_anf=sum(anf), by(mzn)
gen prop_anf=(tot_anf/tot)*100

*** culmino primaria 
cap drop tot_prim
egen tot_prim=sum(prim), by(mzn)
gen prop_prim=(tot_prim/tot)*100

*** ocupado 
cap drop tot_ocu
egen tot_ocu=sum(ocu), by(mzn)
gen prop_ocu=(tot_ocu/tot)*100

*** informalidad
cap drop tot_inf
egen tot_inf=sum(inf), by(mzn)
gen prop_inf=(tot_inf/tot)*100


preserve
keep mzn tot_pioc tot_anf tot_prim tot_ocu tot_inf prop_pioc prop_anf prop_prim prop_ocu prop_inf
local list="tot_pioc tot_anf tot_prim tot_ocu tot_inf prop_pioc prop_anf prop_prim prop_ocu prop_inf"
collapse `list', by(mzn) 
export excel "C:\Users\Usuario\Documents\GitHub\VOLATILIDAD_ELEC\Censo 2012\pp_2.xlsx", replace firstrow(variable) 
restore

********************************************************************************
*								2001
********************************************************************************

clear all

import excel "C:\Users\Usuario\Documents\GitHub\VOLATILIDAD_ELEC\Censo 2001\Base en Excel 2001.xlsx", clear first //el first asume que la primera fila sea los nombres de las variables


keep  Municipio Area_u Area_r p29_t p36_* p42_* p46_* p49_*

local list="Area_u Area_r p29_t p36_* p42_* p46_* p49_*"
collapse (sum) `list', by(Municipio) 
save "C:\Users\Usuario\Documents\GitHub\VOLATILIDAD_ELEC\Censo 2001\Censo mod 2001.dta", replace


*------------------------------
*	TRATAMIENTO DE VARIABLES
*------------------------------

rename Area_u urb
rename Area_r rural
rename p29_t tot
rename p36_1 anf
rename p42_1 ocu

gen n=_n

*pioc 
cap drop tot_pioc
egen tot_pioc=rsum(p49_1 p49_2 p49_3 p49_4 p49_5 p49_6), m
gen prop_pioc=(tot_pioc/tot)*100

*analfabetismo
cap drop prop_anf
gen prop_anf=(anf/tot)*100

*** ocupado 
cap drop prop_ocu
gen prop_ocu=(ocu/tot)*100

*** informalidad
cap drop tot_inf
egen tot_inf=rsum(p46_4 p46_5 p46_6), m
gen prop_inf=(tot_inf/tot)*100
 


export excel "C:\Users\Usuario\Documents\GitHub\VOLATILIDAD_ELEC\Censo 2001\Censo final 2001.xlsx", replace firstrow(variable) //firstrow es para conservar el nombre de las variables 




************************

egen aux1=sum(p29_t)
cap drop aux2 
gen aux2=(p29_t/aux1)*100

egen aux3=sum(aux2)


 









