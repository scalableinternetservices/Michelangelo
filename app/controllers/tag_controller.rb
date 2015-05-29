class TagController < ApplicationController
  def cloud
  	@threshold = 0
  end

  def show
  	@tag = Tag.find(params[:id])
    @musics = Music.tagged_with(@tag.name).order("created_at DESC").paginate(:page => params[:page], per_page: 8)

    @commenttype = 0
    @liketype = 0
    respond_to do |format|
      format.html
      format.js
    end

  end
end
