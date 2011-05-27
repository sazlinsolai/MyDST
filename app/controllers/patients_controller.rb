class PatientsController < ApplicationController
  
  respond_to :html, :json


  def index
    @patients = Patient.find(:all,:order => "created_at DESC")
    #respond_with(@patients)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])

    respond_with(@patient) do |format|
      if @patient.save
        format.html { redirect_to(patient_path(@patient, :redirect => true), :notice => 'yes') }
      else
        format.html { render :action => "new" }
        
      end
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @redirect = params[:redirect] == "true"? true : false
    @prescription = @patient.prescriptions.where("prescription_due_date >= '#{Time.zone.now.to_date}' ")
    @dispense = Dispense.new
    render :layout => 'hijax_page'
  end

  def edit
    @patient = Patient.find(params[:id])
    
  end

  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html {redirect_to(@patient)}
      else
        format.html {render :action => 'edit'}
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }

    end
  end

end
