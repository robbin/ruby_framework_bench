require File.expand_path("../application", __FILE__)

class Application < Goliath::API
  def response(env)
    ::Posts.call(env)
  end
  # use Goliath::Rack::Params
  # use Goliath::Rack::DefaultMimeType
  # use Goliath::Rack::Render, 'json'
  # 
  # def response(env)
  #   [200, {}, Post.find(params['id']).to_json]
  # end  
end

