require 'sinatra/base'
require_relative '../controllers/init'

module Sinatra
	module MyApp
		module Routes
			module RiderRoutes
				def self.registered(app)
					app.get "/rider/history" do
						request.body.rewind
						@request_payload = JSON.parse request.body.read
				  
						
						riderControllerObj = RiderController.new
						riderControllerObj.rider_history(request_payload)
					end
					app.post "/rider/register" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						
						riderControllerObj = RiderController.new
						riderControllerObj.register_rider(request_payload)
					end
					app.put "/rider/:id" do
						#...
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