class UsersController < ApplicationController
  


  def show
 
    @user = current_user
    binding.pry
    @todos = @user.todos
  
  end

  def index
  if !current_user
    redirect_to user_session_path
  else
    @user = current_user
    @todos = @user.todos.where(user_id: current_user.id)
    end
  end

end