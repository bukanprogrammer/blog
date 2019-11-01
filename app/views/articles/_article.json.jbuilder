json.extract! article, :id, :title, :content, :image_feature, :created_at, :updated_at
json.url article_url(article, format: :json)
