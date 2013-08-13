class CreateInpatientProcedures < ActiveRecord::Migration
  def self.up
    create_table :inpatient_procedures do |t|
      t.string :drg
      t.integer :total_discharges
      t.decimal :average_covered_charges
      t.decimal :average_total_payments
      t.integer :year
      t.timestamps
    end
  end

  def self.down
    drop_table :inpatient_procedures
  end
end
