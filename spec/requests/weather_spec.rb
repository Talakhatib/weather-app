require 'rails_helper'

RSpec.describe "Weathers", type: :request do
 context "search" do
    it "returns a success response" do
      get root_path
    end
  end
  context "api_data" do
    it "returns a success response" do
      post api_data_path , :params => {:city_name => "Saida"}
    end
  end


end
