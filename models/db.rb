require 'sequel'
DB = Sequel.sqlite('/tmp/development.db')

unless DB.table_exists?(:cabs)
  DB.create_table :cabs do
    primary_key :cab_id

    column :driver_name, String
    column :availability, String
    column :latitude, Float
    column :longitude, Float
    column :created_at, DateTime
    column :updated_at, DateTime
  end
end

unless DB.table_exists?(:riders)
  DB.create_table :riders do
    primary_key :rider_id

    column :rider_name, String
    column :latitude, Float
    column :longitude, Float
    column :created_at, DateTime
    column :updated_at, DateTime    
  end
end

unless DB.table_exists?(:trips)
  DB.create_table :trips do
    primary_key :trip_id

    column :cab_id, String
    column :rider_id, String
    column :trip_status, String
    column :created_at, DateTime
    column :updated_at, DateTime
  end
end