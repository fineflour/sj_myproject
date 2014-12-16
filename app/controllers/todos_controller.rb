class TodosController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def new
#    pry.binding
     @todo = Todo.new
  end

  def show
     @todo = Todo.find_by_user_id(current_user.id)
         if current_user
              @user_id = current_user.id 
         else
              @user_id =  "current_user" 
         end
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

  def update
  end

  def destroy
  end

  def todo_params
    params[:user_id] = @user_id
    params[:description]
  end
end
