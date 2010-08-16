require 'spec_helper'

context "User viewing the lists index" do
  let(:list) { Factory.create(:list) }

  before do
    list
    visit lists_path
    click list.name
  end

  context "who has clicked through to list page" do

    it "sees the list name" do
      page.should have_xpath("//*[@id='list']/h1", :text => list.name)
    end

    it "sees list of todos" do
      page.should have_xpath("//*[@id='list']//ul[@id='todos']")
    end

  end
end
