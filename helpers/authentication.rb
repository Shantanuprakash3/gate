require 'multi_json'

module Sinatra
    module MyApp
        module Helpers
            module Authentication
                def authenticate!
                use Rack::Auth::Basic, "Protected Area" do |username, password|
                    username == 'foo' && password == 'bar'
                end
                # Authenticate client here
                halt 401, MultiJson.dump({message: "You are not authorized to access this resource"}) unless authenticated?
                end
            end
        end
    end
end