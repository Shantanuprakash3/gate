require 'sinatra/base'
require_relative '../controllers/init'

module Sinatra
	module MyApp
		module Routes
			module FruitRoutes
				def self.registered(app)
					app.get "/fruit/:id" do
						request.body.rewind
						@request_payload = JSON.parse request.body.read
				  
						
					end
					app.post "/fruit" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						
						fruitControllerObj = FruitController.new
						fruitControllerObj.set_fruit(request_payload)
					end
					app.put "/fruit/:id" do
						#...
					end
					app.delete "/fruit/:id" do
						#...
					end
				end
			end
		end
	end
  # register ExpenseRoutes # for non modular apps, just include this file and it will register
end