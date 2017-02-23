class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    render :json => Item.all, :except => [:created_at, :updated_at]
  end

  def show
    render :json => @item, :except => [:created_at, :updated_at]
  end

  def destroy

    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end