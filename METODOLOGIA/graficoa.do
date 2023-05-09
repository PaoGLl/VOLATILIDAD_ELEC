
 graph twoway connected var2 var4, xlabel(1 "1997-2002" 2 "2002-2005" 3 "2005-2009" 4 "2009-2014" 5 "2014-2020", grid labsize(vsmall)) ylabel(0 "0%" 10 "10%" 20 "20%" 30 "30%" 40 "40%" 50 "50%" 60 "60%", grid labsize(small)) ytitle("") xtitle("")  lpattern(line) color("232 155 36") mlabel(var2) mlabposition(top) mlabcolor("197 80 38") mlabsize(vsmall)

 
graph twoway (connected var2 var4) (connected var5 var4), xlabel(1 "1997-2002" 2 "2002-2005" 3 "2005-2009" 4 "2009-2014" 5 "2014-2020", grid labsize(vsmall)) ylabel(0 "0%" 10 "10%" 20 "20%" 30 "30%" 40 "40%" 50 "50%" 60 "60%", grid labsize(small)) ytitle("") xtitle("")  lpattern(line) color("232 155 36") mlabel(var2) mlabposition(top) mlabcolor("197 80 38") mlabsize(vsmall)




graph twoway (connected var2 var4,  mlabel(var2) mlabposition(top) mlabsize(vsmall)) (connected var5 var4, mlabel(var5) mlabposition(top) mlabsize(vsmall)) (connected var6 var4, mlabel(var6) mlabposition(top) mlabsize(vsmall)), scheme(sj) legend( order(3 2 1) row(1) symxsize(vsmall) size(small) label(1 "Forma 3") label(2 "Forma 2") label(3 "Forma 1")) ylabel(0(20)100, grid labsize(small)) xlabel(1 "1997-2002" 2 "2002-2005" 3 "2005-2009" 4 "2009-2014" 5 "2014-2020", grid labsize(vsmall))  xtitle("")




graph bar var8, over(year) asyvars bargap(30) ytitle("") ylabel(1(2)12) ///
  	bar(1, color("96 96 96") lwidth(*.50)) ///
	bar(2, color("112 112 112") lwidth(*.55)) ///
 	bar(3, color("128 128 128") lwidth(*.50)) ///
	bar(4, color("144 144 144") lwidth(*.50))  ///
	bar(5, color("gs11") lwidth(*.50))  ///
	bar(6, color("gs13") lwidth(*.50))  ///
	bar(7, color("gs16") lwidth(*.50)) ///
	legend(row(1) lab(1 "1997") lab(2 "2002") lab(3 "2005") lab(4 "2009") lab(5 "2014") lab(6 "2020") symxsize(zero) keygap(huge)) graphregion(color(white)) plotregion(style(none)) 
	