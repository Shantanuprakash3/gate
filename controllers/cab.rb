require_relative '../models/init'

class CabController
 
    def register_cab(params)
        response = Cabs.insert(
                    driver_name: params["driver_name"], 
                    availability: params["availability"],
                    latitude: params["latitude"],
                    longitude: params["longitude"],
                    created_at: Time.now,
                    updated_at:Time.now)
        response.to_json
    end

    def update_cab_status(params)
        Cabs.where(cab_id: params["cab_id"]).update(state: params["status"])
        true
    end

end