goibibo_rb_client
=================

Ruby client for GoIbibo's API

This is a Ruby wrapper around GoIbibo's API.  The description of the API is available at http://developer.goibibo.com/docs

Just download this file and place it in your code base.  Access it using Ruby's "require_relative".

Example usage is as below:-

Suppose you wish to do a Flight search in my Ruby code.

    require_relative 'goibibo'

    obj = GoIbiboClient.new "your app_id", "your app_key"

    obj.SearchFlights 'MAA', 'BLR', '20131231'

If you want to pass the optional parameters like seating_class, you can do so like this -

    obj.SearchFlights 'MAA', 'BLR', '20131231', :seating_class => 'B'

This syntactic sugar enables you to change the order of optional parameters anyway you like!
