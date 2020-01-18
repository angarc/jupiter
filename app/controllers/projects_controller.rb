class ProjectsController < ApplicationController
  before_action :set_project, only: [:destroy, :show, :update, :edit]
  before_action :authorize, except: [:index]
  access user: { except: [:edit, :update] }, admin: [:edit, :update]

  def index
    @projects = current_user.projects
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      current_user.projects << @project
      flash[:success] = 'Successfully Created Project'
      redirect_to @project
    else
      flash[:danger] = @project.errors.full_messages.to_sentence
      redirect_to projects_path
    end
  end

  def edit
  end

  def update
    if @project.update project_params
      flash[:success] = 'Successfully Updated Project'
      redirect_to @project
    else
      flash[:danger] = @project.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
    @task_lists = @project.task_lists
  end

  def destroy
    return if current_user.role != :super_admin
    @project.destroy
    respond_to do |format|
      format.js
    end
  end

  def completed_tasks
    @project = Project.friendly.find(params[:id])
    @tasks = @project.tasks.completed
  end

  private
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end

    def authorize
      set_project
      if !@project.assigned_to?(current_user) 
        flash[:danger] = "You are not authorized to view this project"
        redirect_to root_path
      end
    end
end
