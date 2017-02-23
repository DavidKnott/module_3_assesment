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

  def self.search_by(zip)
    raw_response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV['BEST_BUY_API_KEY']}"
    response = JSON.parse(raw_response.body,:symbolize_names => true)
    total = response[:total]
    stores = response[:stores].map do |store|
      Store.new(store)
    end
    [total, stores]
  end

end