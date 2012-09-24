require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "signup" do
    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Username"              , with: "ganweiliang"
        fill_in "Email"                 , with: "ganweiliang886@gmail.com"
        fill_in "Password"              , with: "123456"
        fill_in "Password confirmation" , with: "123456"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
