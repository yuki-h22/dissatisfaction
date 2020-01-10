class BitchesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @bitches = Bitch.all
  end

  def new
    @bitch = Bitch.new
  end

  def create

  end

  private

  def set_bitch
    @bitch = Bitch.find(params[:id])
  end

  def bitch_params
    params.require(:bitch).permit(:comment)
  end


end
