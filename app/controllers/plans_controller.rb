class PlansController < ApplicationController

  def create
    @plan = Plan.new(plan_params)
    @user = current_user
    @plans = @user.plans
    @plan = @user.plans.create(plan_params)
    if @plan.save
      redirect_to edit_plans_path(@plan.id)
    else
      render action: :index
    end
  end

  def index
    @user = current_user
    @plans = @user.plans
    @plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
    @destination = @plan.destinations.build
    @spot = Spot.where(destination_id: @destination.id)
  end

  def update
    @plan = Plan.find(params[:id])
    @destination = Destination.where(plan_id: @plan.id)
    @spot = Spot.find_by(name: params[:spot_id])
    @destinatin.spot_id = @spot.id
    if plan.update(plan_params)
      redirect_to plans_path
    else
      render "edit"
    end
  end


  def autocomplete_spot
    spot_suggestions = Spot.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: spot_suggestions
      }
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:name, :start_date, :end_date,
      destinations_attributes: [:id, :time, :to_do, :_destroy])
  end
end

