class PortfoliosController < ApplicationController

 layout 'portfolio'
 def index
   @portfolio_items = Portfolio.all
 end
 
 def angular
  @angular_portfolio_items = Portfolio.angular
 end
 
 def new
  @portfolio_item= Portfolio.new
  3.times {@portfolio_item.technologies.build}
 end
 
 def create
   @portfolio_item= Portfolio.new(portfolio_item_params)
  if @portfolio_item.save
   flash[:notice]= "your portfolio item is now live"
   redirect_to portfolios_path
   else
    render 'new'
  end
 end
 
 def show
   @portfolio_item= Portfolio.find(params[:id])
 end 
 
 def edit
  @portfolio_item= Portfolio.find(params[:id])
 end
 
 def update
  @portfolio_item= Portfolio.find(params[:id])
  if @portfolio_item.update(portfolio_item_params)
    flash[:notice] = "succesfully updated"
    redirect_to portfolios_path
  else
    render 'new'
  end
 end
 
 def destroy
  @portfolio_item= Portfolio.find(params[:id])
  if @portfolio_item.destroy
    flash[:notice] = "succesfully deleted"
    redirect_to portfolios_path
  else
   render 'new'
  end
 end 
 
 
 private 
 
 def portfolio_item_params
  params.require(:portfolio).permit(:title,:subtitle,:body,technologies_attributes: [:name])
 end

end


