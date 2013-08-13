module HealthProvidersHelper

  def procedure_services_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        label: provider_outpatient_procedure.just_name,
        value: provider_outpatient_procedure.outpatient_services
      }
    end
  end

  def procedure_charges_donut_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        label: provider_outpatient_procedure.just_name,
        value: provider_outpatient_procedure.average_estimated_submitted_charges.to_i
      }
    end
  end

  def procedure_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        procedure_name: provider_outpatient_procedure.apc,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i,
        state_average: provider_outpatient_procedure.state_average_charge.to_i,
        national_average: provider_outpatient_procedure.national_average_charge.to_i
      }
    end
  end

  def procedure_payment_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        procedure_name: provider_outpatient_procedure.apc,
        payments: provider_outpatient_procedure.average_total_payments.to_i,
        state_average: provider_outpatient_procedure.state_average_paid.to_i,
        national_average: provider_outpatient_procedure.national_average_paid.to_i
      }
    end
  end

end
