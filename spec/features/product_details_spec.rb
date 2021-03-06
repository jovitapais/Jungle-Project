require 'rails_helper'

# initial commit
# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
RSpec.feature "Visitors navigate from home page to product detail page", type: :feature, js: true do

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

  scenario "They see a product's details" do
    # ACT
    visit root_path
    save_screenshot('home page')

    first('.product').click_link 'Details'
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_text('Name')
  end
end