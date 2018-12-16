class MeetsController < ApplicationController
  def index
  	@meets = Meet.all
  end
  def show 
  	@meet = Meet.find(params[:id])
  end
  def new
  	@meet = Meet.new
  end
  def destroy
  	@meet = Meet.find(params[:id])
  	@meet.destroy
  	redirect_to meets_path
  end
  def create
  	@meet = Meet.new(meet_params)
  	if @meet.save
  		redirect_to @meet
  	else
  		render :new
  	end
  end
  def edit
  	@meet = Meet.find(params[:id])
  end
  def update
  	@meet = Meet.find(params[:id])
  	if @meet.update_attributes( meet_params)
  		redirect_to @meet
  	else
  		render :edit
  	end
  end
  private

  def meet_params
  	params.require(:meet).permit(:title, :description, :location, :meetdate, :meetime)
  end
end
