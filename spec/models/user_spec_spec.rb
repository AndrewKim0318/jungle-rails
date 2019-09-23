require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Creates a new user" do
      newUser = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      expect(newUser).to be_valid
    end

    it "Does not create a new user" do
      newUser1 = User.create(email: "a@a", password: "asdf", password_confirmation: "asdf")
      expect(newUser1).to_not be_valid

      newUser2 = User.create(name: "Andrew", password: "asdf", password_confirmation: "asdf")
      expect(newUser2).to_not be_valid
    end

    it "email needs to be unique" do
      newUser1 = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      newUser2 = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      newUser3 = User.create(name: "Andrew", email: "A@a", password: "asdf", password_confirmation: "asdf")
      
      expect(newUser2).to_not be_valid
      expect(newUser3).to_not be_valid
    end

    it "password and password confirmation needs to match" do
      newUser = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "fdsa")
      expect(newUser).to_not be_valid
    end

    it "password has to be longer than 3 characters" do
      newUser1 = User.create(name: "Andrew", email: "a@a", password: "as", password_confirmation: "as")
      expect(newUser1).to_not be_valid

      newUser2 = User.create(name: "Andrew", email: "a@a", password: "asd", password_confirmation: "asd")
      expect(newUser2).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "logs you in" do
      newUser = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      user = User.authenticate_with_credentials("a@a", "asdf")
      expect(user).to be_present
    end

    it "does not logs you in" do
      newUser = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      user = User.authenticate_with_credentials("a@a", "as")
      expect(user).to_not be_present
    end

    it "spaces around email should still logs you in" do
      newUser = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      user = User.authenticate_with_credentials(" a@a", "asdf")
      expect(user).to be_present
    end

    it "email is not case sensitive" do
      newUser = User.create(name: "Andrew", email: "a@a", password: "asdf", password_confirmation: "asdf")
      user = User.authenticate_with_credentials("A@a", "asdf")
      expect(user).to be_present
    end
  end
end
