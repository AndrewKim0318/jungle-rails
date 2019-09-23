require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    
  end

  scenario "They see all products" do
    visit root_path

    body = page.find(".product")
    body.hover
    body.find("header a").click
    sleep 5

    # click_on 'Details'
    # puts page.html
    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    expect(page).to have_content 'Quantity'
  end

end