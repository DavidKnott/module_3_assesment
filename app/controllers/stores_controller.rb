class StoresController < ApplicationController
  def index
    @stores = Store.search_by(params[:q])
  end
end