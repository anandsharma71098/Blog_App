class BloggersController < ApplicationController
    #before_action :authenticate_blogger!
    #before_action :require_user, only:[:edit,:update]
    def index
        @bloggers= Blogger.paginate(page: params[:page], per_page: 5)
    end

    def show
        @blogger=Blogger.find(params[:id])
        @articles=@blogger.articles.paginate(page: params[:page], per_page: 5)
    end

    def edit
        
    end

    def destroy
        @blogger=Blogger.find(params[:id])
        @blogger.destroy
        session[:user_id]=nil
        flash[:notice]="Account and all associated bloggers deleted!"
        redirect_to bloggers_path
    end

    

end