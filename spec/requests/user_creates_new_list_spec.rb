require 'spec_helper'

context "User viewing lists index" do
  before do
    visit lists_path
    click "Create a new list."
  end

  context "who has clicked on create a new list" do

    it "sees a name field" do
      page.should have_xpath("//label[text()='Name:'] | //input[@name='list[name]']")
    end

    context "creates a new list" do
      before do
        fill_in "Name", :with => "Home"
        fill_in "Description", :with => "stuff to do at home"
        click_button "Create"
      end

      it "sees the new list" do
        page.should have_xpath("//*[@id='lists']//a[text()= 'Home']")
      end
    end
  end
end
