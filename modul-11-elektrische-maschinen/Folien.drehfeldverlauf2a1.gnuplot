set table "Folien.drehfeldverlauf2a1.table"; set format "%.5f"
set samples 360.0; plot [x=0:0.3] 3 * cos(0.0556 * pi * x + pi * 2/3)
