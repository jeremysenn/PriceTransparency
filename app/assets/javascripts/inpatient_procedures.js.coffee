# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  if $('#national_inpatient_procedure_submitted_charges_graph').length
    graph1 = Morris.Bar
      element: "national_inpatient_procedure_submitted_charges_graph"
      data: $('#national_inpatient_procedure_submitted_charges_graph').data('procedures')
      xkey: 'provider_name'
      ykeys: ['charges']
      labels: ['Avg. Covered Charge']
      preUnits: '$'
      #hideHover: 'auto'
      axes: false

  #update_national_inpatient_procedure_submitted_charges_graph = ->
  #  alert "hey there"
  #  graph1.setData $("#national_inpatient_procedure_submitted_charges_graph").data("procedures")

  if $('#national_inpatient_procedure_total_payments_graph').length
    Morris.Bar
      element: "national_inpatient_procedure_total_payments_graph"
      data: $('#national_inpatient_procedure_total_payments_graph').data('procedures')
      xkey: 'provider_name'
      ykeys: ['payments']
      labels: ['Avg. Payment Received']
      preUnits: '$'
      #hideHover: 'auto'
      axes: false

  if $('#national_state_inpatient_procedure_submitted_charges_graph').length
    Morris.Bar
      element: "national_state_inpatient_procedure_submitted_charges_graph"
      data: $('#national_state_inpatient_procedure_submitted_charges_graph').data('procedures')
      xkey: 'state'
      ykeys: ['charges']
      labels: ['Avg. Covered Charge']
      preUnits: '$'
      #hideHover: 'auto'
      axes: false

  if $('#national_state_inpatient_procedure_total_payments_graph').length
    Morris.Bar
      element: "national_state_inpatient_procedure_total_payments_graph"
      data: $('#national_state_inpatient_procedure_total_payments_graph').data('procedures')
      xkey: 'state'
      ykeys: ['payments']
      labels: ['Avg. Payment Received']
      preUnits: '$'
      #hideHover: 'auto'
      axes: false

  if $('#national_provider_inpatient_procedure_services_graph').length
    Morris.Bar
      element: "national_provider_inpatient_procedure_services_graph"
      data: $('#national_provider_inpatient_procedure_services_graph').data('procedures')
      xkey: 'provider'
      ykeys: ['services']
      labels: ['Total Discharges']
      #hideHover: 'auto'
      axes: false

  if $('#national_state_inpatient_procedure_services_graph').length
    Morris.Bar
      element: "national_state_inpatient_procedure_services_graph"
      data: $('#national_state_inpatient_procedure_services_graph').data('procedures')
      xkey: 'state'
      ykeys: ['services']
      labels: ['Total Discharges']
      #hideHover: 'auto'
      axes: false

  ### FOR SHOWING LOADING SPINNER WHILE PAGE LOADS ###
  $(window).load ->
    $("#cover").fadeOut 100