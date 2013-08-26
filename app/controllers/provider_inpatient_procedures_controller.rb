class ProviderInpatientProceduresController < ApplicationController
  def index
    @provider_inpatient_procedures = ProviderInpatientProcedure.order(:id).page(params[:page]).per(100)
  end

  def show
    @provider_inpatient_procedure = ProviderInpatientProcedure.find(params[:id])
    @inpatient_procedure = InpatientProcedure.find_by_drg(@provider_inpatient_procedure.drg)
    @health_provider = @provider_inpatient_procedure.health_provider
    @state_inpatient_procedure = StateInpatientProcedure.find_by_drg_and_provider_state(@provider_inpatient_procedure.drg, @provider_inpatient_procedure.provider_state)
  end

  def new
    @provider_inpatient_procedure = ProviderInpatientProcedure.new
  end

  def create
    @provider_inpatient_procedure = ProviderInpatientProcedure.new(params[:provider_inpatient_procedure])
    if @provider_inpatient_procedure.save
      redirect_to @provider_inpatient_procedure, :notice => "Successfully created provider inpatient procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @provider_inpatient_procedure = ProviderInpatientProcedure.find(params[:id])
  end

  def update
    @provider_inpatient_procedure = ProviderInpatientProcedure.find(params[:id])
    if @provider_inpatient_procedure.update_attributes(params[:provider_inpatient_procedure])
      redirect_to @provider_inpatient_procedure, :notice  => "Successfully updated provider inpatient procedure."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @provider_inpatient_procedure = ProviderInpatientProcedure.find(params[:id])
    @provider_inpatient_procedure.destroy
    redirect_to provider_inpatient_procedures_url, :notice => "Successfully destroyed provider inpatient procedure."
  end

  def import
    ProviderInpatientProcedure.import(params[:file])
    redirect_to root_url, notice: "Provider Inpatient Procedures imported."
  end
end
