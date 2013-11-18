require_relative 'goibibo'

obj = GoIbiboClient.new "e9448750", "763e128ffc6f8b300b50a56c0ffe1ae3"

=begin
# Flight search API
s = obj.SearchFlights 'MAA', 'BLR', '20131231', :adults => 2, :dateofarrival => '20140101'
puts s
=end

=begin
# Fetch minimum fare API
s = obj.FetchMinFare 'MAA', 'BLR', '20131231', :format => 'xml', :mode => 'all', :vertical => 'bus'
puts s
=end

# Bus search API
s = obj.SearchBuses 'bangalore', 'hyderabad', '20131231', :dateofarrival => '20140104', :format => 'xml'
puts s

# Bus seatmap layout API
=begin
s = obj.FetchBusSeatMap 'vJ52KC0ymd0635qTD9bDDy9GHBkGl5FJMJje0Z5X-2QT0vP95eFY62TTfrmS-Re3dCHl0-QxMK_5soQ=', :format => 'xml'
puts s
=end
