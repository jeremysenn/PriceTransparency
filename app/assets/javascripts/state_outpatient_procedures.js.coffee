# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  if $('#state_outpatient_procedure_submitted_charges_graph').length
    Morris.Bar
      element: "state_outpatient_procedure_submitted_charges_graph"
      data: $('#state_outpatient_procedure_submitted_charges_graph').data('procedures')
      xkey: 'provider_name'
      ykeys: ['charges']
      labels: ['Average Charge']
      preUnits: '$'

  if $('#state_outpatient_procedure_total_payments_graph').length
    Morris.Bar
      element: "state_outpatient_procedure_total_payments_graph"
      data: $('#state_outpatient_procedure_total_payments_graph').data('procedures')
      xkey: 'provider_name'
      ykeys: ['payments']
      labels: ['Average Payment Received']
      preUnits: '$'

  if $('#state_outpatient_procedure_submitted_charges_and_total_payments_graph').length
    Morris.Bar
      element: "state_outpatient_procedure_submitted_charges_and_total_payments_graph"
      data: $('#state_outpatient_procedure_submitted_charges_and_total_payments_graph').data('procedures')
      xkey: 'provider_name'
      ykeys: ['charges', 'payments']
      labels: ['Average Charge', 'Average Payment Received']
      preUnits: '$'