class BestBuyService

  def self.conn
    Faraday.new "https://api.bestbuy.com"
  end

  def self.search_by(zip, distance)
    raw_response = conn.get "/v1/stores(area(#{zip},#{distance}))", {:format => 'json', :apiKey => ENV['BEST_BUY_API_KEY']}
    JSON.parse(raw_response.body,:symbolize_names => true)
  end

end