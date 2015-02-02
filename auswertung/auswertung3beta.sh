#!/bin/bash
echo 'Evaluation-Script for experiments by C.F.Joern: auswertung.sh v3.0 beta'
echo 'please give the number of the experiment:'
read foldername
mkdir $foldername
cd $foldername
echo `set output \'"$foldername".eps\'` >> $foldername.txt
echo 'copy the prepared file into the new folder, then save it as csv'
echo 'when done, give the file`s FULL name (example.csv):'
read filename
mv $filename $foldername.csv
#cp ../gps.txt gps.txt
#sed s/nummer/$foldername/ -i gps.txt
echo 'please enter the experiments title:'
read extitle
echo `set title \'"$extitle"\'` >> $foldername.txt
#sed s/titel/$extitle/ -i gps.txt
echo 'please give xlabel:'
read xl
#sed s/xgr/$xl/ -i gps.txt
echo 'please give xunit:'
read xu
#sed s/xunit/$xu/ -i gps.txt
echo 'please give ylabel:'
read yl
#sed s/ygr/$yl/ -i gps.txt
echo 'please give yunit:'
read yu
#sed s/yunit/$yu/ -i gps.txt
echo 'please give start of xrange:'
read xstart
#sed s/x1/$xstart/ -i gps.txt
echo 'please give end of xrange:'
read xend
#sed s/x2/$xend/ -i gps.txt
echo 'please give start of yrange:'
read ystart
#sed s/y1/$ystart/ -i gps.txt
echo 'please give the end of yrange:'
read yend
#sed s/y2/$yend/ -i gps.txt
A=0
while [ $A -eq 0 ]
do
	echo 'do you want a fit? [yes|no]'
	read answer
	if [ $answer = "yes" ]
	then
		echo 'give a function-name (e.g. f(x)):'
		read function
		#sed s/function/$function/ -i gps.txt
		#sed s/function/$function/ -i gps.txt
		#sed s/function/$function/ -i gps.txt
		echo 'give a function-value (gnuplot-readable, e.g. a*x**2+b*x+c)'
		read val
		#sed s/val/$val/ -i gps.txt
		echo 'give the variables, seperated with commas (e.g. a,b,c)'
		read var
		#sed s/var/$var/ -i gps.txt
		#sed s/abbruch// -i gps.txt
		echo 'fit will be made'
		A=1
	elif [ $answer = "no" ]
	then
		#sed s/function/\#/ -i gps.txt
		#sed s/fit/\#/ -i gps.txt
	 	#sed s/abbruch/\#/ -i gps.txt
		echo 'fit will not be made'
		A=1
	else
		echo 'please say yes or no.'
		A=0
	fi
done
#mv gps.txt `pwd | sed 's/.*\///'`_gps.txt
#gnuplot `pwd | sed 's/.*\///'`_gps.txt
epstopdf $foldername.eps
