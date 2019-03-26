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
      expect(@subject1.errors.full_messages.include? "Email has already been taken").to eql(true)
    end
    it "is not valid with a created password less than 6 characters" do
      @subject1 = User.new({
        password: "passw",
        password_confirmation: "passw",
        first_name: "Gabe",
        last_name: "Cadiz",
        email: "gabetestdifferent@email.com"
      })
      @subject1.save
      expect(@subject1.errors.full_messages.include? "Password is too short (minimum is 6 characters)").to eql(true)
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
    @subject_test = User.new({
      password: "testpassword",
      password_confirmation: "testpassword",
      first_name: "Tester",
      last_name: "Last",
      email: "teSter@email.COM"
    })
    @subject_test.save   
    end
    it "can login with correct credentials" do
      expect(User.authenticate_with_credentials(@subject_test.email,@subject_test.password)).to eql(@subject_test)
    end

    it "can't login with the incorrect password" do
      expect(User.authenticate_with_credentials(@subject_test.email,"wrong password")).to eql(nil)
    end

    it "can't login with invalid email" do
      expect(User.authenticate_with_credentials("wrongemail@email.com",@subject_test.password)).to eql(nil)
    end

    it "can login with valid email that includes whitespace" do
      expect(User.authenticate_with_credentials(" tester@email.com ",@subject_test.password)).to eql(@subject_test)
    end

    it "can login with valid email in wrong case" do
      expect(User.authenticate_with_credentials(" TeStEr@email.com ",@subject_test.password)).to eql(@subject_test)
    end
  end
end
