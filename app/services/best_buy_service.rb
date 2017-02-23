class BestBuyService

  def conn

  end

  def self.search_by(zip)
    raw_response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&apiKey=#{ENV['BEST_BUY_API_KEY']}"
    JSON.parse(raw_response.body,:symbolize_names => true)
  end

end