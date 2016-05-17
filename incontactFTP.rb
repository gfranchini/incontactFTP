require 'net/ftp'
require './login.rb'

CONTENT_SERVER_DOMAIN_NAME = HOST
CONTENT_SERVER_FTP_LOGIN = USERNAME
CONTENT_SERVER_FTP_PASSWORD = PASSWORD

# LOGIN and LIST available files at default home directory
Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) do |ftp|
  #files is an array of files
  files = ftp.list
  # prints out new file with files in directory
  File.new("files.txt", "w+")
  File.open("files.txt", "w+") do |f|
    files.each {|x| f.puts(x)}
  end



end

# # check if the directory existence
# # create the directory if it does not exist yet
# Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) do |ftp|
#   ftp.mkdir("/root_level") if !ftp.list("/").any?{|dir| dir.match(/\sroot_level$/)}
#
#   # create nested directory
#   # it does not create directory tree
#   # therefore, create "/root_level" before creating "/root_level/nested"
#   ipad_folder = ftp.list("/root_level")
#   ftp.mkdir("/root_level/nested") if !ipad_folder.any?{|dir| dir.match(/\snested$/)}
# end
#
#
# # upload files
# TXT_FILE_OBJECT = File.new("/home/though-sauce/to_be_uploaded/0001.txt")
# Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) do |ftp|
#   ftp.putbinaryfile(TXT_FILE_OBJECT)
# end
#
#
# # upload files and rename it
# Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) do |ftp|
#   ftp.putbinaryfile(TXT_FILE_OBJECT, "0001.txt.in_process")
# end
#
#
# # upload files to nested directory
# Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) do |ftp|
#   ftp.putbinaryfile(TXT_FILE_OBJECT, "/root_level/nested/#{File.basename(TXT_FILE_OBJECT)}")
# end
