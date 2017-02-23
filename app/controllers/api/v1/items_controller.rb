class Api::V1::ItemsController < ApplicationController

  def index
    render :json => Item.all, :except => [:created_at, :updated_at]
  end
end