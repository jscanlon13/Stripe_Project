class PlansController < ApplicationController

	before_filter :find_plan, :only => [:edit, :update, :show, :destroy]
  before_filter :authenticate_user!
  
  def new
  	@plan = Plan.new
  end

  def create
  	@plan = Plan.new(plan_params)
  	if @plan.save
	    redirect_to root_url, :notice => "Successfully Added Plan!"
  	else
    	render :new
  	end
  end

  def edit
  end

  def update
  	if @plan.update_attributes(plan_params)
  		redirect_to plans_path, :notice => "Successfully Updated Plan."
    else
      redirect_to plans_path, :notice => "Unable to update plan."
  	end
  end

  def destroy
  	if @plan.present?
  		@plan.destroy
  		flash[:notice] = "Successfully deleted plan"
  	end
  	redirect_to plans_path
  end

  def index                               #When you hit /plans it gets routed by the rails router into this index action (ruby function)
  	@plans = Plan.all                     #Defines a new instance variable called @plans  (instance variable is automatically available in the views in Rails)
  end                                     #Plan is the Plan Model Class and .all is a method which talks to the Model (plan.rb) which returns All the Plans from the database

  def show
  end

  private

  def find_plan
  	@plan = Plan.find(params[:id])
  end

  def plan_params
  	params.require(:plan).permit(:name, :price, :plan_code)
  end
end
