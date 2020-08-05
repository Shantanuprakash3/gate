require 'dm-migrations'

desc "List all routes"
task :routes do
  puts `grep '^[get|post|put|delete].*do$' routes/*.rb | sed 's/ do$//'`
end

desc "migrates the db"
task :migrate do
  require './main'
  DataMapper.auto_migrate!
end

desc "upgrades the db"
task :upgrade do
  require './main'
  DataMapper.auto_upgrade! 
end