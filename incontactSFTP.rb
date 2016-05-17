require 'net/sftp'
require './login.rb'


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
  
  
  ##########################################################

  # upload a file or directory to the remote host
  # sftp.upload!("/path/to/local", "/path/to/remote")

  # download a file or directory from the remote host
  # sftp.download!("/path/to/remote", "/path/to/local")

  # grab data off the remote host directly to a buffer
  # data = sftp.download!("/path/to/remote")

  # open and write to a pseudo-IO for a remote file
  # sftp.file.open("/path/to/remote", "w") do |f|
  #    f.puts "Hello, world!\n"
  # end

  # open and read from a pseudo-IO for a remote file
  # sftp.file.open("/path/to/remote", "r") do |f|
    # puts f.gets
  # end

  # create a directory
  # sftp.mkdir! "/path/to/directory"

  # list the entries in a directory
  #sftp.dir.foreach("/path/to/directory") do |entry|
   # puts entry.longname
  #end
end