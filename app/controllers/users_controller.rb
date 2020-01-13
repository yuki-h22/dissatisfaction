class UsersController < ApplicationController
  def show
    @user = User.finnd(params[:id])
  end
end
