set :protection, except: :session_hijacking

get '/' do
  # Look in app/views/index.erb
  @post = Post.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  if @user = User.authenticate(params[:login_username], params[:login_password])
    puts @user
    session[:username] = @user.username
    session[:user_id] = @user.id
    redirect to '/news'
  else
    redirect to '/'
  end

end

post '/acc' do
  @user = User.create(params[:user])
  session[:username] = @user.username
  session[:user_id] = @user.id
  redirect to '/'
end

get '/logout' do
  session[:username] = nil
  session[:user_id] = nil
  redirect to '/'
end

get '/news' do
  @post = Post.all
  erb :index
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/submitted/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :user_post
end

get '/threads/:id' do
  @user = User.find(params[:id])
  @comments = @user.comments
  erb :user_comment
end

get '/comment' do
  @comments = Comment.order(:created_at).reverse
erb :allcomments
end