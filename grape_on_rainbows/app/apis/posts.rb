class Posts < Grape::API
  
  version 'v1', :using => :path
  format :json
  
  resource 'posts' do
    get "/" do
      Post.all
    end
    
    get "/:id" do 
      Post.find_by_sql "SELECT SLEEP(#{ENV['WAIT_TIME'].to_f})"
      Post.find(params['id'])
    end
    
    post "/create" do
      Post.create(params['post'])
    end
  end
  
end