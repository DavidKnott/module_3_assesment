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
    response = BestBuyService.search_by(zip)
    stores = response[:stores].map do |store|
      Store.new(store)
    end
    [response[:total], stores]
  end

end