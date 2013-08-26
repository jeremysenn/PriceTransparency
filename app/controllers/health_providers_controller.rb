class HealthProvidersController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  
  def index
#    @health_providers = HealthProvider.all
    @health_providers = HealthProvider.order(:name).page(params[:page]).per(100)
  end

  def show
    @health_provider = HealthProvider.find(params[:id])
    @provider_outpatient_procedures = ProviderOutpatientProcedure.find_all_by_provider_id(@health_provider.provider_id, :order => outpatient_procedure_sort_column + ' ' + sort_direction)
    @provider_inpatient_procedures = ProviderInpatientProcedure.find_all_by_provider_id(@health_provider.provider_id, :order => inpatient_procedure_sort_column + ' ' + sort_direction)
    @limited_provider_inpatient_procedures = ProviderInpatientProcedure.find_all_by_provider_id(@health_provider.provider_id, :limit => 40, :order => inpatient_procedure_sort_column + ' ' + sort_direction)

    @low_charge_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_covered_charges).first
    @high_charge_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_covered_charges).last
    @low_payment_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_total_payments).first
    @high_payment_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_total_payments).last

    @low_charge_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_estimated_submitted_charges).first
    @high_charge_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_estimated_submitted_charges).last
    @low_payment_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_total_payments).first
    @high_payment_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_total_payments).last
  end

  def new
    @health_provider = HealthProvider.new
  end

  def create
    @health_provider = HealthProvider.new(params[:health_provider])
    if @health_provider.save
      redirect_to @health_provider, :notice => "Successfully created health provider."
    else
      render :action => 'new'
    end
  end

  def edit
    @health_provider = HealthProvider.find(params[:id])
  end

  def update
    @health_provider = HealthProvider.find(params[:id])
    if @health_provider.update_attributes(params[:health_provider])
      redirect_to @health_provider, :notice  => "Successfully updated health provider."
    else
      render :action => 'edit'
    end
  end

  def import
    HealthProvider.import(params[:file])
    redirect_to root_url, notice: "Health Providers imported."
  end

  def destroy
    @health_provider = HealthProvider.find(params[:id])
    @health_provider.destroy
    redirect_to health_providers_url, :notice => "Successfully destroyed health provider."
  end

  private

  def sort_column
    (ProviderInpatientProcedure.column_names.include?(params[:sort]) or ProviderOutpatientProcedure.column_names.include?(params[:sort])) ? params[:sort] : "average_total_payments"
  end

  def inpatient_procedure_sort_column
    ProviderInpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "drg"
  end

  def outpatient_procedure_sort_column
    ProviderOutpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "apc"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
