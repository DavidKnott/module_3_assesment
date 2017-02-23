require 'rails_helper'

describe Store, type: :model do
  it "can_search_for_stores_by_zip" do
    stores = Store.search_by(80202)

    expect(stores.first).to eq 16
    expect(stores.last.count).to eq 10
    expect(stores.last.first.name).to eq "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER"
    expect(stores.last.first.city).to eq "DENVER"
    expect(stores.last.first.distance).to eq 3.45
    expect(stores.last.first.phone_number).to eq "303-270-9189"
    expect(stores.last.first.type).to eq "Mobile SAS"
    
    
    
  end
end