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
      hideHover: 'auto'

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
      hideHover: 'auto'

  if $('#national_state_inpatient_procedure_submitted_charges_graph').length
    Morris.Bar
      element: "national_state_inpatient_procedure_submitted_charges_graph"
      data: $('#national_state_inpatient_procedure_submitted_charges_graph').data('procedures')
      xkey: 'state'
      ykeys: ['charges']
      labels: ['Avg. Covered Charge']
      preUnits: '$'
      hideHover: 'auto'

  if $('#national_state_inpatient_procedure_total_payments_graph').length
    Morris.Bar
      element: "national_state_inpatient_procedure_total_payments_graph"
      data: $('#national_state_inpatient_procedure_total_payments_graph').data('procedures')
      xkey: 'state'
      ykeys: ['payments']
      labels: ['Avg. Payment Received']
      preUnits: '$'
      hideHover: 'auto'

  if $('#national_provider_inpatient_procedure_services_graph').length
    Morris.Bar
      element: "national_provider_inpatient_procedure_services_graph"
      data: $('#national_provider_inpatient_procedure_services_graph').data('procedures')
      xkey: 'provider'
      ykeys: ['services']
      labels: ['Total Discharges']
      hideHover: 'auto'

  if $('#national_state_inpatient_procedure_services_graph').length
    Morris.Bar
      element: "national_state_inpatient_procedure_services_graph"
      data: $('#national_state_inpatient_procedure_services_graph').data('procedures')
      xkey: 'state'
      ykeys: ['services']
      labels: ['Total Discharges']
      hideHover: 'auto'

  ### KEEP CURRENT TAB ACTIVE AFTER PAGE RELOAD ###
  $("a[data-toggle=\"tab\"]").on "shown", (e) ->
    #save the latest tab using a cookie:
    $.cookie "last_tab", $(e.target).attr("href")

  #activate latest tab, if it exists:
  lastTab = $.cookie("last_tab")
  if lastTab
    $("ul.nav-tabs").children().removeClass "active"
    $("a[href=" + lastTab + "]").parents("li:first").addClass "active"
    $("div.tab-content").children().removeClass "active"
    $(lastTab).addClass "active"