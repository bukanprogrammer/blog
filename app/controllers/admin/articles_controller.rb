module Admin
  class ArticlesController < ActionController::ArticlesController
    before_action :authenticate_user!
    def index
      @articles = Article.all.order(id: :desc)
    end
  end
end
