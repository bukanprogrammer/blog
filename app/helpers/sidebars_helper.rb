module SidebarsHelper
  def recent_articles
    @articles = Article.last(5)
  end
end
