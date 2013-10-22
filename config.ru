# config.ru is basically the bootup point
# it is what runs the application

require './environment'

LibraryParser.call

Dir.entries('app/controllers').each do |file|
  next if file.start_with?(".") || file == "application_controller.rb"
  controller_name = file.split("_controller").first.capitalize

  use Kernel.const_get("#{controller_name}Controller")
end

run ApplicationController