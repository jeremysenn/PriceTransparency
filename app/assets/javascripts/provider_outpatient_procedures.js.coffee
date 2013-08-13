# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  if $('#provider_outpatient_procedure_submitted_charges_graph').length
    bar1 = Morris.Bar
      element: "provider_outpatient_procedure_submitted_charges_graph"
      data: $('#provider_outpatient_procedure_submitted_charges_graph').data('procedure')
      xkey: 'procedure_name'
      ykeys: ['charges', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      preUnits: '$'
      hideHover: 'auto'

  if $('#provider_outpatient_procedure_total_payments_graph').length
    bar2 = Morris.Bar
      element: "provider_outpatient_procedure_total_payments_graph"
      data: $('#provider_outpatient_procedure_total_payments_graph').data('procedure')
      xkey: 'procedure_name'
      ykeys: ['payments', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      preUnits: '$'
      hideHover: 'auto'

  if $('#provider_outpatient_procedure_submitted_charges_and_total_payments_graph').length
    Morris.Bar
      element: "provider_outpatient_procedure_submitted_charges_and_total_payments_graph"
      data: $('#provider_outpatient_procedure_submitted_charges_and_total_payments_graph').data('procedure')
      xkey: 'procedure_name'
      ykeys: ['charges', 'state_average_charges', 'national_average_charges', 'payments', 'state_average_payments', 'national_average_payments']
      labels: ['Hospital Charge','State Avg. Charge','National Avg. Charge', 'Hospital Payment', 'State Avg. Payment', 'National Avg. Payment']
      preUnits: '$'

  $("a[data-toggle=\"tab\"]").on "shown", (e) ->
    if $(e.target).attr("href") is "#provider_outpatient_procedures_graphs"
      bar1.redraw()
      bar2.redraw()
  