# configs
#
SKIP_PACKAGES = false


# Dockerfile
#
base_image debian:7
packages   %w(git wget ping), skip: SKIP_PACKAGES

lang "ruby", installation: "source"


# pseudo code yay

def domainator(domain)
  namecoin_resolve domain.host
  redirect_resolve domain

def lang(lang_name, installation: "source")
  wget "ruby_tgz", "ruby-ftp"
  untar

def wget(file_dest, url)
  url = URI.parse "http://#{url}" # or https
  # url = domainator url
  require 'net/http'
  resp = Net::HTTP.get_response url
  File.open(file_dest, "w"){ |f| f.write resp.body }

def untar(file)
  ex "tar xvfz #{file}"

def ex(cmd)
  puts "executing: #{cmd}"
  out = `#{cmd}`
  puts out
  out
