require 'rails_helper'

describe "When a user sends a GET request to /api/v1/items" do
  scenario "they receive a 200 JSON response containing all items" do
    create_list(:item, 20)
    get '/api/v1/items'

    json_items = JSON.parse(response.body,:symbolize_names => true)
    items = Item.all
    expect(response).to be_success
    expect(json_items.length).to eq items.length
    json_items.each_with_index do |json_item, i|
      expect(json_item[:id]).to eq items[i][:id]
      expect(json_item[:name]).to eq items[i][:name]
      expect(json_item[:description]).to eq items[i][:description]
      expect(json_item[:image_url]).to eq items[i][:image_url]
      expect(json_item).to_not have_key :created_at
      expect(json_item).to_not have_key :updated_at
    end
  end
end