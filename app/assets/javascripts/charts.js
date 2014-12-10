var renderChart = function(div_id, chart_data){
  zingchart.render({
    id: div_id,
    height: "1080px",
    width: "1080px",
    data: chart_data
  });
}

var drawChart = function(type, title, data, div_id){
  series= []
  $.each(data, function(index, data){series.push({values: data})})
  chart = {
    type   : type,
    title  : {"text": title},
    series : series,
    "scale-x": {zooming: true, short: true},
    "scroll-x":{},
    "scale-y": {zooming: true, short: true},
    "scroll-y": {},
    preview: {} //depend on data size 
  }
  renderChart(div_id, chart)
};

var request_search = function(){
  $.ajax({type:'POST', url:'/search', data: {search_term: this.search.search_term.value}, success: function(data){
    //drawChart("line", "sampleChart", data, "sampleChart")
    drawGraphSet(data)
  }})
}

var drawGraphSet = function(data){
  console.log(data)
  graphset = []
  $.each(data, function(index, data){
    graphset.push({
        title: {text: data[0], "font-size":"10px",},
        "type":"line",
        "scale-x": {values: data[1]},
        "series":[{"values": data[2]}]
    })
  })
  renderChart("sampleChart", {graphset: graphset})
}