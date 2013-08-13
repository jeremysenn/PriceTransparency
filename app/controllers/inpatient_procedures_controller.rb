class InpatientProceduresController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @inpatient_procedures = InpatientProcedure.all(:order => inpatient_procedure_sort_column + ' ' + sort_direction)
  end

  def show
    @inpatient_procedure = InpatientProcedure.find(params[:id])
    drg = @inpatient_procedure.just_code
    unless params[:zip].blank?
      coordinates = Geocoder.coordinates(params[:zip])
      search = Sunspot.search(ProviderInpatientProcedure) do
        fulltext drg
        with :year, 2011
        with(:location).in_radius(coordinates.first,coordinates.last,params[:radius])
        unless sort_column == "provider_name"
          order_by(sort_column, sort_direction)
        end
      end
      @provider_inpatient_procedures = search.results
    else
      @provider_inpatient_procedures = ProviderInpatientProcedure.find_all_by_drg(@inpatient_procedure.drg, :order => sort_column + ' ' + sort_direction)
    end


    @state_inpatient_procedures = StateInpatientProcedure.find_all_by_drg(@inpatient_procedure.drg, :order => state_sort_column + ' ' + sort_direction)
    @low_charge_state_inpatient_procedure = @state_inpatient_procedures.sort_by{|sip| (sip.average_covered_charges)}.first
    @high_charge_state_inpatient_procedure = @state_inpatient_procedures.sort_by{|sip| (sip.average_covered_charges)}.last
    @low_payment_state_inpatient_procedure = @state_inpatient_procedures.sort_by{|sip| (sip.average_total_payments)}.first
    @high_payment_state_inpatient_procedure = @state_inpatient_procedures.sort_by{|sip| (sip.average_total_payments)}.last
    @low_services_state_inpatient_procedure = @state_inpatient_procedures.sort_by{|sip| (sip.total_discharges)}.first
    @high_services_state_inpatient_procedure = @state_inpatient_procedures.sort_by{|sip| (sip.total_discharges)}.last
    unless @provider_inpatient_procedures.blank?
      @paginated_provider_inpatient_procedures = Kaminari.paginate_array(@provider_inpatient_procedures).page(params[:page]).per(50)

      @low_charge_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_covered_charges).first
      @high_charge_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_covered_charges).last

      @low_payment_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_total_payments).first
      @high_payment_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:average_total_payments).last

      @low_services_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:total_discharges).first
      @high_services_provider_inpatient_procedure = @provider_inpatient_procedures.sort_by(&:total_discharges).last
    end
  end

  def new
    @inpatient_procedure = InpatientProcedure.new
  end

  def create
    @inpatient_procedure = InpatientProcedure.new(params[:inpatient_procedure])
    if @inpatient_procedure.save
      redirect_to @inpatient_procedure, :notice => "Successfully created inpatient procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @inpatient_procedure = InpatientProcedure.find(params[:id])
  end

  def update
    @inpatient_procedure = InpatientProcedure.find(params[:id])
    if @inpatient_procedure.update_attributes(params[:inpatient_procedure])
      redirect_to @inpatient_procedure, :notice  => "Successfully updated inpatient procedure."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @inpatient_procedure = InpatientProcedure.find(params[:id])
    @inpatient_procedure.destroy
    redirect_to inpatient_procedures_url, :notice => "Successfully destroyed inpatient procedure."
  end

  def import
    InpatientProcedure.import(params[:file])
    redirect_to root_url, notice: "Inpatient Procedures imported."
  end

  private
  def sort_column
    ProviderInpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "provider_name"
  end

  def state_sort_column
    StateInpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "provider_state"
  end

  def inpatient_procedure_sort_column
    InpatientProcedure.column_names.include?(params[:sort]) ? params[:sort] : "drg"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
