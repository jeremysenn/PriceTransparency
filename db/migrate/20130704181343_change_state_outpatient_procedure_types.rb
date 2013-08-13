class ChangeStateOutpatientProcedureTypes < ActiveRecord::Migration
  def up
    change_column :state_outpatient_procedures, :average_estimated_submitted_charges, :integer
    change_column :state_outpatient_procedures, :average_total_payments, :integer
    change_column :state_outpatient_procedures, :outpatient_services, :integer
  end

  def down
    change_column :state_outpatient_procedures, :average_estimated_submitted_charges, :string
    change_column :state_outpatient_procedures, :average_total_payments, :string
    change_column :state_outpatient_procedures, :outpatient_services, :string
  end
end
