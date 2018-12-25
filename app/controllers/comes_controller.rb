class ComesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@come = Come.new
  end
  def create
	@come = Come.where("user_id = ? AND meet_id = ? AND come = ?", current_user.id, params[:meet_id], true)
	#print @come
	if @come.count==0
		@meet = Meet.find(params[:meet_id])
	    @comes = @meet.comes.create(come_params)
	    redirect_to meet_path(@meet)
	 else
	 	destroy
	end
  end
  def destroy
    @comes = Come.where("user_id = ? AND meet_id = ? AND come = ?", current_user.id, params[:meet_id], true).last
    @comes.come = false
    @comes.save
    redirect_to meet_path(params[:meet_id])
  end
private
  def come_params
  	params.permit(:meet_id).merge(user_id: current_user.id).merge(come: true)
  end
end