class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
    current_user = User.find(session[:user_id])
    #puts "params ", comment_params
    @like = Like.new(like_params)
    @like.user = current_user
    @like.save

    # if @like.liketype == 0
    #   @host = Music.find(@like.post_id).uid
    #   if (@host != current_user.id)
    #     @unreadlike = Unreadlike.create(:post_id => @like.post_id, :user_id => @host, :liker => current_user.id, :liketype => 0)
    #   end
    # else
    #   @host = Audio.find(@comment.post_id).uid
    #   if (@host != current_user.id)
    #     @unreadlike = Unreadlike.create(:post_id => @like.post_id, :user_id => @host, :liker => current_user.id, :liketype => 1)
    #   end
    # end

    redirect_to (:back)
  end



  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    current_user = User.find(session[:user_id])
      if (@like.user == current_user)
        @like.destroy
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:post_id, :user_id, :liketype)
    end
end
