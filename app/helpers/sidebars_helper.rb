module SidebarsHelper
  def newsletter
    subscriber = Subscriber.new
  end

  def recent_articles
    articles = Article.where(publish: :y).last(5)
  end

  def categories
    categories = Category.all
  end
end
