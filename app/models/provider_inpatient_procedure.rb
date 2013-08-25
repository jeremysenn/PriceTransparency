class ProviderInpatientProcedure < ActiveRecord::Base
  attr_accessible :drg, :provider_id, :provider_name, :provider_street_address, :provider_city, :provider_state, :provider_zipcode, :hospital_referral_region_description, :total_discharges, :average_covered_charges, :average_total_payments, :year
  include ActionView::Helpers

  ### SUNSPOT SOLR SEARCHING ###
  searchable do
    text :drg, :provider_id, :provider_name, :state_name, :full_address

    latlon(:location) { Sunspot::Util::Coordinates.new(latitude, longitude) }

    integer :year
    integer :total_discharges
    integer :average_covered_charges
    integer :average_total_payments
  end

  def health_provider
    HealthProvider.find_by_provider_id(provider_id)
  end

#  def create_health_provider
#    health_provider = HealthProvider.find_by_provider_id(provider_id)
#    if health_provider.blank?
#      HealthProvider.create(:provider_id => provider_id, :name => provider_name, :address => provider_street_address, :city => provider_city, :state => provider_state, :zipcode => provider_zipcode, :hospital_referral_region_description => hospital_referral_region_description, :year => 2011)
#    end
#  end

  def latitude
    health_provider.latitude
  end

  def longitude
    health_provider.longitude
  end

  def state_average_covered_charges
      if StateInpatientProcedure.find_by_drg_and_provider_state(drg, provider_state)
        return StateInpatientProcedure.find_by_drg_and_provider_state(drg, provider_state).average_covered_charges
      else
        return nil
      end
  end

  def national_average_covered_charges
    if InpatientProcedure.find_by_drg(drg)
      return InpatientProcedure.find_by_drg(drg).average_covered_charges
    else
      return nil
    end
  end

  def state_average_paid
      if StateInpatientProcedure.find_by_drg_and_provider_state(drg, provider_state)
        return StateInpatientProcedure.find_by_drg_and_provider_state(drg, provider_state).average_total_payments
      else
        return nil
      end
  end

  def national_average_paid
    if InpatientProcedure.find_by_drg(drg)
      return InpatientProcedure.find_by_drg(drg).average_total_payments
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
    name = drg.at(6..-1)
    return name
  end

  def just_code
    drg_code = drg.slice(0..2)
    return drg_code
  end

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
      ProviderInpatientProcedure.create! row.to_hash
    end
  end
end
