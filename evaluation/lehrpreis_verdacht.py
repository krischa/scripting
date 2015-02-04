from math import *
import os
fin = open('data_lehrpreis.txt','r')
fout = open('verdaechtige_lehrpreis.txt', 'w')
data = fin.readlines()
length = len(data)
i=0
c=0
d=0
while i < length-1:
	try: 
		if float(data[i+3])>9 and (float(data[i+2])/float(data[i+3]))>0.7:
			pro=float(data[i+2])/float(data[i+3])
			anzahl=str(data[i+3])
			if data[i]=='\n':
				data = data[:i]+data[i+4:]
				length=length - 4
			else:
				fout.write(data[i] + 'Vorlesung: ' + data[i+1] + 'Prozente: ' + str(pro*100)+ '\n' + 'abgegebene Stimmen: ' + anzahl +'\n\n')
				i=i+4
				c=c+1
				d=d+1
		else:
			i=i+4
			d=d+1
	except:
		i=i+1

fout.write('Insgesamt werden ' + str(c) + ' aus ' + str(d) + ' Vorlesungen nominiert')
os.system('clear')
print 'Insgesamt werden ' + str(c) + ' aus ' + str(d) + ' Vorlesungen nominiert!'
fin.close()
fout.close()
