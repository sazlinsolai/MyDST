class DispensesController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @dispense = Dispense.new
    @prescription = params[:id]
  end

  def work_in_progress
    
  end

end
