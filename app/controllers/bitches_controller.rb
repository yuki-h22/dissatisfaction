class BitchesController < ApplicationController

  def index
    @bitches = Bitch.all
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
