class MeetsController < ApplicationController
	before_action :authenticate_user! , except:[:index,:show]
	before_action :find_meet, except:[:index,:new,:create]
  def index
  	@meets = Meet.all
  end
  def show
  	if user_signed_in?
		@come = Come.where("user_id = ? AND meet_id = ? AND come = ?", current_user.id, params[:id], true).last
	else
		@come = nil
	end

  	#@comes = Come.where("meet_id = ? AND come = ?", params[:id], true)

  	@comes = @meet.comes.where("meet_id = ? AND come = ?", params[:id], true)
  	#@users = User.find_by_id(@comes)
  	#@com = @comes.find(current_user.id)
  end
  def new
  	@meet = Meet.new
  end
  def destroy
  	@meet.destroy
  	redirect_to meets_path
  end
  def create
  	params[:meet][:user_id]=current_user.id
  	@meet = Meet.new(meet_params)

  	if @meet.save
  		redirect_to @meet
  	else
  		render :new
  	end
  end
  def edit
  end
  def update
  	if @meet.update_attributes( meet_params)
  		redirect_to @meet
  	else
  		render :edit
  	end
  end
  def mymethod
  end
  private

  def meet_params
  	params.require(:meet).permit(:title, :description, :location, :meetdate, :meetime, :user_id)
  end

  def find_meet
  	@meet = Meet.find(params[:id])
  end
end
