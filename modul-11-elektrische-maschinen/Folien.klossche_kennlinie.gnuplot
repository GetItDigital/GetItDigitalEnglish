set table "Folien.klossche_kennlinie.table"; set format "%.5f"
set samples 200.0; plot [x=-16:8] -5 * (2 / (x / 0.96 + 0.96 / x))
