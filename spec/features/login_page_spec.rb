require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content 'logged'
  end
end
