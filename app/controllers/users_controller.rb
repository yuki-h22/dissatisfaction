class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bitches = Bitch.where(user_id: [@user.id]).page(params[:page]).per(12)
  end
end
