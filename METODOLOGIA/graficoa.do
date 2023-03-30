
 graph twoway connected var2 var4, xlabel(1 "1997-2002" 2 "2002-2005" 3 "2005-2009" 4 "2009-2014" 5 "2014-2020", grid labsize(vsmall)) ylabel(0 "0%" 10 "10%" 20 "20%" 30 "30%" 40 "40%" 50 "50%" 60 "60%", grid labsize(small)) ytitle("") xtitle("")  lpattern(line) color("232 155 36") mlabel(var2) mlabposition(top) mlabcolor("197 80 38") mlabsize(vsmall)
