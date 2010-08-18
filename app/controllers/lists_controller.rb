class ListsController < ApplicationController
  respond_to :html, :xml, :js

  def index
    respond_with(@lists = List.all)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List created."
      respond_with(@list, :location => list_path(@list))
    else
      flash[:error] = "Could not create the list."
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "List updated."
      respond_with(@list, :location => list_path(@list))
    else
      flash[:error] = "Could not update the list."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List deleted."
    else
      flash[:error] = "Could not delete the list."
    end
    redirect_to lists_path
  end

  def prioritize_tasks
    list = List.find(params[:id])
    tasks = list.tasks
    tasks.each do |task|
      task.position = params['task'].index(task.id.to_s) + 1
      task.save
    end
    render :nothing => true
  end
    
end
