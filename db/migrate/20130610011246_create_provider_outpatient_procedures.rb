class CreateProviderOutpatientProcedures < ActiveRecord::Migration
  def self.up
    create_table :provider_outpatient_procedures do |t|
      t.string :apc
      t.integer :provider_id
      t.string :provider_name
      t.string :provider_street_address
      t.string :provider_city
      t.string :provider_state
      t.string :provider_zipcode
      t.string :hospital_referral_region_description
      t.integer :outpatient_services
      t.decimal :average_estimated_submitted_charges
      t.decimal :average_total_payments
      t.integer :year
      t.timestamps
    end
  end

  def self.down
    drop_table :provider_outpatient_procedures
  end
end
