class UsersController < ApplicationController 
  access admin: :all

  def index
    @users = User.where(roles: :user)
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update user_params
      flash[:success] = "Successfully updated #{@user.full_name}'s user account"
      redirect_to edit_user_path(@user)
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    respond_to do |format|
      format.js
    end
  end

  private

    def user_params
      params.require(:user).permit(project_ids: [])
    end

end
