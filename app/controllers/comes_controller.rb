class ComesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@come = Come.new
  end
  def create
	@meet = Meet.find(params[:meet_id])
    @comes = @meet.comes.create(come_params)

    redirect_to meet_path(@meet)
  end
  def destroy
  	@meet = Meet.find(params[:meet_id])
    @comes = @meet.comes.find(params[:id])
    @comes.destroy
    redirect_to meet_path(@meet)
  end
private
  def come_params
  	params.permit(:meet_id).merge(user_id: current_user.id).merge(come: true)
  end
end