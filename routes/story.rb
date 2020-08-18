require 'sinatra/base'
require_relative '../controllers/init'

module Sinatra
	module MyApp
		module Routes
			module StorysRoutes
				def self.registered(app)

					app.post "/add" do
						request.body.rewind
						request_payload = JSON.parse request.body.read
						if request_payload["word"].split(" ").length > 1
							error 400 do
								{ error: "multiple words sent" }
							end
						end
						storyControllerObj = StoryController.new
						storyControllerObj.add_word(request_payload["word"])
					end
					app.get "/stories" do
						storyControllerObj = StoryController.new
						storyControllerObj.get_all_stories(params)
					end
					app.get "/stories/:id" do
						storyControllerObj = StoryController.new
						storyControllerObj.get_story(params[:id])
					end
				end
			end
		end
	end
  # register ExpenseRoutes # for non modular apps, just include this file and it will register
end