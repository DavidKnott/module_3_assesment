require 'rails_helper'

describe 'When a user sends a DELETE request to /api/v1/items/1' do
  scenario 'they receive a 204 JSON response if the record is successfully deleted' do
    items = create_list(:item, 20)
    item  = items.first
    delete "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(response.status).to eq 204
    expect(Item.find(item.id)).to eq nil
  end
end