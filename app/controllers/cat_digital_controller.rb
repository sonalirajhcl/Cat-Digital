class CatDigitalController < ApplicationController

  def create
    @digital = CatDigital.new(digital_params)
    if @digital.save
      render json: @digital, status: :created
    else
      render json: @digital.errors, status: :unprocessable_entity
    end
  end

  def update
    @digital = CatDigital.find(params[:id])
    if @digital.update(digital_params)
      render json: @digital
    else
      render json: @datum.errors, status: :unprocessable_entity
    end
  end

  private

  def digital_params
    params.require(:datum).permit(:name, :email)
  end
  
end
