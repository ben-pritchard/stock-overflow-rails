require "rails_helper"

describe "the add a user process" do
  it "adds a new user" do
    user = FactoryGirl.build(:user)
    visit "/"
    click_on "Create a user"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    click_on "Sign Up"
    expect(page).to have_content 'Welcome'
  end
end
