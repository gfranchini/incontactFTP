require './login.rb'
require 'fileutils'

#prints current directory
# puts Dir.pwd

#on ubuntu/mac
# File.open("files.txt").each do |line|
#   puts line
# end

#on windows
#File.open("C:\\Users\\compuser\\Desktop\\test.txt").each do |line|
#  puts line
#end

#go through directory
local = Array.new
Dir.chdir(DRIVE)  
Dir['*'].each do |x|
    local << x 
	File.open("local.txt", "w+") do |f|
		local.each {|x| f.puts(x)}
	end
end
FileUtils.mv(DRIVE + '\\local.txt','C:\\Users\\gfranchini\\Desktop\\incontactFTP')
