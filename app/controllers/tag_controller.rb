class TagController < ApplicationController
  def cloud
  	@threshold = 0
  end

  def show
  	@tag = Tag.find(params[:id])
    @musics = Music.tagged_with(@tag.name).sort { |x, y| y.created_at <=> x.created_at }
  end
end
