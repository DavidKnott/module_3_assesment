class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    render :json => Item.all
  end

  def show
    render :json => @item
  end

  def create
    item = Item.new(item_params)
    if item.save
      render :json => item, :status => 201
    else 
      render :json => { :errors => item.errors.full_messages }, :status => 422
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