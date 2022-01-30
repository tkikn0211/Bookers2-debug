class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def follow
    current_user.follow(params[:id])
    redirect_to request.referer
  end
  
  def unfollow  
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings  
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
