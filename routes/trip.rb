require 'sinatra/base'
require_relative '../controllers/init'

module Sinatra
	module MyApp
		module Routes
			module TripRoutes
				def self.registered(app)

					app.post "/trip/book" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						
						tripControllerObj = TripController.new
						tripControllerObj.book_trip(request_payload)
					end
					app.delete "/trip/end/:id" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						
						tripControllerObj = TripController.new
						tripControllerObj.end_trip(request_payload)
					end
					app.delete "/rider/:id" do
						#...
					end
				end
			end
		end
	end
  # register ExpenseRoutes # for non modular apps, just include this file and it will register
end