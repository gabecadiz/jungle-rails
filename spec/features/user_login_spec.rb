require 'rails_helper'

RSpec.feature "Visitor logs into registered account", type: :feature, js: true do

  #SETUP
  before :each do
    @subject = User.create!({
      password: "password",
      password_confirmation: "password",
      first_name: "Gabe",
      last_name: "Cadiz",
      email: "gabetest@email.com"
    })
  end
  scenario "They click login button, fill in credentials and redirected back to root page with logout button and signed in as user.email in navbar id displayed" do
    # ACT
    visit root_path

   click_on 'Login'
   fill_in 'email', with: @subject.email
   fill_in 'password', with: @subject.password
   click_on 'Submit'

    # DEBUG / VERIFY
    expect(page).to have_content ("Signed in as #{@subject.email}")
    expect(page).to have_content ("Logout")
    save_screenshot
  end

end