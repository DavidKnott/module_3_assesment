class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    render :json => Item.all, :except => [:created_at, :updated_at]
  end

  def show
    render :json => @item, :except => [:created_at, :updated_at]
  end

  def create
    item = Item.new(item_params)
    if item.save
      render :json => item, :status => 201, :except => [:created_at, :updated_at]
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end