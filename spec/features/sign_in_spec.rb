require 'rails_helper'

describe "Sign in flow" do

  include TestFactories

  describe "Successful" do

    it "redirects to the topics index" do 
      user = authenticated_user
      visit root_path

      click_link 'Sign_In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_link 'Sign in'
        #click_button 'Sign in'
      end

      expect(current_path).to eq topics_path
    end
  end
end
