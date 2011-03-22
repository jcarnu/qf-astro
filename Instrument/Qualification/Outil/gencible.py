header="""<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="420mm"
   height="297mm"
   id="svg2">
  <g
     id="layer1">"""
footer="""
 </g>
</svg>
"""
cercle = """<circle cx="%dmm" cy="%dmm" r="%dmm" stroke="black"
stroke-width="1" fill="none"/>
 <text
     xml:space="preserve"
     style="font-size:6px;font-style:normal;font-weight:normal;fill:#000000;fill-opacity:1;stroke:none;font-family:Bitstream Vera Sans"
     x="%dmm"
     y="%dmm"
     id="text%d"><tspan
       id="tspan2891"
       x="%dmm"
       y="%smm">%d</tspan></text>

"""

rect="""    <rect
       width="%dmm"
       height="%dmm"
       x="%dmm"
       y="%dmm"
       id="rect%d"
       style="fill:none;stroke:#000000;stroke-width:0.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
 <text
     xml:space="preserve"
     style="font-size:6px;font-style:normal;font-weight:normal;fill:#000000;fill-opacity:1;stroke:none;font-family:Bitstream Vera Sans"
     x="%dmm"
     y="%dmm"
     id="text%dmm"><tspan
       id="tspan2891"
       x="%dmm"
       y="%smm">%d</tspan></text>
"""
print header
height=300
width=420
step=5
for i in range(1,height/(2*step)):
    print rect%(width-i*2*step,height-i*2*step,i*step,i*step,i,width/2,i*step,i,width/2,i*step,i)
for i in range(1,width/(2*step)):
    print cercle%(width/2,height/2,i*step,(width/2)+i*step,height/2,i,(width/2)+i*step,height/2,i)
print footer
