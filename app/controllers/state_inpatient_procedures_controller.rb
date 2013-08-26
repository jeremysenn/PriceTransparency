class StateInpatientProceduresController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @state_inpatient_procedures = StateInpatientProcedure.all
  end

  def show
    logger.debug "SORT COLUMN: #{sort_column}"
    @state_inpatient_procedure = StateInpatientProcedure.find(params[:id])
    @inpatient_procedure = InpatientProcedure.find_by_drg(@state_inpatient_procedure.drg)
    @provider_inpatient_procedures = ProviderInpatientProcedure.find_all_by_drg_and_provider_state(@state_inpatient_procedure.drg, @state_inpatient_procedure.provider_state, :order => sort_column + ' ' + sort_direction)
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

  private
    def sort_column
      ProviderInpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "provider_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
