#Author: Matthias Werle
#Date: 2023
#
#This file is licensed under a
#Creative Commons Attribution-ShareAlike 4.0 International License.
#
#You should have received a copy of the license along with this
#work. If not, see <http://creativecommons.org/licenses/by-sa/4.0/>.
#
# Plottet ein Zeigerdiagramm und eine Impedanzkurve für einen RLC-Serienschwingkreis.
# Erstellt eine Animation beider Darstellung für variable Kreisfrequenzen als GIF-Datei.

using Plots
using LaTeXStrings

################################################################################
# FUNCTIONS 
################################################################################

function plot_RLCs_impedanzkurve_I_konst(R,L,C,omegarange)

    # Impedanz und Reaktanzen auf R normiert
    f_XL(omega) = omega*L / R 
    f_XC(omega) = -1/(omega*C) / R
    f_Z(omega) = 1 + im*(f_XL(omega) + f_XC(omega)) 
    f_Zabs(omega) = abs(f_Z(omega))
    f_Zim(omega) = imag(f_Z(omega))

    # Plots auf R normiert
    plotobj = plot([0],[0], label=false, xlims=(0,5000), ylims=(-5,+5), grid=true, minorgrid=true, ticks=true, minorticks=5, xlabel=latexstring("\$\\omega\\ [Hz]\$"))
    plot!(omegarange, f_Zabs, lc=:purple, lw=2, label=latexstring("\$|Z|/R\$"))
    plot!(omegarange, f_Zim, lc=:pink, ls=:dash, label=latexstring("\$Im(Z)/R\$"))
    plot!(omegarange, f_XL, lc=:green, ls=:dash, label=latexstring("\$X_L/R\$"))
    plot!(omegarange, f_XC, lc=:orange, ls=:dash, label=latexstring("\$X_C/R\$"))
    plot!([0,5000],[0,0], lc=:grey, label=false) # x-axis, because framestyle = :zerolines works for setting x-axis to y=0 but also dminishes all ticks at axises 

    return plotobj
end


function plot_RLCs_impedanzkurve_I_konst_with_point(R,L,C,omegarange,omega)

    # Impedanz und Reaktanzen auf R normiert
    f_XL(omega) = omega*L / R 
    f_XC(omega) = -1/(omega*C) / R
    f_Z(omega) = 1 + im*(f_XL(omega) + f_XC(omega)) 
    f_Zabs(omega) = abs(f_Z(omega))
    f_Zim(omega) = imag(f_Z(omega))

    # Plots auf R normiert
    plotobj = plot([0],[0],label=false, xlims=(0,5000), ylims=(-5,+5), grid=true, minorgrid=true, ticks=true, minorticks=5, xlabel=latexstring("\$\\omega\\ [Hz]\$"))
    plot!(omegarange, f_Zabs, lc=:purple, lw=2, label=latexstring("\$|Z|/R\$"))
    plot!(omegarange, f_Zim, lc=:pink, ls=:dash, label=latexstring("\$Im(Z)/R\$"))
    plot!(omegarange, f_XL, lc=:green, ls=:dash, label=latexstring("\$X_L/R\$"))
    plot!(omegarange, f_XC, lc=:orange, ls=:dash, label=latexstring("\$X_C/R\$"))
    plot!([0,5000],[0,0], lc=:grey, label=false) # x-axis, because framestyle = :zerolines works for setting x-axis to y=0 but also dminishes all ticks at axises 

    scatter!([omega],[f_Zim], markersize=5, markercolor=:red, label=false)

    return plotobj
end


function plot_zeigerdiagramm_RLCs_Z_omega_I_konst(R,L,C,omega)
    # Eingeprägter Ström normiert auf I mit I rein reell
    I = 1 # I / I

    X_L = omega*L
    X_C = -1/(omega*C)

    # Beträge, normiert auf U_R
    U_R = 1         # I*R / (I*R) 
    U_L = abs(X_L/R)   # I*X_L / (I*R)
    U_C = abs(X_C/R)   # I*X_C / (I*R)

    xoff = 0.01
    yoff = 0.01
    
    plotobj = plot([0],[0], xlims=(0,+1.5), ylims=(-5,+5), grid=true, minorgrid=true, ticks=true, minorticks=5, label=false)
    plot!([0],[yoff], quiver=([I],[0]), st=:quiver, c=:red) # I
    quiver!([0],[-yoff], quiver=([U_R],[0]), c=:blue, label="U_R") # U_R
    quiver!([U_R+xoff],[0], quiver=([0],[U_L]), c=:green) # U_L
    quiver!([U_R],[U_L-yoff], quiver=([0],[-U_C]), c=:orange) # U_C
    quiver!([0],[0], quiver=([U_R],[U_L-U_C]), c=:purple)  # U_ges

    annotate!([0.2],[4], latexstring("\$\\omega = $(round(omega))\\ Hz\$"), valign = :top)
    annotate!([0.5],[0.4], latexstring("I/|I|"), valign = :top, :red)
    annotate!([0.5], [-0.5], latexstring("U_R/|U_R|"), valign = :top, :blue)
    annotate!([1.15], [U_L/2], latexstring("U_L/|U_R|"), valign = :left, :green)
    annotate!([0.85], [U_L-U_C/2], latexstring("U_C/|U_R|"), valign = :left, :orange)

    return plotobj
