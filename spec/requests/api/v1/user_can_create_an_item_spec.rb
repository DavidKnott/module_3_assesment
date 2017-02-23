require 'rails_helper'

describe 'When a user sends a POST request to /api/v1/items' do
  scenario 'they receive a 201 JSON  response if the record is successfully created' do
    item_params = attributes_for(:item)
    post "/api/v1/items", {:item => item_params}

    json_item = JSON.parse(response.body,:symbolize_names => true)
    item = Item.find(2)

    expect(response).to be_success
    expect(response.status).to eq 201
    expect(json_item.length).to eq 4
    expect(json_item[:id]).to eq item[:id]
    expect(json_item[:name]).to eq item[:name]
    expect(json_item[:description]).to eq item[:description]
    expect(json_item[:image_url]).to eq item[:image_url]
    expect(json_item).to_not have_key :created_at
    expect(json_item).to_not have_key :updated_at
  end
end