module StateOutpatientProceduresHelper

  def state_outpatient_procedure_submitted_charges_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        provider_name: provider_outpatient_procedure.provider_name,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i
      }
    end
  end

  def state_outpatient_procedure_total_payments_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        provider_name: provider_outpatient_procedure.provider_name,
        payments: provider_outpatient_procedure.average_total_payments.to_i
      }
    end
  end

  def state_outpatient_procedure_submitted_charges_and_total_payments_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        provider_name: provider_outpatient_procedure.provider_name,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i,
        payments: provider_outpatient_procedure.average_total_payments.to_i
      }
    end
  end

end
