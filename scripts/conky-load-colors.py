import sys,os

#Colorized load average for conky.
#written by Unstack


color = ['$color1','$color2','$color3']
limit = [0.15,0.25,0.5]

for i in range(0,3):
	if len(sys.argv) > i:
		limit[i] = float(sys.argv[i+1])

for i in range(4,7):
	if len(sys.argv) > i:
		color[i-4] = '$'+sys.argv[i]

load = os.getloadavg()
neatload = []

for i in range(len(load)):
	score = 0
	for threshold in limit:
		#print(threshold,load[i],load[i]>threshold)
		score = score+1
		if load[i] < threshold:
			break

	#print("load:",load[i],"score:",score,"color:",color[score-1])

	setcolor = color[score-1]
	neatload.append(setcolor+" "+str(load[i]))

print(neatload[0]+neatload[1]+neatload[2]+'$color')
