class ArticlesController < ApplicationController

    before_action :set_article, only:[:show, :edit, :update, :destroy]
    #before_action :require_user, except:[:show,:index]
    before_action :require_same_blogger, only:[:edit,:update,:destroy]

    def show
        #byebug
        #@article=Article.find(params[:id])
    end

    def index
        # @articles=Article.all
        @articles= Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article=Article.new
    end

    def edit
        #@article=Article.find(params[:id])
    end

    def create
        #render plain: params[:article]
        @article=Article.new(article_params)
        #render plain: @article
        #render plain: @article.inspect
        if @article.save
            flash[:notice]="Article was successfully created!!!"
            #redirect_to article_path(@article)
            #   or   #
            redirect_to article_path(@article)#@article
        else
            render 'new'
        end
    end

    def update
        #@article=Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice]="Article was updated successfully!!!"
            redirect_to article_path(@article)#@article
        else
            render 'edit'
        end
    end
    
    def destroy
        #@article=Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    def set_article
        @article=Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description, :blogger_id)
    end

    def require_same_blogger
        if current_blogger != @article.blogger && !current_blogger.admin?
            flash[:alert]="You can only edit or delete your own article"
            redirect_to @article
        end
    end
end