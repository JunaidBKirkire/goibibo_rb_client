require 'rest_client'

class GoIbiboClient

  attr_accessor :FLIGHT_URL, :MIN_FARE_URL, :BUS_URL, :BUS_SEAT_MAP_URL, :app_id, :app_key

  def initialize app_id, app_key
    base_URL = 'https://developer.goibibo.com/api/'
    self.FLIGHT_URL = base_URL + 'search/'
    self.MIN_FARE_URL = base_URL + 'stats/minfare/'
    self.BUS_URL = base_URL + 'bus/search/'
    self.BUS_SEAT_MAP_URL = base_URL + 'bus/seatmap/'
    self.app_id = app_id
    self.app_key = app_key
  end 


  def SearchFlights source, destination, dateofdeparture, opts={}

    format = opts[:format].nil? ? 'json' : opts[:format] 
    dateofarrival = opts[:dateofarrival].nil? ? '' : opts[:dateofarrival]    
    seatingclass = opts[:seatingclass].nil? ? 'E' : opts[:seatingclass]
    adults = opts[:adults].nil? ? 1 : opts[:adults]
    children = opts[:children].nil? ? 0 : opts[:children]
    infants = opts[:infants].nil? ? 0 : opts[:infants]
    params = 	{ 
		"app_id" => self.app_id, 
		"app_key" => self.app_key, 
		"format" => format, 
		"source" => source, 
		"destination" => destination, 
		"dateofdeparture" => dateofdeparture,
		"dateofarrival" => dateofarrival, 
		"seatingclass" => seatingclass, 
		"adults" => adults, 
		"children" => children, 
		"infants"=> infants 
		}
    RestClient.get self.FLIGHT_URL, { :params => params }
  end

  def FetchMinFare source, destination, sdate, opts={}
    
    format = opts[:format].nil? ? 'json' : opts[:format]
    vertical = opts[:vertical].nil? ? 'flight' : opts[:vertical]    
    mode = opts[:mode].nil? ? 'one' : opts[:mode]
    edate = opts[:edate].nil? ? sdate : opts[:edate]
    travel_class = opts[:class].nil? ? 'NA' : opts[:class]

    params = 	{
		"app_id" => self.app_id,
		"app_key" => self.app_key,
		"format" => format,
		"source" => source,
		"destination" => destination,
		"sdate" => sdate,
		"vertical" => vertical,
		"mode" => mode,
		"edate" => edate,
		"class" => travel_class
		}
    RestClient.get self.MIN_FARE_URL, { :params => params }
  end

  def SearchBuses source, destination, departure_date, opts={}

    format = opts[:format].nil? ? 'json' : opts[:format]
    arrival_date = opts[:dateofarrival].nil? ? '' : opts[:dateofarrival]

    params =	{
		"app_id" => self.app_id,
		"app_key" => self.app_key,
		"format" => format,
		"source" => source,
		"destination" => destination,
		"dateofdeparture" => departure_date,
		"dateofarrival" => arrival_date
		}
    RestClient.get self.BUS_URL, { :params => params }
  end

  def FetchBusSeatMap skey, opts={}

    format = opts[:format].nil? ? 'json' : opts[:format]

    params =	{
		"app_id" => self.app_id,
		"app_key" => self.app_key,
		"format" => format,
		"skey" => skey
		}

    RestClient.get self.BUS_SEAT_MAP_URL, { :params => params }

  end

end
