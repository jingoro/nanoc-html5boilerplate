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
  
  # poor man's JS concatenation
  class JsConcatFilter < Nanoc::Filter
    identifier :js_concat
    def run(content, args = {})
      current_dir_pathname = Pathname.new(@item[:content_filename]).dirname.realpath
      required_items = []
      content = content.gsub(/^\s*\/\/\s*=?\s*require\s+(.+?)\s*$/) do
        imported_pathname = Pathname.new($1)
        imported_pathname = current_dir_pathname + imported_pathname if imported_pathname.relative?
        if imported_pathname.exist?
          imported_filename = imported_pathname.realpath
          @items.each do |i|
            if !i[:content_filename].nil? &&
               Pathname.new(i[:content_filename]).realpath == imported_filename
              required_items << i
            end
          end
          "\n;" + File.read(imported_filename) + "\n"
        else
          "\n"
        end
      end
      depend_on required_items.uniq if required_items.size > 0
      content
    end
  end
  Nanoc::Filter.register '::JsConcatFilter', :js_concat

end
