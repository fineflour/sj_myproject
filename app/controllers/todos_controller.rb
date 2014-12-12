class TodoController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
    #@user =   current_user   
#    binding.pry
    @todo = Todo.find_by_user_id(current_user.id)

    if current_user
      @user_id = current_user.id 
    else
    @user_id =  "current_user" 
    end
    #[:current_user][:id]
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
          if @todo.save
            flash[:success] = "New todo has been created!"
            redirect_to @todo
          else
            render 'new'
          end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
