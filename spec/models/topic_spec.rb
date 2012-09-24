require 'spec_helper'

describe Topic do
  before do
    @topic = Topic.new(title: "ddddddd", content: "aaaaa")
  end

  subject { @topic }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when title is not present" do
    before { @topic.title = " " }
    it { should_not be_valid }
  end
  describe "when title is too long" do
    before { @topic.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @topic.title= "aa" }
    it { should_not be_valid }
  end

  describe "when topic title is already taken" do
    before do
      topic_with_same_title = @topic.dup
      topic_with_same_title.save
    end

    it { should_not be_valid }
  end
end
