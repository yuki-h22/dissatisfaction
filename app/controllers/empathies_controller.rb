class EmpathiesController < ApplicationController

  def create
    @empathy = Empathy.create(user_id: current_user.id, bitch_id: params[:bitch_id])
    @empathies = Empathy.where(bitch_id: params[:bitch_id])
    @bitches = Bitch.all
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @empathy = Empathy.find_by(user_id: current_user.id, bitch_id: params[:bitch_id])
    @empathy.destroy
    @empathies = Empathy.where(bitch_id: params[:bitch_id])
    @bitches = Bitch.all
    redirect_back(fallback_location: root_path)
  end
end
