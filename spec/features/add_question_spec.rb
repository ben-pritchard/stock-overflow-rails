require "rails_helper"

describe "the add a question process" do
  it "adds a new question" do
    user = FactoryGirl.create(:user)
    session = FactoryGirl.create(:session)
    visit new_question_path
    fill_in "Title", with: 'test title'
    fill_in "Body", with: 'bs'
    click_on "Create Question"
    expect(page).to have_content 'Welcome'
  end
end
