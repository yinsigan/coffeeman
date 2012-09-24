require 'spec_helper'

describe User do
  before do
    @user = User.new(username: "ganweiliang", email: "ganweiliang@qq.com",
                     password: "123456", password_confirmation: "123456")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:username)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch"}
    it { should_not be_valid }
  end

end
