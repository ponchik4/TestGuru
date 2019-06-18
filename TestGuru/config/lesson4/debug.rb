require_relative 'station'
require_relative 'route'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'menu'
#require_relative 'main'
@stations = []
@trains = []
@routes = []
@carriges = []


def generate_station
  @stations << Station.new('msk')
  @stations << Station.new('spb')
  @stations << Station.new('pskov')
end
def generate_train
  @trains << PassengerTrain.new('xxxx1')
  @trains << PassengerTrain.new('s222222pb')
  @trains << PassengerTrain.new('sdfsdfdsfds')
  @trains << CargoTrain.new('XXXX32')
end

def generate_carrige
  @carriges << PassengerCarriage.new
  @carriges << CargoCarriage.new
  @carriges << PassengerCarriage.new
  @wagon = @carriges[1]
end

def generate_route
  @routes << Route.new(@stations[0], @stations[2], 67)
  @routes << Route.new(@stations[2], @stations[1], 89)
end

def take_train
  @selected_train = 2
end

def route_train
  @trains[@selected_train].set_route(@routes[0])
  puts @trains[@selected_train].current_station.name
end

def generate_data
  generate_station
  generate_train
  generate_carrige
  generate_route
  take_train
  route_train
end

def show_trains
  @stations.each_with_index do |station, station_index|
    puts "#{station_index}; #{station.name}"
  end
  puts "Введите номер станции на которой вы хотите посмотреть поезда"
  station = gets.to_i
  puts @stations[station].trains

end
generate_data
show_trains
