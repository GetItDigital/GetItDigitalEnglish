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
    filename="test_plotly_slider_to_html.py"
    #filename=os.path.join(os.path.abspath(os.path.curdir),filename)
    filename
else:
    print("__file__ defined. Assume script is called from file. Use that as basefilename for output files")
    filename=os.path.basename(__file__) # should match filename of current script without absolute path
    filename

# Create figure
fig = go.Figure()

# Add traces, one for each slider step
for step in np.arange(0, 5, 0.1):
    fig.add_trace(
        go.Scatter(
            visible=False,
            line=dict(color="#00509B", width=1),
            name="𝜈 = " + str(step),
            x=np.arange(0, 1, 0.001),
            y=np.sin(20*np.pi*step * np.arange(0, 1, 0.001))))

# Make 10th trace visible
fig.data[1].visible = True

# Create and add slider
steps = []
for i in range(len(fig.data)):
    step = dict(
        method="update",
        args=[{"visible": [False] * len(fig.data)},
              {"title": "Slider switched to step: " + str(i)}],  # layout attribute
    )
    step["args"][0]["visible"][i] = True  # Toggle i'th trace to "visible"
    steps.append(step)

sliders = [dict(
    active=1,
    currentvalue={"prefix": "Frequency: "},
    pad={"t": 50},
    steps=steps
)]

fig.update_xaxes(showline=True, linewidth=2, linecolor='black')
fig.update_yaxes(showline=True, linewidth=2, linecolor='black')

fig.update_xaxes(range=[0, 1],ticks="outside", tickwidth=2, tickcolor='black', ticklen=5)
fig.update_yaxes(range=[-1, 1],ticks="outside", tickwidth=2, tickcolor='black', ticklen=5)

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
