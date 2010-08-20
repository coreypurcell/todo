class TasksController < ApplicationController

  attr_accessor :complete
  respond_to :html, :xml, :js

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:notice] = "Task created"
   else
      flash[:error] = "Could not add task"
    end
    respond_with( @task, :location => list_path(@list) )
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Task updated"
    else
      flash[:error] = "Could not update task"
    end
    respond_with( @task, :location => list_path(@list) )
  end

  def destroy
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
    @task.destroy
    respond_with(@task, :location => list_path(@list))
  end

  def complete
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.toggle_completed
    @task.save
    @tasks = @list.tasks.active
    respond_with( @task, :location => list_path(@list) )
  end
end
