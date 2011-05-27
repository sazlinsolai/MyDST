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

  def create
    @dispense = Dispense.new(params[:dispense])
    @patient = params[:patient_id]
    
      if @dispense.save
         redirect_to(patient_path(@patient))
      else

      end
    

  end

  def work_in_progress
    
  end

end
