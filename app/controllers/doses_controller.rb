class DosesController < ApplicationController


  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
    @dose = Dose.new
  end

  def new
      @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def edit
  end


  def update
    @dose.update(dose_params)
  end

  def destroy
    @dose.destroy
  end

private

  def find_dose
    @dose = Dose.find(params[:id])
  end


  def dose_params
    params.require(:dose).permit(:name)
  end





end
