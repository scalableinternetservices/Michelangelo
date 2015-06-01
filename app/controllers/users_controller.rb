class UsersController < ApplicationController
  skip_before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy, :friends, :mytimeline, :requests]



  # GET /users
  # GET /users.json
  # def index
  #   @users = User.all
  # end
  # def index
  #   @searchedUsers = User.search(params[:search])
  # end

  def index
    # @searchedUsers = User.order("created_at DESC")
    
    # if params[:search]
    #   @searchedUsers = User.search(params[:search]).order("created_at DESC")
    # else
    #   @searchedUsers = User.order("created_at DESC")
    # end

    @current_user = User.includes(:comments, :likes, :friendships).find(session[:user_id])
    # @friends = User.find(session[:user_id]).friends
  end

  def search
    @current_user = User.find(session[:user_id])


  end

  # GET /users/1
  # GET /users/1.json
  def show
    @mymusics = Music.where(:uid => params[:id]).order('created_at DESC')
    @current_user = User.find(session[:user_id])

    @date = @user.created_at.strftime('%B %d, %Y')
  end

  def friends
    @current_user = User.find(session[:user_id])
    @friends = @current_user.friends.paginate(:page => params[:page], per_page: 5)
    # if params[:id] != session[:user_id]
    #   redirect_to homepage_path(session[:user_id])
    # end
  end


  def mytimeline
    @current_user = User.find(session[:user_id])
    @mymusics = Music.where(:uid => params[:id]).paginate(:page => params[:page], per_page: 5).order('created_at DESC')

  end



  def newfriend
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id])
    @friends = User.find(params[:id]).friends
    
  end


  def notification
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id])
    @mynotification = Unreadcomment.where(:user_id => params[:id]).order('created_at DESC')
  end

  # def requests_from
  #   @requests_from = User.find(params[:id]).requests_from
  # end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end 
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def index
    @users=User.order(:name)
  end

  def contact

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :gender, :age, :interest, :picurl, :image)
    end
end
