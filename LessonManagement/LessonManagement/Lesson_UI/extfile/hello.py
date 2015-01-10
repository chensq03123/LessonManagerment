
import sys
sys.path.append('C:\Program Files (x86)\IronPython 2.7\Lib')
import json
import urllib2

def jdecode(str):
		s=json.loads('{"name":"chensq"}')
		return str(s.keys())

def urlrequest(url):
		request=urllib2.Request(url)
		response=urllib2.urlopen(request)
		return response.read()
