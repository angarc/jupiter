class ProjectsController < ApplicationController

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
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update project_params
      flash[:success] = 'Successfully Updated Project'
      redirect_to @project
    else
      flash[:danger] = @project.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def destroy
    return if current_user.role != :admin
    @project = current_user.projects.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.js
    end
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end

end