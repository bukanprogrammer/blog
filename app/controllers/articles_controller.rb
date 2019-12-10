class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.where(publish: :y).paginate(page: params[:page], per_page: 12).order(id: :desc)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.where(publish: :y).friendly.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    @article.user = current_user

    if @article.publish == 'y' && @article.send_to_subscribers == 'y'
      @article.sent_to_subscribers = 'y'
    end

    respond_to do |format|
      if @article.save

        # Send new article to subscriber

        row = @article

        if @article.publish == 'y' && @article.send_to_subscribers == 'y'
          email = Subscriber.all.map{|p| p.email}
        else
          email = ['id.dedeirwanto@gmail.com']
        end 

        ArticleMailer.send_request(row, email)

        # end send new article

        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|

      if @article.sent_to_subscribers == 'n'
        if @article.update(article_params)

          # Send new article to subscriber

          row = @article

          if @article.publish == 'y' && @article.send_to_subscribers == 'y'
            email = Subscriber.all.map{|p| p.email}
            ArticleMailer.send_request(row, email)
          else
            email = ['id.dedeirwanto@gmail.com']
            ArticleMailer.send_request(row, email)
          end 

          # end to send all subscriber
         
          format.html { redirect_to admin_article_path(@article),  notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end

      elsif @article.sent_to_subscribers == 'y'
        if @article.update(article_params)

          format.html { redirect_to admin_article_path(@article),  notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :image_feature, :category_id, :publish, :user_id, :send_to_subscribers, :sent_to_subscribers)
    end
end
