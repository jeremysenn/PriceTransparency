class CreateOutpatientProcedures < ActiveRecord::Migration
  def self.up
    create_table :outpatient_procedures do |t|
      t.string :apc
      t.integer :outpatient_services
      t.decimal :average_estimated_submitted_charges
      t.decimal :average_total_payments
      t.timestamps
    end
  end

  def self.down
    drop_table :outpatient_procedures
  end
end
