#!/bin/bash

echo 'Lehrpreisauswertungs-Script v3beta'
echo ' '
echo 'Python-Script by Kevin Luckas, bash-Script by Christopher F. Joern'


for folder in */
        do
		NAME=`cat $folder/lecturer_name`
		LECTURE=`cat $folder/lecture_title`
		a='Der Name des Dozenten ('
		b=') des Moduls '
		c=' wurde in die Datei kopiert!'
		d='Die Werte des Moduls '
		e=' gehalten von '
		f=' wurden in die Datei kopiert!'
		PHRASE1=$a$NAME$b$LECTURE$c	
		PHRASE2=$d$LECTURE$e$NAME$f	
		echo $NAME >> data_lehrpreis_neu.txt
		echo $LECTURE >> data_lehrpreis_neu.txt
		echo $PHRASE1
		grep -c [1] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [2] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [3] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [4] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [5] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [6] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [123456] ${folder}/q26.data >> data_lehrpreis_neu.txt
		grep -c [0123456] ${folder}/q26.data >> data_lehrpreis_neu.txt
                echo $PHRASE2
        done

ipython2 verdacht_neu.py
echo 'Die Daten wurden ausgewertet!'
echo 'Viel Spass!'
x=1
while [ $x = 1 ]
do
	read -p "Die Liste der nominierten Dozenten anzeigen? y|n `echo $'\n>'`" answ
	if [ "$answ" = "y" ]
			then
				gedit verdaechtige_lehrpreis_neu.txt
				x=0
			elif [ "$answ" = "n" ]
				then				
					echo 'Gut... Dann halt nicht...'
					x=0
				else
					echo 'Bitte mit y oder n antworten! Dumbf#§k...'
	fi
done
