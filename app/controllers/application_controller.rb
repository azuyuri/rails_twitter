class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #8.13
  
  private

  # ユーザーのログインを確認する 13.32
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
