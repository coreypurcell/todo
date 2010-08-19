require 'spec_helper'

describe Task do

  describe "#archived" do


    it "should find archived tasks that are completed" do
      @archived_task = Factory(:completed_task, :completed_on => Time.now)
      Factory.create(:task)
      
      Task.archived.should == []
      
      Timecop.freeze(Date.today + 10) do
        Task.archived.should == [@archived_task]
      end
    end

    it "should not find tasks that have been toggled to incomplete" do
      
      task = Factory(:task, :completed_on => Time.now)
      Timecop.freeze(Date.today + 10) do
        Task.archived.should == []
      end
    end

  end

  describe "#active" do
    it "should find all recent tasks, and all incomplete tasks" do
      Factory.create(:task)
      Factory.create(:completed_task, :completed_on => Time.now)
      Factory.create(:completed_task, :completed_on => Date.today - 10)
      Factory.create(:task, :completed_on => Date.today - 10)

      Task.active.count.should == 3
    end
  end


end
