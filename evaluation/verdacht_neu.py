from math import *
import os
fin = open('data_lehrpreis_neu.txt','r')
fout = open('verdaechtige_lehrpreis_neu.txt', 'w')
data = fin.readlines()
length = len(data)
i=0
c=0
d=0
while i < length-1:
	try: 
		onetwo = int(data[i+2])+int(data[i+3])
		average = float(int(data[i+2])*1 + int(data[i+3])*2 + int(data[i+4])*3 + int(data[i+5])*4 + int(data[i+6])*5 + int(data[i+7])*6)/float(data[i+8])
		if int(data[i+9]) > 9 and float(onetwo)/float(data[i+9]) >0.7 and average<2.0:
			pro=float(onetwo)/float(data[i+9])
			if data[i]=='\n':
				data = data[:i]+data[i+10:]
				length=length - 10
			else:
				fout.write(data[i] + 'Vorlesung: ' + data[i+1] + 'Prozente: ' + str(pro*100)+ '\n' + 'Durchschnittsnote: ' + str(average) + '\n' + 'abgegebene Stimmen: ' + data[i+9] +'\n\n')
				i=i+10
				c=c+1
				d=d+1
		else:
			pro=float(onetwo)/float(data[i+9])
			fout.write(data[i] + 'Vorlesung: ' + data[i+1] + 'Prozente: ' + str(pro*100)+ '\n' + 'Durchschnittsnote: ' + str(average) + '\n' + 'abgegebene Stimmen: ' + data[i+9] +'\n\n')
			i=i+10
			d=d+1
	except:
		i=i+1

fout.write('Insgesamt werden ' + str(c) + ' aus ' + str(d) + ' Vorlesungen nominiert')
os.system('clear')
print 'Insgesamt werden ' + str(c) + ' aus ' + str(d) + ' Vorlesungen nominiert!'
fin.close()
fout.close()
