class CreateStateOutpatientProcedures < ActiveRecord::Migration
  def self.up
    create_table :state_outpatient_procedures do |t|
      t.string :apc
      t.string :provider_state
      t.string :outpatient_services
      t.string :average_estimated_submitted_charges
      t.string :average_total_payments
      t.integer :year
      t.timestamps
    end
  end

  def self.down
    drop_table :state_outpatient_procedures
  end
end
