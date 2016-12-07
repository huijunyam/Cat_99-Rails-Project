class CatRentalRequestsController < ApplicationController
  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def show
    @request = CatRentalRequest.find_by(id: params[:id])
    render :show
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)

    if @request.save
      redirect_to cat_rental_request_url(@request)
    else
      render :new
    end
  end

  def edit
    @request = CatRentalRequest.find_by(id: params[:id])
    render :edit
  end

  def update
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request.update_attributes(request_params)
      redirect_to cat_rental_request_url(@request)
    else
      render :edit
    end
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
