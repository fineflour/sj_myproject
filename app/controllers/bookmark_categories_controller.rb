class BookmarkCategoriesController < ApplicationController
  def index
    @bookmark_categories = BookmarkCategory.all.order('id desc')  
  end
  def new
  end

  def show
    @bookmark_categories = BookmarkCategory.all.order('id desc')
#    authorize @bookmark_categories
  end

  def edit
  end

  def destroy
  end
end
