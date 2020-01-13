class BitchesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @bitches = Bitch.all
    @empathy = Empathy.new
    @empathy_count = Empathy.where(bitch_id: params[:bitch_id]).count
  end

  def new
    @bitch = Bitch.new
  end

  def create
    Bitch.create(bitch_params)
    redirect_to root_path
  end

  def show
    @bitch = Bitch.find(params[:id])
    @empathy = Empathy.new
  end

  def destroy
    if bitch.destroy
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
    params.require(:bitch).permit(:comment).merge(user_id: current_user.id)
  end

end
