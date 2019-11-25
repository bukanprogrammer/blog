class HomeController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
    @categories = Category.first(4)
  end
end
