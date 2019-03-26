require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do

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
  scenario "They see the first product in the page" do
    # ACT
    visit root_path
    first(:link, @category.products.first.name).click

    # DEBUG / VERIFY
    expect(page).to have_css('.product-detail')
    expect(page).to have_content @category.products.first.quantity
    expect(page).to have_content('Product Reviews')
    save_screenshot
  end

end