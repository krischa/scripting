#!/bin/bash
echo 'Evaluation-Script for experiments by C.F.Joern: auswertung.sh v3.0 beta'
#Hier wird die Nummer des Experiments erfragt
echo 'please give the number of the experiment:'
read foldername
#Ordner wird erstellt und betreten
mkdir $foldername
cd $foldername
#Beginn der Eingabe des Gnuplot-Scripts
echo `set terminal eps enhanced coloured`
echo `set output \'"$foldername".eps\'` >> $foldername.txt
echo 'copy the prepared file into the new folder, then save it as csv'
echo 'when done, give the file`s FULL name (example.csv):'
read filename
mv $filename $foldername.csv
#Titel des Plots
echo 'please enter the experiments title:'
read extitle
echo `set title \'"$extitle"\'` >> $foldername.txt
#Achsenbeschriftung
echo 'Do you want to add axislabels? yes|no'
read answ1
a=0
while [ $a -eq 0 ]
do
	if [ $answ1 = "yes" ]
	then
		echo 'please give xlabel:'
		read xl
		echo 'please give xunit:'
		read xu
		echo 'please give ylabel:'
		read yl
		echo 'please give yunit:'
		read yu
		echo `set xlabel \'"$xl"/"$xu"\'` >> $foldername.txt
		echo `set ylabel \'"$yl"/"$yu"\'` >> $foldername.txt
		a=1
	elif [ $answ1 = "no" ]
	then
		echo 'Gnuplot will set no axis-labels.'
		a=1
	else
		echo 'Please type yes or no'
	fi
done
b=0
#Achsenintervall x?
while [ $b = 0 ]
do
	echo 'Do you want to give a range for the x-axis? yes|no'
	read answ2
	if [ $answ2 = "yes" ]
	then
		echo 'Please give start of xrange:'
		read xstart
		echo 'Please give end of xrange:'
		read xend
		echo `set xrange ["$xstart":"$xend"]` >> $foldername.txt
		b=1
	elif [ $answ2 = "no" ]
	then
		echo 'Gnuplot will set the range for the x-axis itself.'
		b=1
	else
		echo 'Please type yes or no!'
	fi
done
c=0
#Achsenintervall y?
while [ $c = 0 ]
do
	echo 'Do you want to give a range for the y-axis? yes|no'
	read answ3
	if [ $answ3 = "yes" ]
	then
		echo 'Please give start of yrange:'
		read ystart
		echo 'Please give the end of yrange:'
		read yend
		echo `set yrange ["$ystart":"yend"]` >> $foldername.txt
		c=1
	elif [ $answ3 = "no" ]
	then
		echo 'Gnuplot will set the range for the y-axis itself'
		c=1
	else
		echo 'Please type yes or no!'
	fi
done
#grid?
d=0
while [ $d = 0 ]
do
	echo 'Do you want a grid in your plot? yes|no'
	read answ4
	if [ $answ4 = 'yes' ]
	then
		echo 'set grid' >> $foldername.txt
		echo 'Grid was set.'
		d=1
	elif [ $answ4 = 'no' ]
	then
		echo 'Grid will not be set.'
		d=1
	else
		echo 'Please type yes or no!'
	fi
done
#logscale?
e=0
while [ $e = 0 ]
do
	echo 'Do you want (a) logarithmic axis/axes? yes|no'
	read answ5
	if [ $answ5 = 'yes' ]
	then
		f=0
		while [ $f = 0]
		do
			echo 'Which Axis do you want logarithmic? x|y|both'
			read answ6
			if [ $answ6 = 'x' ]
			then
				echo 'set xlogscale' >> $foldername.txt
				echo 'The x-axis has been set logarithmic.'
				f=1
			elif [ $answ6 = 'y' ]
				echo 'set ylogscale' >> $foldername.txt
				echo 'The y-axis has been set logarithmic.'
				f=1
			elif [ $answ6 = 'both' ]
				echo 'set xylogscale' >> $foldename.txt
				echo 'Both axes have been set logarithmic.'
				f=1
			else
				echo 'Please type x, y or both!'
			fi
		done
		e=1
	elif [ $answ5 = 'no' ]
	then
		echo 'No axis will be set logarithmic.'
		e=1
	else
		echo 'Please type yes or no!'
	fi
done
#key?
g=0
while [ $g = 0 ]
do
	echo 'Do you want the key to the plot? yes|no'
	read answ7
	if [ $answ7 = 'yes' ]
	then
		echo 'set key' >> $foldername.txt
		echo 'The key for the plot has been set.'
		g=1
	elif [ $answ7 = 'no' ]
		echo 'unset key' >> $foldername.txt
		echo 'The key for the plot has been unset.'
		g=1
	else
		echo 'Please type yes or no!'
done
#fit?
A=0
while [ $h -eq 0 ]
do
	echo 'do you want a fit? yes|no'
	read answer
	if [ $answer = "yes" ]
	then
		echo 'give a function-name (e.g. f(x)):'
		read function
		echo 'give a function-value (gnuplot-readable, e.g. a*x**2+b*x+c)'
		read val
		echo 'give the variables, seperated with commas (e.g. a,b,c)'
		read var
		echo 'fit will be made'
		h=1
	elif [ $answer = "no" ]
	then
		echo 'fit will not be made'
		h=1
	else
		echo 'please say yes or no.'
	fi
done
#Plotbefehl
echo `plot \'"$foldername".csv\' u 1:2:3:4 w xyerrorbars, "$function"`
#Plot durchführen und in pdf konvertieren
gnuplot $foldername.txt
epstopdf $foldername.eps
#ende
