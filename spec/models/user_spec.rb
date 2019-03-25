require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    User.destroy_all
    subject = User.new({
      password: "password",
      password_confirmation: "password",
      first_name: "Gabe",
      last_name: "Cadiz",
      email: "gabetest@email.com"
    })
    subject.save
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid with duplicate emails" do
      @subject1 = User.new({
        password: "password",
        password_confirmation: "password",
        first_name: "Gabe",
        last_name: "Cadiz",
        email: "GABETEST@email.com"
      })
      @subject1.save
      expect(@subject1).to_not be_valid
    end
    it "is not valid with a created password less than 6 characters" do
      @subject1 = User.new({
        password: "password",
        password_confirmation: "passw",
        first_name: "Gabe",
        last_name: "Cadiz",
        email: "gabetestdifferent@email.com"
      })
      @subject1.save
      expect(@subject1).to_not be_valid
    end

  end
end
