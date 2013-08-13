module ProviderOutpatientProceduresHelper

  def procedure_submitted_charges_data(provider_outpatient_procedure)
    [
      {
        procedure_name: provider_outpatient_procedure.apc,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i,
        state_average: provider_outpatient_procedure.state_average_charge.to_i,
        national_average: provider_outpatient_procedure.national_average_charge.to_i
      }
    ]
  end

  def procedure_total_payments_data(provider_outpatient_procedure)
    [
      {
        procedure_name: provider_outpatient_procedure.apc,
        payments: provider_outpatient_procedure.average_total_payments.to_i,
        state_average: provider_outpatient_procedure.state_average_paid.to_i,
        national_average: provider_outpatient_procedure.national_average_paid.to_i
      }
    ]
  end

  def procedure_submitted_charges_and_total_payments_data(provider_outpatient_procedure)
    [
      {
        procedure_name: provider_outpatient_procedure.apc,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i,
        payments: provider_outpatient_procedure.average_total_payments.to_i,
        state_average_charges: provider_outpatient_procedure.state_average_charge.to_i,
        national_average_charges: provider_outpatient_procedure.national_average_charge.to_i,
        state_average_payments: provider_outpatient_procedure.state_average_paid.to_i,
        national_average_payments: provider_outpatient_procedure.national_average_paid.to_i
      }
    ]
  end
end
