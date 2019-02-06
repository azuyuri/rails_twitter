class SessionsController < ApplicationController

  # GET /login
  def new
  end

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        # ユーザーログイン後にユーザー情報のページにリダイレクトする
        log_in user
        # チェックされていたらユーザーを記憶する
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # redirect_to @user
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy#(8.6)
    log_out if logged_in? #(9.16)ログイン中の場合のみログアウト
    redirect_to root_url#(8.30)
  end
end
