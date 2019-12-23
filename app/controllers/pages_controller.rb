class PagesController < ApplicationController
  def home
    @articles = Article.where(publish: :y).paginate(page: params[:page], per_page: 6).order(id: :desc)
    @categories = Category.first(4)
  end

  def about
  end

  def privacy_policy
  end

  def terms
  end
end
