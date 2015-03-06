class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_todos, only: [:show, :edit, :update, :destroy,:index]

  def index
    
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
     respond_to do |format|
    if @todo.save
     format.html {redirect_to :root}
     format.js { render :create}
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
  binding.pry
end

def update
  binding.pry
  @todo.notes=(params[:todo][:notes])
    respond_to do |format|
      if @todo.save
        format.html{redirect_to :root}
        format.js {render :edit}
      else
        render :root
      end
    end
end

private


  
def set_todos
  
@todo = @user.todos
end

def set_user
  
  @user = current_user
  
end

def todo_params
  params.require(:todo).permit(:notes, :user_id)
end
  
end