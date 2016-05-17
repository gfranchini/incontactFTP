require 'net/ftp'
require './login.rb'


# LOGIN and LIST available files at default home directory
Net::FTP.open(HOST, USERNAME, PASSWORD) do |ftp|
  files = ftp.list

  puts "list out files in root directory:"
  puts files
end
