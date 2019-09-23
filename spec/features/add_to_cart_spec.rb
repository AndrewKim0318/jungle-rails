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

  scenario "Cart count goes up" do
    visit root_path

    body = page.find(".product")
    body.hover
    body.find("footer button").click
    sleep 5

    # click_on 'Details'
    # puts page.html
    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    expect(page).to have_content 'My Cart (1)'
  end

end