require 'data_mapper'
require_relative 'app'

desc "default johnss"
task :default do
  puts "say hello to the default johnss"

end

desc "auto_upgrade"
task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Good job!"
end

desc "auto_migrate"
task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Cool job!"
end
