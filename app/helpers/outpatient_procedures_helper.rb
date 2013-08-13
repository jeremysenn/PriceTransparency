module OutpatientProceduresHelper

  def outpatient_procedure_submitted_charges_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        provider_name: provider_outpatient_procedure.provider_name,
        charges: provider_outpatient_procedure.average_estimated_submitted_charges.to_i,
      }
    end
  end

  def outpatient_procedure_total_payments_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        provider_name: provider_outpatient_procedure.provider_name,
        payments: provider_outpatient_procedure.average_total_payments.to_i,
      }
    end
  end

  def national_state_outpatient_procedure_submitted_charges_data(state_outpatient_procedures)
      state_outpatient_procedures.map do |state_outpatient_procedure|
      {
        state: state_outpatient_procedure.provider_state,
        charges: state_outpatient_procedure.average_estimated_submitted_charges.to_i,
      }
    end
  end

  def national_state_outpatient_procedure_total_payments_data(state_outpatient_procedures)
      state_outpatient_procedures.map do |state_outpatient_procedure|
      {
        state: state_outpatient_procedure.provider_state,
        payments: state_outpatient_procedure.average_total_payments.to_i,
      }
    end
  end

  def national_provider_outpatient_procedure_services_data(provider_outpatient_procedures)
      provider_outpatient_procedures.map do |provider_outpatient_procedure|
      {
        provider: provider_outpatient_procedure.provider_name,
        services: provider_outpatient_procedure.outpatient_services
      }
    end
  end

  def national_state_outpatient_procedure_services_data(state_outpatient_procedures)
      state_outpatient_procedures.map do |state_outpatient_procedure|
      {
        state: state_outpatient_procedure.provider_state,
        services: state_outpatient_procedure.outpatient_services
      }
    end
  end

end
