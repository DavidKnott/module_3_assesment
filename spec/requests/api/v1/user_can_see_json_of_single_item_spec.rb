require 'rails_helper'

describe "When a user sends a GET request to /api/v1/items" do
  scenario "they receive a 200 JSON response containing all items" do
    items = create_list(:item, 20)
    item  = items.first
    get '/api/v1/items/#{item.id}'

    json_item = JSON.parse(response.body,:symbolize_names => true)

    expect(response).to be_success
    expect(json_item.length).to eq 3
    expect(json_item[:id]).to eq item[:id]
    expect(json_item[:name]).to eq item[:name]
    expect(json_item[:description]).to eq item[:description]
    expect(json_item[:image_url]).to eq item[:image_url]
    expect(json_item).to_not have_key :created_at
    expect(json_item).to_not have_key :updated_at
  end
end