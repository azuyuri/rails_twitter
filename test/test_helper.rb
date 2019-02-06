require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  fixtures :all

  # テストユーザーがログイン中の場合(8.25)にtrueを返す(8.26)
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーとしてログイン(9.24)
  def log_in_as(user)
    session[:user_id] = user_id
  end
end

class ActionDispatch::IntegrationTest

  # テストユーザーとしてログイン(9.24)
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email, 
                                         password: password, 
                                         remember_me: remember_me }}
  end
end
