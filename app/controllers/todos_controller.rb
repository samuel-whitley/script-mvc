class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_todos, only: [:show, :edit, :update, :destroy]

  def index
    binding.pry
    if !current_user
    redirect_to user_session_path
  else
    @todos = @user.todos
  end
end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = params["user_id"]
    if @todo.save
      respond_to do |format|
      format.html {redirect_to :root}
      format.js { }
      end
    else
      render :root
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


  
def set_todos
@todo = Todo.find(params[:id])
end

def set_user
  binding.pry
  @user = current_user
end

def todo_params
  params.require(:todo).permit(:notes, :user_id)
end
  
end