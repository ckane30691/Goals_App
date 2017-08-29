class GoalsController < ApplicationController
  before_action :require_logged_in, only: [:create]

  def index
    if logged_in?
      @goals = current_user.goals
      render :index
    else
      @goals = Goal.all_public_goals
      render :index
    end
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
    end
  end

  def new
end
