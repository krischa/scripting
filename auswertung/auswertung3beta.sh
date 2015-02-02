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
		echo `set yrange ["$ystart":"yend"]`
		c=1
	elif [ $answ3 = "no" ]
	then
		echo 'Gnuplot will set the range for the y-axis itself'
		c=1
	else
		echo 'Please type yes or no!'
	fi
done
A=0
#fit?
while [ $A -eq 0 ]
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
	elif [ $answer = "no" ]
	then
		echo 'fit will not be made'
		A=1
	else
		echo 'please say yes or no.'
		A=0
	fi
done
#Plot durchführen und in pdf konvertieren
gnuplot $foldername.txt
epstopdf $foldername.eps
