require 'rails_helper'

describe Answer do
  it { should belong_to :question}
  it { should validate_presence_of :body}
  it "sends an email when the answer is created" do
    user = FactoryGirl.create(:user)
    ActionMailer::Base.deliveries.last.to.should eq [user.email]
  end
end
