class TodosController < ApplicationController
  
  def show
    @todo = Todo.all
  end

  def new

    @todo = Todo.new
  end

  def create
    binding.pry
    @user = current_user
    @todo = Todo.create(todo_params)
    @todo.update(user_id: current_user.id)
    binding.pry
    redirect_to :root
  end

  def destroy
    binding.pry
    @todo = Todo.find(params["id"])
    @todo.destroy
    redirect_to :root
  end

def todo_params
  params.require(:todo).permit(:notes,:user_id)
end
  
end