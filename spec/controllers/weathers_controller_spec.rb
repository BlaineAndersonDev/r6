require 'rails_helper'

RSpec.describe WeathersController, :type => :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "responds to html by default" do
      post :create, :params => { :zip => "85205" }
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end

    it "responds to custom formats when provided in the params" do
      post :create, :params => { :zip => "85205" }, :format => :json
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

end # End Rspec WeathersController