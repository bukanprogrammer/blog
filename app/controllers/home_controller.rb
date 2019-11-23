class HomeController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.first(4)
  end
end
