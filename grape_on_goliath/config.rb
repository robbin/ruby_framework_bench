# initialize log
require 'logger'
Dir.mkdir('log') unless File.exist?('log')
class ::Logger; alias_method :write, :<<; end
logger = ::Logger.new("log/#{ENV["RACK_ENV"]}.log")
if ENV["RACK_ENV"] == "production"
  logger.level = Logger::WARN
else
  logger.level = Logger::DEBUG
end

# require 'grape'
# require 'goliath'
# Sets up database configuration
# require 'active_record'
ActiveRecord::Base.establish_connection YAML::load(File.open('config/database.yml'))[ENV["RACK_ENV"]]
ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
  self.default_timezone = :local
  self.time_zone_aware_attributes = false
  self.logger = logger
end

