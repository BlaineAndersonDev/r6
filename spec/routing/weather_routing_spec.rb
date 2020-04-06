require "rails_helper"

RSpec.describe "WeatherRouter", :type => :routing do

  it "routes for index in Weather" do
    expect(get("/")).to route_to("weathers#index") # new in 2.6.0
  end
  # it "routes for index in Weather" do
  #   expect(post("/")).to route_to("weathers#create") # new in 2.6.0
  # end
  # it "routes for index in Weather" do
  #   expect(get("/")).to route_to("weathers#index") # new in 2.6.0
  # end
  # it "routes for index in Weather" do
  #   expect(get("/")).to route_to("weathers#index") # new in 2.6.0
  # end
  # it "routes for index in Weather" do
  #   expect(get("/")).to route_to("weathers#index") # new in 2.6.0
  # end

end