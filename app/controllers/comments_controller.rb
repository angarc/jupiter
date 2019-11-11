class CommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @comment = current_user.comments.build(comment_params) 
    @comment.task_id = @task.id
    if @comment.save
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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])

    if @comment.update comment_params
      flash[:success] = "Successfully updated your comment"
      redirect_to project_task_list_task_path(@task.project, @task.task_list, @task) 
    else
      flash[:danger] = @comment.errors.full_messages.to_sentence
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end 
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end 

end
