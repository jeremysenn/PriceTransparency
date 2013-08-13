class HealthProvidersController < ApplicationController
  load_and_authorize_resource
  
  def index
#    @health_providers = HealthProvider.all
    @health_providers = HealthProvider.order(:name).page(params[:page]).per(100)
  end

  def show
    @health_provider = HealthProvider.find(params[:id])
    @provider_outpatient_procedures = ProviderOutpatientProcedure.find_all_by_provider_id(@health_provider.provider_id)
    @provider_inpatient_procedures = ProviderInpatientProcedure.find_all_by_provider_id(@health_provider.provider_id)
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
end
