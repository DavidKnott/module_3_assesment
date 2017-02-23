require 'rails_helper'

describe BestBuyService, type: :service do
  it "can_search_for_stores_by_zip" do
    VCR.use_cassette(".search_by_zip") do
      response = BestBuyService.search_by(80202, 25)
      stores = response[:stores]
      expect(response.count).to eq 11
      expect(response).to have_key :total
      expect(response).to have_key :stores
      expect(response).to have_key :stores
      expect(stores.first[:longName]).to eq "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER"
      expect(stores.first[:city]).to eq "DENVER"
      expect(stores.first[:distance]).to eq 3.45
      expect(stores.first[:phone]).to eq "303-270-9189"
      expect(stores.first[:storeType]).to eq "Mobile SAS"
    end
  end
end