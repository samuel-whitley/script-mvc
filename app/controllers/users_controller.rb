class UsersController < ApplicationController
  def show
 
    @user = current_user
    binding.pry
    @todo = @user.todos
  
  end

  def index
  @user = current_user
  
  @todo = @user.todos
  end
end