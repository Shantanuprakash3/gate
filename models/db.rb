require 'sequel'
DB = Sequel.sqlite('/tmp/development.db')

unless DB.table_exists?(:fruits)
  DB.create_table :fruits do
    primary_key :id

    column :name, String
    column :amount, Integer
  end
end