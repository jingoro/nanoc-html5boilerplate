# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# Don't reload this file for nanoc autocompile. Otherwise, nanoc will eventually
# throw an "ERROR SystemStackError: stack level too deep" exception.
unless defined? LOADED_DEFAULT_CONFIG

  LOADED_DEFAULT_CONFIG = true
  
  require 'compass'
  Compass.add_project_configuration File.expand_path('../../compass-config.rb', __FILE__)

  # include common helpers
  include Nanoc::Helpers::HTMLEscape
  include Nanoc::Helpers::LinkTo
  include Nanoc::Helpers::Rendering

  # cache busting
  require 'nanoc/cachebuster'
  include Nanoc::Helpers::CacheBusting
  
  # image compression
  require 'nanoc/filters/image_compressor'
  
  # javascript concatenation
  require 'nanoc/filters/javascript_concatenator'

end
