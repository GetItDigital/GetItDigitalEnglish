set table "magnetisierungskurve_ferro_temp.hysterese3.table"; set format "%.5f"
set samples 25; plot [x=-6:6] 9/(1+2.5*exp(-1.1*x))-4.5
