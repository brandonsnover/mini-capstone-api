class ImagesController < ApplicationController
  def create
    @image = Image.new(url: params["url"], product_id: params["product_id"])
    @image.save
    render :show
  end
end
