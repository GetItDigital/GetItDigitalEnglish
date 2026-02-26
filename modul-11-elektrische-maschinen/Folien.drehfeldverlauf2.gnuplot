set table "Folien.drehfeldverlauf2.table"; set format "%.5f"
set samples 360.0; plot [x=0:36] 3 * cos(0.0556 * pi * x + pi * 2/3)
