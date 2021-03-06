class GoalsController < ApplicationController

  before_action :require_signed_in

  def new
  end

  def create
    @goal = Goal.new(goal_params)
    # debugger
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(current_user)
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :body, :user_id, :completion, :private)
  end
end
