require_relative 'allocate_cab'

class AllocateCabSingle < AllocateCab
    DIST = 100
    def initialize()
        @rider_lat = 0.0
        @rider_long = 0.0
        @cab_id = ''
    end

    def allocate (rider, cabs)
        puts "#{rider}"
        @rider_lat = rider["latitude"]
        @rider_long = rider["longitude"]

        cabs.each do |cab|
            puts "#{cab.first}"
            if (calculate_distance(cab[:latitude], cab[:longitude]).to_i < DIST)
                @cab_id = cab["cab_id"]
                break
            else
                next
            end
        end
        @cab_id
    end

    def calculate_distance (cab_lat, cab_long)
        Math.sqrt((cab_lat - @rider_lat) ** 2 + (cab_long.t - @rider_long) ** 2)
    end
end