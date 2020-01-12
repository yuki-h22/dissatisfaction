class BitchesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @bitches = Bitch.all
    @user = User.all
    @empathy_count = Empathy.where(bitch_id: params[:bitch_id]).count
  end

  def new
    @bitch = Bitch.new
  end

  def create
    Bitch.create(bitch_params)
    redirect_to root_path
  end

  def empathy_create
    @empathy = Empaty.new(user_id: @current_user.id, bitch_id: params[:bitch_id])
    @empathy.save
    @bitch = Bitch.find_by(id: empathy.bitch_id)
    @empathy_count = Empathy.where(bitch_id: params[:bitch_id]).count
    render :index
  end

  def empathy_delete
    @empathy = Empathy.find_by(user_id: @current_user.id, bitch_id: params[:bitch_id])
    @bitch = Bitch.find_by(id: @empathy.bitch_id)
    @empathy.destroy
    @empathy_count = Empathy.where(bitch_id: params[:bitch_id]).count
    render :index
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
    params.require(:bitch).permit(:comment).merge(user_id: current_user.id)
  end

end
