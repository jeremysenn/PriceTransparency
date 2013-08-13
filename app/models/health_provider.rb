class HealthProvider < ActiveRecord::Base
  attr_accessible :provider_id, :name, :address, :city, :state, :zipcode, :hospital_referral_region_description, :year, :latitude, :longitude
  include ActionView::Helpers

  geocoded_by :full_address
  after_validation :geocode#, :if => :full_address_changed?

  ### SUNSPOT SOLR SEARCHING ###
  searchable do
    text :provider_id, :name, :state_name, :hospital_referral_region_description, :full_address

    latlon(:location) { Sunspot::Util::Coordinates.new(latitude, longitude) }

    integer :year
  end

  def state_name
    states.invert[state]
  end

  def self.import(file)
    ### For importing small csv files ###
    CSV.foreach(file.path, headers: true) do |row|
      HealthProvider.create! row.to_hash
    end

    ### For importing large csv files ###
#    SmarterCSV.process(file.tempfile, {:chunk_size => 100, :key_mapping => {:unwanted_row => nil, :old_row_name => :new_name}}) do |chunk|
#      chunk.each do |h|
#        HealthProvider.create( h )
#      end
#    end
  end

  def pretty_address
#    return simple_format('<b>' + name + '</b><br/>' + address + '<br/>' + city + ', ' + state + ' ' + zipcode)
    return simple_format(address + '<br/>' + city + ', ' + state + ' ' + zipcode)
  end

  def full_address
    return address + ', ' + city + ', ' + state + ', ' + zipcode
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
  
end
