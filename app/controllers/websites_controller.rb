class WebsitesController < ApplicationController
  def new
  	@website = Website.new
  end

  def create
  	@website = Website.new(website_params)
  	@website.user = current_user
  	if @website.save
  		redirect_to websites_path
  	else
  		render 'new'
  	end
  end

  def index
  	@websites = Website.all.order('created_at DESC')
  end

  def show
  	@website=Website.find(params[:id])
  end

  private

  def website_params
  	params.require(:website).permit(:name, :url, :found)
  end
end
