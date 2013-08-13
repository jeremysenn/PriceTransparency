class StateOutpatientProceduresController < ApplicationController
  load_and_authorize_resource

  def index
    @state_outpatient_procedures = StateOutpatientProcedure.all
  end

  def show
    @state_outpatient_procedure = StateOutpatientProcedure.find(params[:id])
    @outpatient_procedure = OutpatientProcedure.find_by_apc(@state_outpatient_procedure.apc)
    @provider_outpatient_procedures = ProviderOutpatientProcedure.find_all_by_apc_and_provider_state(@state_outpatient_procedure.apc, @state_outpatient_procedure.provider_state)
  end

  def new
    @state_outpatient_procedure = StateOutpatientProcedure.new
  end

  def create
    @state_outpatient_procedure = StateOutpatientProcedure.new(params[:state_outpatient_procedure])
    if @state_outpatient_procedure.save
      redirect_to @state_outpatient_procedure, :notice => "Successfully created state outpatient procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @state_outpatient_procedure = StateOutpatientProcedure.find(params[:id])
  end

  def update
    @state_outpatient_procedure = StateOutpatientProcedure.find(params[:id])
    if @state_outpatient_procedure.update_attributes(params[:state_outpatient_procedure])
      redirect_to @state_outpatient_procedure, :notice  => "Successfully updated state outpatient procedure."
    else
      render :action => 'edit'
    end
  end

  def import
    StateOutpatientProcedure.import(params[:file])
    redirect_to root_url, notice: "Procedures imported."
  end

  def destroy
    @state_outpatient_procedure = StateOutpatientProcedure.find(params[:id])
    @state_outpatient_procedure.destroy
    redirect_to state_outpatient_procedures_url, :notice => "Successfully destroyed state outpatient procedure."
  end
end

private
  def sort_column
    ProviderOutpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "provider_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
