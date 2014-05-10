class RamensController < ApplicationController
  def index
    @ramens = Ramen.all
  end

  def new
    @customer = Customer.find(params[:customer])
    @ramen = Ramen.new
  end

  def create
    @ramen = Ramen.new(ramen_params)
    if @ramen.save
      redirect_to customer_path(params[:ramen][:customer_id])
    else render 'new'
    end
  end

  def edit
  end

  def show

  end

  def update
    if @ramen.update(ramen_params)
      redirect_to customer_path(params[:ramen][:customer_id])
    else render 'edit'
    end
  end

  def destroy
  end

private
  def ramen_params
    params.require(:ramen).permit(:noodles, :broth, :spicy, :egg, :bean_sprouts, :mushrooms, :broccoli, :corn, :spicy_miso, :extra_pork)
  end
end
