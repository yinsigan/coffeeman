require 'spec_helper'

describe "Homes" do

  subject { page }
  describe "home page" do
    before { site = Site.create }
    before { visit root_path }

    it { should have_content("coffeeman") }
  end
end
