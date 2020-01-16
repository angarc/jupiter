class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :edit, :update, :show]

  def create
    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:task_list_id])
    @task = Task.new task_params
    @project.tasks << @task
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

  def edit
  end

  def update
    if @task.update task_params
      flash[:success] = 'Successfully updated the task'
      redirect_to project_path(@project)
    else
      flash[:danger] = @task.errors.ful_messages.to_sentence
      render :edit
    end
  end

  def toggle_complete
    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:task_id])
    @task.toggle_complete

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.js
    end
  end

  def show
    @comment = Comment.new
    @comments = @task.comments
  end

  private 

    def task_params
      params.require(:task).permit(:title, 
                                   :start_date, 
                                   :end_date, 
                                   :description, 
                                   :private, 
                                   :priority, 
                                   :attachments, 
                                   :complete, 
                                   user_ids: [], 
                                   category_ids: [])
    end

    def set_task
      @project = Project.friendly.find(params[:project_id])
      @task_list = @project.task_lists.friendly.find(params[:task_list_id])
      @task = @task_list.tasks.find(params[:id])
    end

end
