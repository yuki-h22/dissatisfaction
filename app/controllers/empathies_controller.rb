class EmpathiesController < ApplicationController

  def create
    @empathy = Empaty.create(user_id: current_user.id, bitch_id: params[:bitch_id])
    @empathies = Empathy.where(bitch_id: params[:bitch_id])
    @bitches = Bitch.all
  end

  def delete
    @empathy = Empathy.find_by(user_id: @current_user.id, bitch_id: params[:bitch_id])
    @empathy.destroy
    @empathies = Empathy.where(bitch_id: params[:bitch_id])
    @bitches = Bitch.all
  end
end
