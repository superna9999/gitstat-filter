# Set X labels rotated by 45deg
set xtics nomirror rotate by -45
set xtics font ",9"
# setup X range
set auto x
# setup Y range
set autoscale y
set autoscale y2
# Setup Y labels
set ylabel "Commits Count"
set y2label "Lines Changed"
# Y ticks only on left side
set ytics nomirror
# Enable Y2 ticks
set y2tics
# Setup histogram style
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9
# Setup CSV format
set datafile separator ";"
# Setup labels offsets
xoffset=0.17
yoffset=0.03
# Setup output type
set terminal svg size 1200,800 background rgb 'white'
# Draw in /dev/null for fist plot
set output '/dev/null'
# Main plot
plot 'out.csv' \
	using 2:xtic(1) title columnheader(2), \
	'' using 3 title columnheader(3) axes x1y2, \
	'' using 4 title columnheader(4) axes x1y2, \
	for [i=5:8] \
		'' using i title columnheader(i), \
	'' using 0:2:2 with labels left offset first -xoffset*8.1,graph yoffset rotate by 90 notitle, \
	'' using 0:3:3 axes x1y2 with labels left offset first -xoffset*7.3,graph yoffset rotate by 90 notitle, \
	'' using 0:4:4 axes x1y2 with labels left offset first -xoffset*6.6,graph yoffset rotate by 90 notitle, \
	'' using 0:5:5 with labels left offset first -xoffset*5.8,graph yoffset rotate by 90 notitle, \
	'' using 0:6:6 with labels left offset first -xoffset*5.1,graph yoffset rotate by 90 notitle, \
	'' using 0:7:7 with labels left offset first -xoffset*4.4,graph yoffset rotate by 90 notitle, \
	'' using 0:8:8 with labels left offset first -xoffset*3.7,graph yoffset rotate by 90 notitle
# Grow Y2 range to leave label print correctly
set yr [:GPVAL_DATA_Y_MAX+5]
set y2r [:GPVAL_DATA_Y2_MAX+2000]
# Replot in file
set output 'out.svg'
replot
