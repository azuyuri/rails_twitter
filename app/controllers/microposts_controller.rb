class MicropostsController < ApplicationController #13.34
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create #13.36
    @micropost = current_user.microposts.build(micropost_params)
  if @micropost.save
    flash[:success] = "Micropost created!"
    redirect_to root_url
    else
      @feed_items = [] #13.50
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture) #13.61
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end