class TodoController < ApplicationController
  def index
  end

  def show
    #@user =   current_user   
    @todo = Todo.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
