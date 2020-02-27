class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        if user_signed_in?
            @article = Article.new
        else
            redirect_to new_user_session_url
        end
    end

    def create
        if user_signed_in?
            @article = Article.new(article_params)  
            if @article.save
                redirect_to @article
            else
                render 'new'
            end
        else
            redirect_to new_user_session_url
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        article = Article.find(params[:id])
        @article = article.update(article_params)
        redirect_to articles_path
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :author, :image, :text, :published_date)
    end

end
