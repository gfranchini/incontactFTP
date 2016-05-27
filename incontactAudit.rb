require 'net/sftp'
require './login.rb'
require 'fileutils'

user = ENV['USERNAME']
incontact = []
Net::SFTP.start(HOST, USERNAME, :password => PASSWORD) do |sftp|
  sftp.dir.foreach("/") do |entry|
	incontact << entry.name
	File.open("incontact_files.csv", "w+") do |f|
		incontact.each {|x| f.puts(x)}
	end
  end
end
FileUtils.mv("incontact_files.csv","C:\\Users\\#{user}\\Desktop\\")

local = Array.new
Dir.chdir(DRIVE)  
Dir['*'].each do |x|
    local << x 
	File.open("local_files.csv", "w+") do |f|
		local.each {|x| f.puts(x)}
	end
end
FileUtils.mv("local_files.csv","C:\\Users\\#{user}\\Desktop\\")
 
audit = Array.new
audit = incontact - local

File.open("audit.csv", "w+") do |f|
	audit.each {|x| f.puts(x)}
end
FileUtils.mv("audit.csv","C:\\Users\\#{user}\\Desktop\\")

p incontact.count
p local.count
p audit.count
