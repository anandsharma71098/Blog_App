class ApplicationController < ActionController::Base
   def current_blogger
      @current_blogger ||= Blogger.find(session[:blogger_id]) if session[:blogger_id]
   end

   def blogger_signed_in?
      if session[:blogger_id]==nil
         puts session[:blogger_id]
         redirect_to root_path
      else
         !!current_blogger
      end
   end

   # def require_user
   #   if !blogger_signed_in?
   #      flash[:alert]="You must be logged in to perform that action"
   #      redirect_to new_blogger_session_path
   #   end
   # end

end
