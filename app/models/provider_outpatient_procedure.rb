class ProviderOutpatientProcedure < ActiveRecord::Base
  attr_accessible :apc, :provider_id, :provider_name, :provider_street_address, :provider_city, :provider_state, :provider_zipcode, :hospital_referral_region_description, :outpatient_services, :average_estimated_submitted_charges, :average_total_payments, :year
  include ActionView::Helpers

  ### SUNSPOT SOLR SEARCHING ###
  searchable do
    text :apc, :provider_id, :provider_name, :state_name, :full_address
    
    latlon(:location) { Sunspot::Util::Coordinates.new(latitude, longitude) }

    integer :year
    integer :outpatient_services
    integer :average_estimated_submitted_charges
    integer :average_total_payments
  end

  def health_provider
    HealthProvider.find_by_provider_id(provider_id)
  end

  def latitude
    health_provider.latitude
  end

  def longitude
    health_provider.longitude
  end

  def state_average_charge
      if StateOutpatientProcedure.find_by_apc_and_provider_state(apc, provider_state)
        return StateOutpatientProcedure.find_by_apc_and_provider_state(apc, provider_state).average_estimated_submitted_charges
      else
        return nil
      end
  end

  def national_average_charge
    if OutpatientProcedure.find_by_apc(apc)
      return OutpatientProcedure.find_by_apc(apc).average_estimated_submitted_charges
    else
      return nil
    end
  end

  def state_average_paid
      if StateOutpatientProcedure.find_by_apc_and_provider_state(apc, provider_state)
        return StateOutpatientProcedure.find_by_apc_and_provider_state(apc, provider_state).average_total_payments
      else
        return nil
      end
  end

  def national_average_paid
    if OutpatientProcedure.find_by_apc(apc)
      return OutpatientProcedure.find_by_apc(apc).average_total_payments
    else
      return nil
    end
  end

  def pretty_address
    return simple_format(provider_street_address + '<br/>' + provider_city + ', ' + provider_state + ' ' + provider_zipcode + '<br/>' + hospital_referral_region_description)
#    return simple_format('<b>' + provider_name.titleize + '</b><br/>' + provider_street_address + '<br/>' + provider_city + ', ' + provider_state + ' ' + provider_zipcode + '<br/>' + hospital_referral_region_description)
  end

  def full_address
    return provider_street_address + ', ' + provider_city + ', ' + provider_state + ', ' + provider_zipcode
  end

  def just_name
    name=apc.at(6..-1)
    return name
  end

  def just_code
    apc_code=apc.slice(0..3)
    return apc_code
  end

#  def just_name
#    name=apc
#    name.slice!(0..6)
#    return name
#  end

  def state_name
    states.invert[provider_state]
  end

  def states
    {
      "Alabama" => "AL",
      "Alaska" => "AK",
      "Arizona" => "AZ",
      "Arkansas" => "AR",
      "California" => "CA",
      "Colorado" => "CO",
      "Connecticut" => "CT",
      "Delaware" => "DE",
      "District of Columbia" => "DC",
      "Florida" => "FL",
      "Georgia" => "GA",
      "Hawaii" => "HI",
      "Idaho" => "ID",
      "Illinois" => "IL",
      "Indiana" => "IN",
      "Iowa" => "IA",
      "Kansas" => "KS",
      "Kentucky" => "KY",
      "Louisiana" => "LA",
      "Maine" => "ME",
      "Maryland" => "MD",
      "Massachusetts" => "MA",
      "Michigan" => "MI",
      "Minnesota" => "MN",
      "Mississippi" => "MS",
      "Missouri" => "MO",
      "Montana" => "MT",
      "Nebraska" => "NE",
      "Nevada" => "NV",
      "New Hampshire" => "NH",
      "New Jersey" => "NJ",
      "New Mexico" => "NM",
      "New York" => "NY",
      "North Carolina" => "NC",
      "North Dakota" => "ND",
      "Ohio" => "OH",
      "Oklahoma" => "OK",
      "Oregon" => "OR",
      "Pennsylvania" => "PA",
      "Rhode Island" => "RI",
      "South Carolina" => "SC",
      "South Dakota" => "SD",
      "Tennessee" => "TN",
      "Texas" => "TX",
      "Utah" => "UT",
      "Vermont" => "VT",
      "Virginia" => "VA",
      "Washington" => "WA",
      "West Virginia" => "WV",
      "Wisconsin" => "WI",
      "Wyoming" => "WY"
    }
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      ProviderOutpatientProcedure.create! row.to_hash
    end
  end
end
