module InpatientProceduresHelper
  def inpatient_procedure_submitted_charges_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
        provider_name: provider_inpatient_procedure.provider_name,
        charges: provider_inpatient_procedure.average_covered_charges,
      }
    end
  end

  def inpatient_procedure_total_payments_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
        provider_name: provider_inpatient_procedure.provider_name,
        payments: provider_inpatient_procedure.average_total_payments,
      }
    end
  end

  def national_state_inpatient_procedure_submitted_charges_data(state_inpatient_procedures)
      state_inpatient_procedures.map do |state_inpatient_procedure|
      {
        state: state_inpatient_procedure.state_name,
        charges: state_inpatient_procedure.average_covered_charges,
      }
    end
  end

  def national_state_inpatient_procedure_total_payments_data(state_inpatient_procedures)
      state_inpatient_procedures.map do |state_inpatient_procedure|
      {
        state: state_inpatient_procedure.state_name,
        payments: state_inpatient_procedure.average_total_payments,
      }
    end
  end

  def national_provider_inpatient_procedure_services_data(provider_inpatient_procedures)
      provider_inpatient_procedures.map do |provider_inpatient_procedure|
      {
        provider: provider_inpatient_procedure.provider_name,
        services: provider_inpatient_procedure.total_discharges
      }
    end
  end

  def national_state_inpatient_procedure_services_data(state_inpatient_procedures)
      state_inpatient_procedures.map do |state_inpatient_procedure|
      {
        state: state_inpatient_procedure.state_name,
        services: state_inpatient_procedure.total_discharges
      }
    end
  end

end
