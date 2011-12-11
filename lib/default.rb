# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'compass'

Compass.add_project_configuration File.expand_path('../../compass/config.rb', __FILE__)

include Nanoc3::Helpers::Rendering

HTML_EXTENSIONS = %w(html haml md)
MINIFIED_JS_RE = /min\.js$/
