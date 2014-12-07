var renderChart = function(div_id, chart_data){
  zingchart.render({
    id: div_id,
    height: 450,
    width: 600,
    data: chart_data
  });
}

var drawChart = function(type, title, data, div_id){
  chart = {
    type   : type,
    title  : {"text": title},
    series : [{values: data}],
    "scale-x": {zooming: true},
    "scroll-x":{},
    "scale-y": {zooming: true},
    "scroll-y": {},
    preview: {} //depend on data size 
  }
  renderChart(div_id, chart)
};

var request_search = function(){
  $.ajax({type:'POST', url:'/search', data: {search_term: this.search.search_term.value}, success: function(data){drawChart("line", "sampleChart", data, "sampleChart")}})
}
