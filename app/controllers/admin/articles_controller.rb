module Admin
  class ArticlesController < ActionController::ArticlesController
    before_action :authenticate_user!

    def index
      @articles = Article.all.order(id: :desc)
    end

    def show
      @article = Article.find(params[:id])
    end
  end
end
