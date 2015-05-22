class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
 def create
    current_user = User.find(session[:user_id])
    #puts "params ", comment_params
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @host = Music.find(@comment.post_id).uid
    if (@host != current_user)
      Unreadcomment.create(:comment_id => @comment.id, :post_id => @comment.post_id, :user_id => @host, :commenter => current_user.id)
    end
    
    @comment.user = current_user
    @comment.save
    redirect_to (:back)
end

  def destroy
      current_user = User.find(session[:user_id])
      if (@comment.user == current_user)
        @comment.destroy
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :content)
    end
end
