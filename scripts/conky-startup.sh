sleep 20s
killall conky
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/beamline" &
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/cpu" &
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/date" &
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/machine" &
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/network" &
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/process" &
cd "/home/antdup/.conky/myown"
conky -c "/home/antdup/.conky/myown/task" &
