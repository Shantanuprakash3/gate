require 'sinatra/base'
require_relative '../controllers/init'

module Sinatra
	module MyApp
		module Routes
			module CabRoutes
				def self.registered(app)

					app.post "/cab/register" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						
						cabControllerObj = CabController.new
						cabControllerObj.register_cab(request_payload)
					end
					app.post "/cab/update" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						
						cabControllerObj = CabController.new
						cabControllerObj.update_cab_status(request_payload)
					end

				end
			end
		end
	end
  # register ExpenseRoutes # for non modular apps, just include this file and it will register
end