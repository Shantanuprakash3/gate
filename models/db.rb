require 'sequel'
DB = Sequel.sqlite('/tmp/development.db')

unless DB.table_exists?(:stories)
  DB.create_table :stories do
    primary_key :story_id
    String :title, null: false, index: true
    Integer :word_count, default: 1
    DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP, :index=>true
    DateTime :updated_at, default: Sequel::CURRENT_TIMESTAMP, :index=>true
  
    index [:title, :created_at, :updated_at]
  end
end

unless DB.table_exists?(:storyblobs)
  DB.create_table :storyblobs do
    primary_key :blob_id
    foreign_key :story_id, :stories    
    String :story_blob, null: false
  end
end