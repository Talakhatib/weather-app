require 'rails_helper'

RSpec.describe "Users", type: :request do
  context  "user controller" do
    it "create method" do 
      post users_path ,:params => {:email => "example@gmail.com"}
    end

    it "unsubscribe method" do 
      user = User.new(email: "example@gmail.com", city: "beirut" )
      user.save
      get unsubscribe_path ,:params => {:user => user.id }
    end
  end
end
