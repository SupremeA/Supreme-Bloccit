require 'rails_helper'

describe "Sign in flow" do

  #include TestFactories

  describe "successful" do
    it "redirects to the topics index" do
      user = create(:user)
      visit root_path

  within '.jumbotron' do
      click_link 'Sign In Here!'
    end
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_link 'Sign in'
      end

      expect(current_path).to eq topics_path
    end
  end
end
