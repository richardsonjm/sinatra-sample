# specify what is needed in the environment
require 'bundler'  

Bundler.require

def load_dirs(array)
  array.each do |dir|
    Dir.entries(dir).each do |file|
      next if file.start_with?(".")
      require_relative "./#{dir}/#{file}"
    end
  end
end

load_dirs(['app/concerns', 'app/models', 'app/controllers'])
