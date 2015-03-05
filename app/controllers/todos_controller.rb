class TodosController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :set_todos, only: [:edit, :update]

  def show
    @todo = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = params["user_id"]
    respond_to do |format|
      if @todo.save
    format.html {redirect_to :root}
    format.js { render :create }
  else
    render :root
  end
    end
  end

  def destroy
    @todo = Todo.find(params["id"])
    @todo.destroy
    respond_to do |format|
    format.html {redirect_to :root}
  end
end

def edit


end

def update
  binding.pry
  @todo.notes=(params[:todo][:notes])
  respond_to do |format|
    if @todo.save
      format.html{redirect_to :root}
    else
      render :root
    end
  end
end

private

def set_user
@user=User.find(params[:user_id])
end
  
def set_todos
@todo = Todo.find(params[:id])
end

def todo_params
  params.require(:todo).permit(:notes)
end
  
end