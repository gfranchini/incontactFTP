require 'net/sftp'
require './login.rb'
require 'fileutils'


user = ENV['USERNAME']
incontact = []
Net::SFTP.start(HOST, USERNAME, :password => PASSWORD) do |sftp|
  sftp.dir.foreach("/") do |entry|
	incontact << entry.longname
	File.open("incontact_files.csv", "w+") do |f|
		incontact.each {|x| f.puts(x)}
	end
  end
end
FileUtils.mv("incontact_files.csv","C:\\Users\\#{user}\\Desktop\\")
p incontact.count
