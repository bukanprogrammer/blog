class HomeController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 6).order(id: :desc)
    @categories = Category.first(4)
  end
end
