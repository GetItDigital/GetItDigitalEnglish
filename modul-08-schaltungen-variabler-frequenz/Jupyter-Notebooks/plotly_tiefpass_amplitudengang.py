# https://plotly.com/python/sliders/
# leicht modifiziert

import numpy as np
import plotly.graph_objects as go
import plotly.express as px
import plotly.tools as tools
os = tools.os

# Variables
try:
    __file__
except NameError:
    print("__file__ not defined. Maybe commands not called from file. Use default filename to write")
    cwd=os.path.abspath(os.path.curdir)
    filename="test_defaultname.py"
    #filename=os.path.join(os.path.abspath(os.path.curdir),filename)
    filename
else:
    print("__file__ defined. Assume script is called from file. Use that as basefilename for output files")
    filename=os.path.basename(__file__) # should match filename of current script without absolute path
    filename

# Create figure
fig = go.Figure()

fig.update_layout(
    title="Amplitudengang Tiefpass 1. Ordnung",
    xaxis_title="ω [Hz]",
    yaxis_title="A(ω,ω_g)",
)

# Frequenzbereich
omegarange = np.logspace(2,5,num=301,endpoint=True,base=10.0) # Frequenz, 100 steps/Dek, static
omegagrange = np.logspace(2,5,num=16,endpoint=True,base=10.0) # Grenzfrequenz, 5 steps/Dek, adjustable

# Add traces, one for each slider step
for omegag in omegagrange:
    fig.add_trace(
        go.Scatter(
            visible=False,
            #line=dict(color="#00509B", width=4),# blue
            #name="ω_g = " + str(int(np.around(omegag))) + " Hz", # für senkrechte Plots...
            line=dict(color="#0000FF", width=4),# red
            name="A(ω)",
            x=omegarange,
            y=( 1 + (np.divide(omegarange,omegag))**2)**(-0.5) # 1/(1+(w/wg)^2)^0.5
        )
    )
    
# Add traces for static values (-6 dB Grenze)
fig.add_trace(
    go.Scatter(
        visible=True,# always visible
        line=dict(color="#FFFFFF", width=2),
        name="-6 dB",
        x=omegarange,
        y=1/2**0.5 * np.ones(len(omegarange))
    )
)

# set initial visibilty before slider adjustments
fig.data[0].visible = True # toggle-able by slider
for trace in fig.data[len(omegagrange):]: # everything after the 'stepable' A(w,wg) plots
    trace.visible = True

# Create and add slider
steps = [] 
for i in range(len(omegagrange)): # toggle-able plots by omegag-slider
    step = dict(
        method="update",
        args=[{"visible": [False] * len(fig.data)},
              #{"title": "Slider switched to wg: " + str(int(np.around(omegagrange[i],decimals=0))) + " [Hz]" },
              ],  # layout attribute
    )
    step["args"][0]["visible"][i] = True  # Toggle i'th trace to "visible" (A(w,wg=omegagrange[i]))
    for j in range(len(omegagrange),len(fig.data)):
        step["args"][0]["visible"][j] = True # Set all static traces to "visible"
    step["label"]= str(int(np.around(omegagrange[i],decimals=2))) + " Hz"  # instead of default labels "step-1", "step-2" ...
    steps.append(step)

sliders = [dict(
    active=1,
    currentvalue={"prefix": "ω_g = "},
    pad={"t": 10}, # ??? was 50 ... like step nr ... dunno
    steps=steps
)]

fig.update_xaxes(showline=True, linewidth=2, linecolor='black', type="log")
fig.update_yaxes(showline=True, linewidth=2, linecolor='black', type="log")

fig.update_xaxes(range=[2, 5],ticks="outside", ticklen=5, tickwidth=2, tickcolor='black')
#fig.update_xaxes(tickmode="array",
#                    tickvals = [10**1,10**2,10**3,10**4,10**5], 
#                    ticktext = ["10 Hz","100 Hz", "1 kHz", "10 kHz", "100 kHz"]
#                ) # nice for major ticks, killed aber minor ticks, da diese linear gesetzt werden [10, 20, 30, ... 100, 110, ... 200, 210, ... 990, 1000, ...]
fig.update_xaxes(minor=dict(ticks="inside", ticklen=6, tickwidth=1, showgrid=True)) # schön bei 1, 2, 3, 4, ..., aber major ticks blöd (deckungsgleich)
fig.update_yaxes(range=[-4, np.log10(2)],ticks="outside", ticklen=5, tickwidth=2, tickcolor='black')

fig.update_layout(separators=",")
fig.update_layout(plot_bgcolor="#B4BEC3")
fig.update_layout(
    sliders=sliders
)


# Show Figure
#fig.show()

# Save Figure in ./output/
dir_out = os.path.abspath( os.path.join( os.path.curdir, "output" ))
if not os.path.isdir(dir_out) :
    os.mkdir("output")
print("\nSave output files in\n\t", dir_out)

for type in ["png","jpg","webp","svg","pdf"]: # eps, json?
    try:
        filepath_out = os.path.join( dir_out, os.path.splitext(filename)[0]+'.'+type )
        fig.write_image(filepath_out,type) # this one needs python package kaleido installed
    except NameError:
        print("Did not seem work for datatype:",type)
    else:
        print("created",os.path.basename(filepath_out))
try:
    filepath_out = os.path.join( dir_out , os.path.splitext(filename)[0]+'.offline.html' )
    fig.write_html(filepath_out) # default is offline version with inline included plotly javascript
    print("created",os.path.basename(filepath_out))
    filepath_out = os.path.join( dir_out , os.path.splitext(filename)[0]+'.online.html' )
    fig.write_html(filepath_out, include_plotlyjs='cdn') # online version roughly 3,5 MB smaller
    print("created",os.path.basename(filepath_out)+'.small.html',"(online version)")
except NameError:
    print("Something went wrong. Check source Code for more info.")

# post process. Change export png to export svg option.
filepath_mod = os.path.splitext(filepath_out)[0] + '.svg.html'
with open(filepath_out, "rt") as fin:
    with open(filepath_mod, "wt") as fout:
        for line in fin:
            fout.write(line.replace('png','svg'))
print("created",os.path.basename(filepath_mod))
# alternative via bash sed command im Terminal:
# sed -i "s/png/svg/g" INPUTFILE > OUTPUTFILE # overwrites OUTPUTFILE!
