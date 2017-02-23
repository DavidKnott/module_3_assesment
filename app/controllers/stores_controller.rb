class StoresController < ApplicationController

  def index
    @stores = Store.search_by(params[:zip], params[:distance])
  end

end