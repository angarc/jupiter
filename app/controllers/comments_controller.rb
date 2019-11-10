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

  private

    def comment_params
      params.require(:comment).permit(:body)
    end 

end
