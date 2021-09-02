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
        @blogger=Blogger.find(params[:id])
    end

    def update
        @blogger=Blogger.find(params[:id])
        if @blogger.update(params.require(:blogger).permit(:email,:password))
            flash[:notice]="Your account updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def destroy
        @blogger=Blogger.find(params[:id])
        @blogger.destroy
        session[:user_id]=nil
        flash[:notice]="Account and all associated bloggers deleted!"
        redirect_to bloggers_path
    end

    

end