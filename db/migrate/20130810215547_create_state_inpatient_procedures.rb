class CreateStateInpatientProcedures < ActiveRecord::Migration
  def self.up
    create_table :state_inpatient_procedures do |t|
      t.string :drg
      t.string :provider_state
      t.integer :total_discharges
      t.decimal :average_covered_charges
      t.decimal :average_total_payments
      t.integer :year
      t.timestamps
    end
  end

  def self.down
    drop_table :state_inpatient_procedures
  end
end
