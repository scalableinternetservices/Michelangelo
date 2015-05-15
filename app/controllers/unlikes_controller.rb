class UnlikesController < ApplicationController
  before_action :set_unlike, only: [:show, :edit, :update, :destroy]

  # GET /unlikes
  # GET /unlikes.json
  def index
    @unlikes = Unlike.all
  end

  # GET /unlikes/1
  # GET /unlikes/1.json
  def show
  end

  # GET /unlikes/new
  def new
    @unlike = Unlike.new
  end

  # GET /unlikes/1/edit
  def edit
  end

  # POST /unlikes
  # POST /unlikes.json
  def create
    current_user = User.find(session[:user_id])
    #puts "params ", comment_params
    @unlike = Unlike.new(unlike_params)
    @unlike.user = current_user
    @unlike.save
    redirect_to (:back)
  end


  def destory
    current_user = User.find(session[:user_id])
      if (@unlike.user == current_user)
        @unlike.destroy
      end
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unlike
      @unlike = Unlike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unlike_params
      params.require(:unlike).permit(:post_id, :user_id)
    end
end
