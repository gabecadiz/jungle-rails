require 'rails_helper'

RSpec.feature "Visitor adds to cart", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They click an add button and their cart increases by 1" do
    # ACT
    visit root_path

    first(:button, 'Add').click

    # sleep(2.seconds)
    # DEBUG / VERIFY
    within('nav') { expect(page).to have_content('My Cart (1)') }
    save_screenshot
    # expect(page).to have_css 'article.product', count:10
  end

end