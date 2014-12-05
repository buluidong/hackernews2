get '/post/:p_id/upvote' do
  PostVote.create(post_id:params[:p_id],user_id:session[:user_id])
  redirect to '/'
end

get '/post/:p_id/downvote' do
  PostVote.where(post_id:params[:p_id],user_id:session[:user_id]).first.destroy
  redirect to '/'
end