require 'yaml'

module Sinatra
    module MyApp
        module Helpers
            module Config
                def config
                    app_config = YAML.load(File.read("../config.yml"))
                end
            end
        end
    end
end