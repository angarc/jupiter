class TasksController < ApplicationController

  def create
    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:task_list_id])
    @task = Task.new task_params
    @task_list.tasks << @task

    if @task.save
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
    @task = Task.find(params[:id])

    @task.destroy

    respond_to do |format|
      format.js
    end
  end

  private 

    def task_params
      params.require(:task).permit(:title, :start_date, :end_date, :description, :private, :priority, :user_ids, :attachments)
    end

end