class BitchesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @bitches = Bitch.all.order("created_at DESC").page(params[:page]).per(12)
    @empathy = Empathy.new
    if current_user.sort_status == 1
      @bitches = Bitch.all.order("created_at").page(params[:page]).per(12)
    elsif current_user.sort_status == 2
      @bitches = Bitch.all.order("score DESC").page(params[:page]).per(12)
    elsif current_user.sort_status == 3
      @bitches = Bitch.all.order("score").page(params[:page]).per(12)
    else
    end
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
    bitch = Bitch.find(params[:id])
    bitch.destroy
    if bitch.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def change0
    current_user.update_attribute(:sort_status, "0")
    redirect_to root_path
  end

  def change1
    current_user.update_attribute(:sort_status, "1")
    redirect_to root_path
  end

  def change2
    current_user.update_attribute(:sort_status, "2")
    redirect_to root_path
  end

  def change3
    current_user.update_attribute(:sort_status, "3")
    redirect_to root_path
  end


  private

  def set_bitch
    @bitch = Bitch.find(params[:id])
  end

  def bitch_params
    params.require(:bitch).permit(:comment).merge(user_id: current_user.id)
  end

end
