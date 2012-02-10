# Updates local files with latest from html5-boilerplate github repository.

require 'open-uri'

BASE_DIR = File.dirname(__FILE__)
BASE_URL = 'https://raw.github.com/h5bp/html5-boilerplate/master'

def update_file(local_path, url)
  puts "Updating #{local_path}"
  open(local_path, 'wb') do |file|
    file << open(url).read
  end
end

%w(
  404.html
  apple-touch-icon-114x114-precomposed.png
  apple-touch-icon-57x57-precomposed.png
  apple-touch-icon-72x72-precomposed.png
  apple-touch-icon-precomposed.png
  apple-touch-icon.png
  crossdomain.xml
  favicon.ico
  humans.txt
  robots.txt
  js/libs/jquery-1.7.1.js
  js/libs/modernizr-2.5.2.min.js
  js/plugins.js
  js/script.js
).each do |file|
  update_file "#{BASE_DIR}/content/#{file}", "#{BASE_URL}/#{file}"
end

%w(
  .htaccess
  .gitignore
).each do |file|
  update_file "#{BASE_DIR}/h5bp#{file}", "#{BASE_URL}/#{file}"
end
