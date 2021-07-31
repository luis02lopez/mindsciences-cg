from flask import Flask, render_template, redirect, request
import requests
import os
import psutil
app = Flask(__name__)

@app.route('/')
def secret_view():
    return redirect('/home', code=302)

##############################
# Banned IP AND CPU          #
##############################

def getcountry(ip):
	r = requests.get('http://ip-api.com/json/'+ip)
	parsed_json=r.json()
	return parsed_json

@app.route('/home', methods=['GET'])
def banned():
  ips = os.popen("cat /etc/hosts.deny | awk '{ print $3 }'")
  banned = ips.read()


  theFile = open('/etc/hosts.deny','r')
  FILE = theFile.readlines()
  theFile.close()
  printList = []
  for line in FILE:
    printList.append(line)
  print(printList)
  cpu_load=psutil.cpu_percent()
  return render_template('index.html', printList = printList, getcountry=getcountry, cpu_load = cpu_load)


##############################
# App launcher               #
##############################

if __name__ == '__main__':
  app.debug = True
  app.run(host='0.0.0.0')

