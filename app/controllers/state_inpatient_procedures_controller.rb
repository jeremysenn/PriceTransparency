class StateInpatientProceduresController < ApplicationController
  def index
    @state_inpatient_procedures = StateInpatientProcedure.all
  end

  def show
    @state_inpatient_procedure = StateInpatientProcedure.find(params[:id])
  end

  def new
    @state_inpatient_procedure = StateInpatientProcedure.new
  end

  def create
    @state_inpatient_procedure = StateInpatientProcedure.new(params[:state_inpatient_procedure])
    if @state_inpatient_procedure.save
      redirect_to @state_inpatient_procedure, :notice => "Successfully created state inpatient procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @state_inpatient_procedure = StateInpatientProcedure.find(params[:id])
  end

  def update
    @state_inpatient_procedure = StateInpatientProcedure.find(params[:id])
    if @state_inpatient_procedure.update_attributes(params[:state_inpatient_procedure])
      redirect_to @state_inpatient_procedure, :notice  => "Successfully updated state inpatient procedure."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @state_inpatient_procedure = StateInpatientProcedure.find(params[:id])
    @state_inpatient_procedure.destroy
    redirect_to state_inpatient_procedures_url, :notice => "Successfully destroyed state inpatient procedure."
  end

  def import
    StateInpatientProcedure.import(params[:file])
    redirect_to root_url, notice: "State Inpatient Procedures imported."
  end
end
