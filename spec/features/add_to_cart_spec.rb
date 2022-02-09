require 'rails_helper'

# initialization

# RSpec.feature "AddToCarts", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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
  scenario "Product is added to cart" do
    # ACT
    visit root_path
    # within('#navbar') do
      puts page.html
      expect(page).to have_content('My Cart (0)')
 
      first('footer>form>button').click
      
      # DEBUG / VERIFY
      
      save_screenshot('add-to-cart.png')
      expect(page).to have_content('My Cart (1)')
    
  
  end
end 