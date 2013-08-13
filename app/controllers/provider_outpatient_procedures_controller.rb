class ProviderOutpatientProceduresController < ApplicationController
  load_and_authorize_resource

  def index
    @provider_outpatient_procedures = ProviderOutpatientProcedure.order(:id).page(params[:page]).per(100)
  end

  def show
    @provider_outpatient_procedure = ProviderOutpatientProcedure.find(params[:id])
    @outpatient_procedure = OutpatientProcedure.find_by_apc(@provider_outpatient_procedure.apc)
    @health_provider = @provider_outpatient_procedure.health_provider
    @state_outpatient_procedure = StateOutpatientProcedure.find_by_apc_and_provider_state(@provider_outpatient_procedure.apc, @provider_outpatient_procedure.provider_state)
  end

  def new
    @provider_outpatient_procedure = ProviderOutpatientProcedure.new
  end

  def create
    @provider_outpatient_procedure = ProviderOutpatientProcedure.new(params[:provider_outpatient_procedure])
    if @provider_outpatient_procedure.save
      redirect_to @provider_outpatient_procedure, :notice => "Successfully created provider outpatient procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @provider_outpatient_procedure = ProviderOutpatientProcedure.find(params[:id])
  end

  def update
    @provider_outpatient_procedure = ProviderOutpatientProcedure.find(params[:id])
    if @provider_outpatient_procedure.update_attributes(params[:provider_outpatient_procedure])
      redirect_to @provider_outpatient_procedure, :notice  => "Successfully updated provider outpatient procedure."
    else
      render :action => 'edit'
    end
  end

  def import
    ProviderOutpatientProcedure.import(params[:file])
    redirect_to root_url, notice: "Provider Procedures imported."
  end

  def destroy
    @provider_outpatient_procedure = ProviderOutpatientProcedure.find(params[:id])
    @provider_outpatient_procedure.destroy
    redirect_to provider_outpatient_procedures_url, :notice => "Successfully destroyed provider outpatient procedure."
  end
end
