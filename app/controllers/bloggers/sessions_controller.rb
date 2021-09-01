# frozen_string_literal: true

class Bloggers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    #byebug
      #  blog=Blogger.find_by(email: params[:blogger][:email])
      #  if blog
      #   session[:blogger_id] = blog.id
      #   flash[:notice]="Signed in Successfully"
      #   redirect_to blogger_path(blog.id)
      #  else
      #   flash[:alert]="Incorrect login details"
      #   redirect_to blogger_session_path
      #  end
  end


  # DELETE /resource/sign_out
  def destroy
    #byebug
     super
    #  session[:blogger_id]=nil
    #  flash[:alert]="Logged out!!"
    # session.delete(:blogger_id)
    # session[:blogger_id]=nil
    # redirect_to root_path
  end
  

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
