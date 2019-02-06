class StaticPagesController < ApplicationController

  def home #13.40
    if logged_in?
      # @micropost = current_user.microposts.build if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end