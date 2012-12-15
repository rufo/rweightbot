require "spec_helper"

describe RWeightbot::Weighing do
  subject{RWeightbot::Weighing.new(:date => "2012-01-01", :kilograms => "81.7", :pounds => "180.2")}

  it "should have a date" do
    subject.date.should eq(Date.new(2012, 1, 1))
  end

  it "should have the weight in pounds" do
    subject.pounds.should eq(180.2)
  end

  it "should have the weight in kilograms" do
    subject.kilograms.should eq(81.7)
  end
end
