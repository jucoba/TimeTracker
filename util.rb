require 'Win32API'

class Util
	
	def self.saveToFile(filename,text)
		file = File.open(filename,'a')
		file.puts text+"\n"
		file.close
	end
	
	def self.getActiveWindowTitle()
		getForegroundWindow = Win32API.new('user32', 'GetForegroundWindow', [], 'L')
		getWindowText = Win32API.new('user32', 'GetWindowText', ['L', 'P', 'I'], 'I')

		window_handle = getForegroundWindow.Call()
		
		title_buffer1 = ' ' * 256
		getWindowText.Call(window_handle, title_buffer1, 256)
		return title_buffer1
	end

end