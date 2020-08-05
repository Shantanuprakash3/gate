
module Sinatra
	module MySplit
		module Routes
			module UserRoutes
				def self.registered(app)
					app.get "/user/:id" do
						...
					end
					app.post "/user" do
						...
					end
					app.put "/user/:id" do
						...
                    end
                    app.delete "/user/:id" do
						...
					end
				end
			end
		end
	end
  # register UserRoutes # for non modular apps, just include this file and it will register
end