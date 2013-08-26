module HealthProvidersHelper

  ### OUTPATIENT ###

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
#        procedure_name: provider_outpatient_procedure.apc,
        procedure_name: provider_outpatient_procedure.just_code,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i,
        state_average: provider_outpatient_procedure.state_average_charge.to_i,
        national_average: provider_outpatient_procedure.national_average_charge.to_i
      }
    end
  end

  def procedure_payment_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
#        procedure_name: provider_outpatient_procedure.apc,
        procedure_name: provider_outpatient_procedure.just_code,
        payments: provider_outpatient_procedure.average_total_payments.to_i,
        state_average: provider_outpatient_procedure.state_average_paid.to_i,
        national_average: provider_outpatient_procedure.national_average_paid.to_i
      }
    end
  end

### INPATIENT ###

  def procedure_inpatient_services_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
        label: provider_inpatient_procedure.just_name,
        value: provider_inpatient_procedure.total_discharges
      }
    end
  end

  def procedure_inpatient_charges_donut_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
        label: provider_inpatient_procedure.just_name,
        value: provider_inpatient_procedure.average_covered_charges
      }
    end
  end

  def procedure_inpatient_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
#        procedure_name: provider_inpatient_procedure.drg,
        procedure_name: provider_inpatient_procedure.just_code,
        charges: provider_inpatient_procedure.average_covered_charges,
        state_average: provider_inpatient_procedure.state_average_covered_charges,
        national_average: provider_inpatient_procedure.national_average_covered_charges
      }
    end
  end

  def procedure_inpatient_payment_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
#        procedure_name: provider_inpatient_procedure.drg,
        procedure_name: provider_inpatient_procedure.just_code,
        payments: provider_inpatient_procedure.average_total_payments,
        state_average: provider_inpatient_procedure.state_average_paid,
        national_average: provider_inpatient_procedure.national_average_paid
      }
    end
  end

end
