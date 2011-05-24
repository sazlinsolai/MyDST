class PrescriptionsController < ApplicationController
  respond_to :html, :json

  def index
    @patients = Patient.find(:all,:order => "created_at DESC")
    #respond_with(@patients)
  end

  def new
    @prescription = Prescription.new
    @patient = Patient.find(params[:patient_id])
  end

  def show
    @patient = Patient.find(params[:id])
    @prescriptions = @patient.prescriptions
    @redirect = params[:redirect] == "true" ? true : false
    render :layout => 'hijax_page'
  end

  def create
    @prescription = Prescription.new(params[:prescription])
    @patients = Patient.find(:all,:order => "created_at DESC")

    respond_with(@patients) do |format|
      if @prescription.save
        @prescription.update_attribute(:name_of_doctor, params[:hari])
        format.html { redirect_to(prescription_path(@prescription.patient_id, :redirect => true))}
      else
        format.html { render :action => "new"}
      end
    end
  end


end
