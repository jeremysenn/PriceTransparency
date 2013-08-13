class AddYearToOupatientProcedures < ActiveRecord::Migration
  def change
    add_column :outpatient_procedures, :year, :integer
  end
end
