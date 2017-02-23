require 'rails_helper'

describe 'When a user sends a POST request to /api/v1/items' do
  scenario 'they receive a 201 JSON  response if the record is successfully created' do
    item = create(:item)

    post "/api/v1/items?name=#{item.name}&description=#{item.description}&image_url=#{item.image_url}"

    expect(response).to be_success
    expect(response.status).to eq 204
    expect(Item.all.length).to eq 20
  end
end