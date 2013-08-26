class HomeController < ApplicationController
  
#  before_filter :login_required, :except => []

  def index
    zipcode = params[:zip]
    unless zipcode.blank?
      coordinates = Geocoder.coordinates(zipcode)
      latitude = coordinates.first
      longitude = coordinates.last
      radius = params[:radius]
    end
    unless params[:q].blank?
      if params[:filter].blank? or params[:filter] == 'All'
        unless zipcode.blank?
          @search = Sunspot.search(ProviderOutpatientProcedure, ProviderInpatientProcedure, HealthProvider) do
            fulltext params[:q]
            with :year, 2011
            with(:location).in_radius(latitude,longitude,radius)
            paginate :page => params[:page], :per_page => 15
          end
          @results = @search.results
        else
          @search = Sunspot.search(OutpatientProcedure, StateOutpatientProcedure, InpatientProcedure, StateInpatientProcedure, ProviderOutpatientProcedure, ProviderInpatientProcedure, HealthProvider) do
            fulltext params[:q]
            with :year, 2011
            paginate :page => params[:page], :per_page => 15
          end
        end
      elsif params[:filter] == 'Procedures'
        unless zipcode.blank?
          @search = Sunspot.search(ProviderOutpatientProcedure, ProviderInpatientProcedure) do
            fulltext params[:q]
            with :year, 2011
            with(:location).in_radius(latitude,longitude,radius)
            paginate :page => params[:page], :per_page => 15
          end
        else
          @search = Sunspot.search(OutpatientProcedure, InpatientProcedure, StateOutpatientProcedure, StateInpatientProcedure, ProviderOutpatientProcedure, ProviderInpatientProcedure) do
            fulltext params[:q]
            with :year, 2011
            paginate :page => params[:page], :per_page => 15
          end
        end
      elsif params[:filter] == 'Hospitals'
        unless zipcode.blank?
          @search = Sunspot.search(HealthProvider) do
            fulltext params[:q]
            with :year, 2011
            with(:location).in_radius(latitude,longitude,radius)
            paginate :page => params[:page], :per_page => 15
          end
        else
          @search = Sunspot.search(HealthProvider) do
            fulltext params[:q]
            with :year, 2011
            paginate :page => params[:page], :per_page => 15
          end
        end
      end
#      @outpatient_procedures = @search.results.select{|result| result.class.name == "OutpatientProcedure"}
#      @state_outpatient_procedures = @search.results.select{|result| result.class.name == "StateOutpatientProcedure"}
#      @providers = @search.results.select{|result| result.class.name == "HealthProvider"}
    else
#      @outpatient_procedures = []
#      @state_outpatient_procedures = []
#      @providers = []
    end
  end

end
