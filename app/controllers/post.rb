set :protection, except: :session_hijacking

get '/post' do
  erb :post
end

post '/post' do
  @post = Post.create(params[:post])
  @post.user_id = session[:user_id]
  @post.save
  redirect to '/news'
end

get '/post/:p_id' do
  @post = Post.find(params[:p_id])
  @comment = Comment.where(post_id:params[:p_id])
  erb :comment
end

post '/post/:p_id/comment' do
  Comment.create(post_id:params[:p_id],user_id:session[:user_id],body:params[:comment])
  redirect to '/post/' << params[:p_id]
end