class LocationsController < ApplicationController
  before_action :set_location, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:update]
  
  def index
    @locations = current_user.locations
  end

  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      redirect_to @location, notice: "Saved..."
    else
      flash[:alert] = "something went wrong...urgagagahhh!!"
      render :new
    end  
  end

  def update
    if @location.update(location_params)
      flash[:notice] = "Saved..."
    else
      flash[:notice] = "something wrong"
    end
    redirect_back(fallback_location: request.referer)
  end

  def show
  end
  
  private
    def set_location
      @location = Location.find(params[:id])
    end
    
    def location_params
      params.require(:location).permit(:location_type, :location_name)
    end 
    
    def is_authorized
      redirect_to root_path, alert: "Permission Denied" unless current_user.id == @location.user_id
    end
end
