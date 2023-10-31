class ImagesController < ApplicationController
  def index
    @images = Image.all
    render :index
  end

  def show
    @image = Image.find_by(id: params["id"])
    render :show
  end

  def create
    @image = Image.new(url: params["url"], product_id: params["product_id"])
    @image.save
    render :show
  end
end
