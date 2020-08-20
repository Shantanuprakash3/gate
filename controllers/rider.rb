require_relative '../models/init'

class RiderController
 
    def register_rider(params)
        response = Riders.insert(rider_name: params["rider_name"], 
                    latitude: params["latitude"],
                    longitude: params["longitude"],
                    created_at: Time.now,
                    updated_at:Time.now)
        
        response.to_json    
    end

    def rider_history(params)
        response = Trips.where(rider_id: params["rider_id"])
        response.to_json
    end

end