class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        #render plain: params[:article]
        @article = Article.new(params.require(:article).permit(:title, :description))
       ## @article = Article.new(params[:title,:description])
        #render plan: @article
        if @article.save
            flash[:notice] = "El articulo fue creado con exito!"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

end