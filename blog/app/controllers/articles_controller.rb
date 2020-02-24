class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end


    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params) 
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        article_params = params.require(:article).permit(:title, :author, :text, :published_date)
        article = Article.find(params[:id])
        @article = article.update(article_params)
        redirect_to {@articles}
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :author, :text, :published_date)
    end

end
