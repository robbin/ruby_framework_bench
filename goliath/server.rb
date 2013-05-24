require File.expand_path("../boot", __FILE__)

class Application < Goliath::API
  use Goliath::Rack::Params
  use Goliath::Rack::DefaultMimeType
  use Goliath::Rack::Render, 'json'
  
  def response(env)
    Post.find_by_sql "SELECT SLEEP(#{ENV['WAIT_TIME'].to_f})"
    [200, {}, Post.find(params['id']).to_json]
  end  
end

