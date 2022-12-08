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

  context "search" do
    it "returns a success response" do
      get root_path
    end
  end

  context "list of last 10 researches" do
    it "returns a success response" do
      post list_path
    end
  end

end
