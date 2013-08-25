# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  ### OUTPATIENT ###

  if $('#provider_outpatient_services_graph').length
    Morris.Donut
      element: "provider_outpatient_services_graph"
      data: $('#provider_outpatient_services_graph').data('procedures')

  if $('#provider_outpatient_charges_donut_graph').length
    Morris.Donut
      element: "provider_outpatient_charges_donut_graph"
      data: $('#provider_outpatient_charges_donut_graph').data('procedures')
      formatter: (y, data) ->
        "$" + y

  if $('#provider_outpatient_procedure_graph').length
    Morris.Bar
      element: "provider_outpatient_procedure_graph"
      data: $('#provider_outpatient_procedure_graph').data('procedures')
      xkey: 'procedure_name'
      ykeys: ['charges', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      xLabelAngle: 40
      xLabelMargin: 2
      preUnits: '$'
      gridTextSize: 10

  if $('#provider_outpatient_procedure_payment_graph').length
    Morris.Bar
      element: "provider_outpatient_procedure_payment_graph"
      data: $('#provider_outpatient_procedure_payment_graph').data('procedures')
      xkey: 'procedure_name'
      ykeys: ['payments', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      xLabelAngle: 60
      preUnits: '$'
      gridTextSize: 10

  ### INPATIENT ###

  if $('#provider_inpatient_services_graph').length
    Morris.Donut
      element: "provider_inpatient_services_graph"
      data: $('#provider_inpatient_services_graph').data('procedures')

  if $('#provider_inpatient_charges_donut_graph').length
    Morris.Donut
      element: "provider_inpatient_charges_donut_graph"
      data: $('#provider_inpatient_charges_donut_graph').data('procedures')
      formatter: (y, data) ->
        "$" + y

  if $('#provider_inpatient_procedure_graph').length
    Morris.Bar
      element: "provider_inpatient_procedure_graph"
      data: $('#provider_inpatient_procedure_graph').data('procedures')
      xkey: 'procedure_name'
      ykeys: ['charges', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      #xLabelAngle: 40
      #xLabelMargin: 2
      preUnits: '$'
      gridTextSize: 10

  if $('#provider_inpatient_procedure_payment_graph').length
    Morris.Bar
      element: "provider_inpatient_procedure_payment_graph"
      data: $('#provider_inpatient_procedure_payment_graph').data('procedures')
      xkey: 'procedure_name'
      ykeys: ['payments', 'state_average', 'national_average']
      labels: ['Hospital','State','Nation']
      #xLabelAngle: 60
      preUnits: '$'
      gridTextSize: 10
      