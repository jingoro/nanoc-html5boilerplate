# Updates local files with latest from html5-boilerplate github repository.

require 'open-uri'

BASE_DIR = File.dirname(__FILE__)
BASE_URL = 'https://raw.github.com/h5bp/html5-boilerplate/master'

{
  '.gitattributes' => 'h5bp.gitattributes',
  '.gitignore' => 'h5bp.gitignore',
  '.htaccess' => 'h5bp.htaccess',
  '404.html' => 'content/404.html',
  'LICENSE.md' => 'h5bp.LICENSE.md',
  'apple-touch-icon-114x114-precomposed.png' => 'content/apple-touch-icon-114x114-precomposed.png',
  'apple-touch-icon-144x144-precomposed.png' => 'content/apple-touch-icon-144x144-precomposed.png',
  'apple-touch-icon-57x57-precomposed.png' => 'content/apple-touch-icon-57x57-precomposed.png',
  'apple-touch-icon-72x72-precomposed.png' => 'content/apple-touch-icon-72x72-precomposed.png',
  'apple-touch-icon-precomposed.png' => 'content/apple-touch-icon-precomposed.png',
  'apple-touch-icon.png' => 'content/apple-touch-icon.png',
  'crossdomain.xml' => 'content/crossdomain.xml',
  'favicon.ico' => 'content/favicon.ico',
  'humans.txt' => 'content/humans.txt',
  'robots.txt' => 'content/robots.txt',
  'css/main.css' => 'content/css/_main.scss',
  'css/normalize.css' => 'content/css/_normalize.scss',
  'js/vendor/jquery-1.9.1.min.js' => 'content/js/vendor/jquery.js',
  'js/vendor/modernizr-2.6.2.min.js' => 'content/js/vendor/modernizr.js',
  'js/main.js' => 'content/js/_main.js',
  'js/plugins.js' => 'content/js/_plugins.js',
}.each do |repo_file, local_file|
  puts "Updating #{local_file}"
  open("#{BASE_DIR}/#{local_file}", 'wb') do |file|
    file << open("#{BASE_URL}/#{repo_file}").read
  end
end
