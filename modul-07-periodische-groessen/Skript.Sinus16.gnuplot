set table "Skript.Sinus16.table"; set format "%.5f"
set samples 100.0; plot [x=0:8] (1.5 * sin(pi/2 * x)) * (1 * sin((pi/2) * x + (pi/2)))
