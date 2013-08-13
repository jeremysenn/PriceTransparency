class OutpatientProceduresController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @outpatient_procedures = OutpatientProcedure.all(:order => outpatient_procedure_sort_column + ' ' + sort_direction)
  end

  def show
    @outpatient_procedure = OutpatientProcedure.find(params[:id])
    apc = @outpatient_procedure.just_code
    unless params[:zip].blank?
      coordinates = Geocoder.coordinates(params[:zip])
      search = Sunspot.search(ProviderOutpatientProcedure) do
        fulltext apc
        with :year, 2011
        with(:location).in_radius(coordinates.first,coordinates.last,params[:radius])
        unless sort_column == "provider_name"
          order_by(sort_column, sort_direction)
        end
      end
      @provider_outpatient_procedures = search.results
    else
      @provider_outpatient_procedures = ProviderOutpatientProcedure.find_all_by_apc(@outpatient_procedure.apc, :order => sort_column + ' ' + sort_direction)
    end
    

    @state_outpatient_procedures = StateOutpatientProcedure.find_all_by_apc(@outpatient_procedure.apc, :order => state_sort_column + ' ' + sort_direction)
    @low_charge_state_outpatient_procedure = @state_outpatient_procedures.sort_by{|sop| (sop.average_estimated_submitted_charges)}.first
    @high_charge_state_outpatient_procedure = @state_outpatient_procedures.sort_by{|sop| (sop.average_estimated_submitted_charges)}.last
    @low_payment_state_outpatient_procedure = @state_outpatient_procedures.sort_by{|sop| (sop.average_total_payments)}.first
    @high_payment_state_outpatient_procedure = @state_outpatient_procedures.sort_by{|sop| (sop.average_total_payments)}.last
    @low_services_state_outpatient_procedure = @state_outpatient_procedures.sort_by{|sop| (sop.outpatient_services)}.first
    @high_services_state_outpatient_procedure = @state_outpatient_procedures.sort_by{|sop| (sop.outpatient_services)}.last
    unless @provider_outpatient_procedures.blank?
      @paginated_provider_outpatient_procedures = Kaminari.paginate_array(@provider_outpatient_procedures).page(params[:page]).per(20)

      @low_charge_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_estimated_submitted_charges).first
      @high_charge_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_estimated_submitted_charges).last

      @low_payment_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_total_payments).first
      @high_payment_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:average_total_payments).last
      
      @low_services_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:outpatient_services).first
      @high_services_provider_outpatient_procedure = @provider_outpatient_procedures.sort_by(&:outpatient_services).last
    end
  end

  def new
    @outpatient_procedure = OutpatientProcedure.new
  end

  def create
    @outpatient_procedure = OutpatientProcedure.new(params[:outpatient_procedure])
    if @outpatient_procedure.save
      redirect_to @outpatient_procedure, :notice => "Successfully created outpatient procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @outpatient_procedure = OutpatientProcedure.find(params[:id])
  end

  def update
    @outpatient_procedure = OutpatientProcedure.find(params[:id])
    if @outpatient_procedure.update_attributes(params[:outpatient_procedure])
      redirect_to @outpatient_procedure, :notice  => "Successfully updated outpatient procedure."
    else
      render :action => 'edit'
    end
  end

  def import
    OutpatientProcedure.import(params[:file])
    redirect_to root_url, notice: "Procedures imported."
  end

  def destroy
    @outpatient_procedure = OutpatientProcedure.find(params[:id])
    @outpatient_procedure.destroy
    redirect_to outpatient_procedures_url, :notice => "Successfully destroyed outpatient procedure."
  end

  private
  def sort_column
    ProviderOutpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "provider_name"
  end

  def state_sort_column
    StateOutpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "provider_state"
  end

  def outpatient_procedure_sort_column
    OutpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "apc"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
