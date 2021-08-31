class ApplicationController < ActionController::Base
   def require_user
     if !blogger_signed_in?
        flash[:alert]="You must be logged in to perform that action"
        redirect_to new_blogger_session_path
     end

   end
end
