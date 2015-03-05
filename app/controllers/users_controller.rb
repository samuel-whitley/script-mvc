class UsersController < ApplicationController
  


  def show
 
    @user = current_user
    binding.pry
    @todo = @user.todos
  
  end

  def index
  if !current_user
    redirect_to user_session_path
  else
    @user = current_user
    @todo = @user.todos
    end
  end

end