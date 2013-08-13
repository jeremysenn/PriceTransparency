class OutpatientProcedure < ActiveRecord::Base
  attr_accessible :apc, :outpatient_services, :average_estimated_submitted_charges, :average_total_payments, :year
  include ActionView::Helpers

  ### SUNSPOT SOLR SEARCHING ###
  searchable do
    text :apc
#    text :just_name
#    text :just_code

    integer :year
  end

  def just_name
    name=apc.at(6..-1)
    return name
#    name=apc
#    name.slice!(0..6)
#    return name
  end

  def just_code
    apc_code=apc.slice(0..3)
    return apc_code
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      OutpatientProcedure.create! row.to_hash
    end
  end
end
