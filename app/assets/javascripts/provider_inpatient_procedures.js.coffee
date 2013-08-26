# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  if $('#provider_inpatient_procedure_covered_charges_graph').length
    bar1 = Morris.Bar
      element: "provider_inpatient_procedure_covered_charges_graph"
      data: $('#provider_inpatient_procedure_covered_charges_graph').data('procedure')
      xkey: 'procedure_name'
      ykeys: ['charges', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      preUnits: '$'
      hideHover: 'auto'

  if $('#provider_inpatient_procedure_total_payments_graph').length
    bar2 = Morris.Bar
      element: "provider_inpatient_procedure_total_payments_graph"
      data: $('#provider_inpatient_procedure_total_payments_graph').data('procedure')
      xkey: 'procedure_name'
      ykeys: ['payments', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      preUnits: '$'
      hideHover: 'auto'