# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@renderSampleChart = ->
  zingchart.render
    id: "sampleChart"
    height: 450
    width: 600
    data: sampleChart
  return