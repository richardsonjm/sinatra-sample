# config.ru is basically the bootup point
# it is what runs the application

require './environment'

use MainController

run ApplicationController