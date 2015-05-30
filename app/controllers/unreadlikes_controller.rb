class UnreadlikesController < ApplicationController
  before_action :set_unreadlike, only: [:show, :edit, :update, :destroy]

  # GET /unreadlikes
  # GET /unreadlikes.json
  def index
    @unreadlikes = Unreadlike.all
  end

  # GET /unreadlikes/1
  # GET /unreadlikes/1.json
  def show
  end

  # GET /unreadlikes/new
  def new
    @unreadlike = Unreadlike.new
  end

  # GET /unreadlikes/1/edit
  def edit
  end

  def view_like
    @thisLike = Unreadlike.find(params[:id])

    if @thisLike.liketype == 0
      @music = Music.find(@thisLike.post_id)
    else
      @audio = Audio.find(@thisLike.post_id)
    end

    Unreadlike.delete(params[:id])
  end

  # POST /unreadlikes
  # POST /unreadlikes.json
  def create
    @unreadlike = Unreadlike.new(unreadlike_params)

    respond_to do |format|
      if @unreadlike.save
        format.html { redirect_to @unreadlike, notice: 'Unreadlike was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unreadlike }
      else
        format.html { render action: 'new' }
        format.json { render json: @unreadlike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unreadlikes/1
  # PATCH/PUT /unreadlikes/1.json
  def update
    respond_to do |format|
      if @unreadlike.update(unreadlike_params)
        format.html { redirect_to @unreadlike, notice: 'Unreadlike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unreadlike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unreadlikes/1
  # DELETE /unreadlikes/1.json
  def destroy
    @unreadlike.destroy
    respond_to do |format|
      format.html { redirect_to unreadlikes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unreadlike
      @unreadlike = Unreadlike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unreadlike_params
      params.require(:unreadlike).permit(:post_id, :user_id, :liker, :liketype)
    end
end
