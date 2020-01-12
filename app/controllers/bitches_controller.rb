class BitchesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @bitches = Bitch.all
    @user = User.all
  end

  def new
    @bitch = Bitch.new
  end

  def create
    Bitch.create(bitch_params)
  end

  def destroy
    if @bitch.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private

  def set_bitch
    @bitch = Bitch.find(params[:id])
  end

  def bitch_params
    params.require(:bitch).permit(:comment).marge(user_id: current_user.id)
  end


end