end

function plot_zeigerdiagramm_RLCs_Z_omega_I_konst_with_point(R,L,C,omega)
    # Eingeprägter Ström normiert auf I mit I rein reell
    I = 1 # I / I

    X_L = omega*L
    X_C = -1/(omega*C)

    # Beträge, normiert auf U_R
    U_R = 1         # I*R / (I*R) 
    U_L = abs(X_L/R)   # I*X_L / (I*R)
    U_C = abs(X_C/R)   # I*X_C / (I*R)

    xoff = 0.01
    yoff = 0.01
    plotobj = plot([0],[0], xlims=(0,+1.5), ylims=(-5,+5), grid=true, minorgrid=true, ticks=true, minorticks=5, label=false)
    plot!([0],[yoff], quiver=([I],[0]), st=:quiver, c=:red) # I
    quiver!([0],[-yoff], quiver=([U_R],[0]), c=:blue, label="U_R") # U_R
    quiver!([U_R+xoff],[0], quiver=([0],[U_L]), c=:green) # U_L
    quiver!([U_R],[U_L-yoff], quiver=([0],[-U_C]), c=:orange) # U_C
    quiver!([0],[0], quiver=([U_R],[U_L-U_C]), c=:purple)  # U_ges

    annotate!([0.2],[4], latexstring("\$\\omega = $(round(omega))\\ Hz\$"), valign = :top)
    annotate!([0.5],[0.4], latexstring("I/|I|"), valign = :top, :red)
    annotate!([0.5], [-0.5], latexstring("U_R/|U_R|"), valign = :top, :blue)
    annotate!([1.15], [U_L/2], latexstring("U_L/|U_R|"), valign = :left, :green)
    annotate!([0.85], [U_L-U_C/2], latexstring("U_C/|U_R|"), valign = :left, :orange)

    scatter!([U_R],[U_L-U_C], markersize=5, markercolor=:red, label=false)

    return plotobj
end
################################################################################
# VARIABLES 
################################################################################

R = 100
L = 0.1
C = 10e-6

omega = 1000
I = 1

# omega_g bei 1000 Hz, range logarithmisch von omega_g/zahl bis omega_g*zahl
#omegarange = 1000 * 10 .^ range(log10(1/4),log10(4), length=85) # 250 [1] ... 500 [22] ... 1000 [43] ... 2000 [64] ... 4000 [85], length=5+4*n, mit n = anzahl der samples in "..."
omegarange = 1000 * 10 .^ range(log10(1/5),log10(5), length=85) # 200 ... 1000 ... 5000, length=3+2*n

################################################################################
# SINGLE PLOTS 
################################################################################

plot_RLCs_impedanzkurve_I_konst(R,L,C,omegarange) # works
plot_zeigerdiagramm_RLCs_Z_omega_I_konst(R,L,C,omega) # works

################################################################################
# ANIMATING 
################################################################################


anim_impedanzkurve = @animate for omega in omegarange
    plot_RLCs_impedanzkurve_I_konst_with_point(R,L,C,omegarange,omega)
end
gif(anim_impedanzkurve, "RLC_Serienschwingkreis_Impedanzkurve_fps15.gif", fps=15)

anim_zeigerdiagramm = @animate for omega in omegarange
    plot_zeigerdiagramm_RLCs_Z_omega_I_konst(R,L,C,omega) # landet in /tmp
end
gif(anim_zeigerdiagramm, "RLC_Serienschwingkreis_Zeigerdiagramm_fps15.gif", fps=15)

plotZeiger(omega) = plot_zeigerdiagramm_RLCs_Z_omega_I_konst_with_point(R,L,C,omega)
plotOrt(omega) = plot_RLCs_impedanzkurve_I_konst_with_point(R,L,C,omegarange,omega)

anim_parallel_zeiger_ort = @animate for omega in omegarange
    plot( plotZeiger(omega), plotOrt(omega) , layout=(1,2)) # side by side
end
gif(anim_parallel_zeiger_ort, "RLC_Serienschwingkreis_Zeigerdiagramm_und_Impedanzkurve_fps15.gif", fps=15)
