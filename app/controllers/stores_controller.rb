class StoresController < ApplicationController
  def index
    raw_response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=ru99w3xp6qu5848qvbgrznxq"
    response = JSON.parse(raw_response.body,:symbolize_names => true)
    @total = response[:total]
    @tores = response[:stores].map do |store|
      Store.new(store)
    end
  end
end


class Store
  attr_reader :name,
              :city,
              :distance,
              :phone_number,
              :type

  def initialize(attrs)
    @name          = attrs[:longName]
    @city          = attrs[:city]
    @distance      = attrs[:distance]
    @phone_number  = attrs[:phone]
    @type          = attrs[:storeType]
  end

end