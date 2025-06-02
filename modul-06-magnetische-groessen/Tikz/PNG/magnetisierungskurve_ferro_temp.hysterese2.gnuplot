set table "magnetisierungskurve_ferro_temp.hysterese2.table"; set format "%.5f"
set samples 25; plot [x=-6:6] 9/(1+0.4*exp(-1.1*x))-4.5
