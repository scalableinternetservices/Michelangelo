class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json


  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    # @friendship = Friendship.new(friendship_params)
    user = User.find(params[:friended_id])
    current_user = User.find(session[:user_id])
    current_user.friend_request(user)

    respond_to do |format|
      # if @friendship.save
      #   format.html { redirect_to @friends_path, notice: 'Friendship was successfully created.' }
      #   format.json { render action: 'show', status: :created, location: @friendship }
      # else
        format.html { redirect_to :back  }
        # format.json { render json: @friendship.errors, status: :unprocessable_entity }
        format.js
      # end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    user = User.find(params[:friended_id])
    current_user = User.find(session[:user_id])
    current_user.friend_request_accept(user)

    respond_to do |format|
      # if @friendship.update(friendship_params)
      #   format.html { redirect_to @friends_path, notice: 'Friendship was successfully updated.' }
      #   format.json { head :no_content }
      # else
        format.html { redirect_to :back  }
        format.js
      # end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    user = User.find(params[:friended_id])
    current_user = User.find(session[:user_id])
    current_user.friend_request_reject(user)

    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    # @friendship = Friendship.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:friender_id, :friended_id, :accepted, :created_at, :updated_at)
    end
end
