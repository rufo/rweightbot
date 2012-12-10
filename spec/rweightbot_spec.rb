require "spec_helper"

describe RWeightbot do
  let(:email) { CREDENTIALS["email"] }
  let(:password) { CREDENTIALS["password"] }
  subject {RWeightbot.new(:email => email, :password => password)}

  it "should accept a username and password upon initialization" do
    subject.email.should eq(email)
    subject.password.should eq(password)
  end

  it "should be able to see if a username and password are valid" do
    subject.valid_credentials?.should eq(true)
  end

  it "should be able to return a .csv of your data" do
    subject.csv.should match(/\,/)
  end
end
