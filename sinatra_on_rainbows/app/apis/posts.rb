before do
  content_type :json
end

get "/posts" do
  Post.all.to_json
end

get "/posts/:id" do 
  Post.find_by_sql "SELECT SLEEP(#{ENV['WAIT_TIME'].to_f})"
  Post.find(params['id']).to_json
end

post "/create" do
  Post.create(params['post'])
end
