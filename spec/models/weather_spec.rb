require 'rails_helper'

RSpec.describe Weather, type: :model do
  subject {
    described_class.new(
      zip: 85205,
      c_high: 25,
      c_low: 25,
      c_current: 25,
      c_average: 25,
      f_high: 25,
      f_low: 25,
      f_current: 25,
      f_average: 25
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a zip" do
    subject.zip = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a c_high" do
    subject.c_high = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a c_low" do
    subject.c_low = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a c_current" do
    subject.c_current = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a c_average" do
    subject.c_average = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a f_high" do
    subject.f_high = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a f_low" do
    subject.f_low = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a f_current" do
    subject.f_current = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a f_average" do
    subject.f_average = nil
    expect(subject).to_not be_valid
  end
  
end