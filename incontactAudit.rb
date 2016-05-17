require 'net/sftp'
require './login.rb'
require 'fileutils'

incontact = []
Net::SFTP.start(HOST, USERNAME, :password => PASSWORD) do |sftp|
  sftp.dir.foreach("/") do |entry|
	incontact << entry.name
	File.open("incontact.txt", "w+") do |f|
		incontact.each {|x| f.puts(x)}
	end
  end
  File.open("incontact.txt", "w+") do |f|
    incontact.each {|x| f.puts(x)}
  end
end

local = Array.new
Dir.chdir(DRIVE)  
Dir['*'].each do |x|
    local << x 
	File.open("local.txt", "w+") do |f|
		local.each {|x| f.puts(x)}
	end
end
FileUtils.mv(DRIVE + '\\local.txt','C:\\Users\\gfranchini\\Desktop\\incontactFTP')
 
audit = Array.new
audit = incontact - local

p Dir.pwd

Dir.chdir('C:\\Users\\gfranchini\\Desktop\\incontactFTP')  
File.open("audit.txt", "w+") do |f|
	audit.each {|x| f.puts(x)}
end
#FileUtils.mv(DRIVE + '\\audit.txt','C:\\Users\\gfranchini\\Desktop\\incontactFTP')
