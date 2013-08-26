module ProviderInpatientProceduresHelper

  def provider_inpatient_procedure_covered_charges_data(provider_inpatient_procedure)
    [
      {
        procedure_name: provider_inpatient_procedure.drg,
        charges: provider_inpatient_procedure.average_covered_charges,
        state_average: provider_inpatient_procedure.state_average_covered_charges,
        national_average: provider_inpatient_procedure.national_average_covered_charges
      }
    ]
  end

  def provider_inpatient_procedure_total_payments_data(provider_inpatient_procedure)
    [
      {
        procedure_name: provider_inpatient_procedure.drg,
        payments: provider_inpatient_procedure.average_total_payments,
        state_average: provider_inpatient_procedure.state_average_paid,
        national_average: provider_inpatient_procedure.national_average_paid
      }
    ]
  end

end
