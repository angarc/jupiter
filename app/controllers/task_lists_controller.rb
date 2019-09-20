class TaskListsController < ApplicationController

  def create
    @task_list = TaskList.new task_list_params
    @project = Project.friendly.find(params[:project_id])
    @project.task_lists << @task_list

    if @task_list.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:id])

    if @task_list.update task_list_params
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @task_list = TaskList.friendly.find(params[:id])

    @task_list.destroy

    respond_to do |format|
      format.js
    end
  end

  private

    def task_list_params
      params.require(:task_list).permit(:name)
    end

end