require_relative '../models/init'
require_relative 'lib/allocate_single'
class TripController
 
    def book_trip(params)
        # 
        riders = Riders.where(rider_id: params["rider_id"])
        
        # fetch
        available_cabs = Cabs.where(availability: "available")

        cab_id = AllocateCabSingle.new.allocate(riders.to_hash, available_cabs.to_hash)
        Trips.insert(cab_id: cab_id, 
                    rider_id: riders["rider_id"],
                    trip_status: "active",
                    created_at: Time.now,
                    updated_at:Time.now)
        
        # update cab as unavailable            
        puts Trip.count
        true
    end

    def end_trip(params)        
        response = Trips.where(trip_id: params["trip_id"]).update(trip: "inactive")
        # update cab as available
        response.to_json
    end

end