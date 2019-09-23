class CommentsController < ApplicationController

  def create
    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:task_id])

    @comment = Comment.new comment_params
    @task.comments << @comment
    current_user.comments << @comment

    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    return if not current_user.comments.include?(@comment)

    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:task_id])

    if @comment.update comment_params
      @comments = @task.comments
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
    @comment = Comment.find(params[:id])

    return if not current_user.comments.include?(@comment)

    @project = Project.friendly.find(params[:project_id])
    @task_list = @project.task_lists.friendly.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:task_id])

    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  protected

    def comment_params
      params.require(:comment).permit(:body)
    end

end