class InpatientProcedure < ActiveRecord::Base
  attr_accessible :drg, :total_discharges, :average_covered_charges, :average_total_payments, :year
  include ActionView::Helpers

  searchable do
    text :drg

    integer :year
  end

  def just_code
    drg_code = drg.slice(0..2)
    return drg_code
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      InpatientProcedure.create! row.to_hash
    end
  end
end
