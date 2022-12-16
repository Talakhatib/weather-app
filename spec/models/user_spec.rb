require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    it "ensure the email validation" do 
      user = User.new(email:"examplegmail.com",city: "Beirut").save 
      expect(user).to eq(false)
    end

    it "ensure the presence of city" do 
      user = User.new(email:"example@gmail.com").save 
      expect(user).to eq(false)
    end

    it "save should success" do 
      user = User.new(email:"example@gmail.com",city: "Beirut").save 
      expect(user).to eq(true)
    end

  end
end
