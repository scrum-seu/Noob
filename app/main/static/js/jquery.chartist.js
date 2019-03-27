/*
Template Name: Greeva - Responsive Bootstrap 4 Admin Dashboard
Author: CoderThemes
File: Chartist Chart
*/
  $(document).ready(function() {
        $.ajax({
        type: 'POST',
        url: '/init',
        contentType: 'application/json',
        success: function(data){
            //Distributed series

            new Chartist.Bar('#distributed-series', {
              labels: ['2014', '2015', '2016', '2017', '2018'],
              series: [189656, 201548, 225698, 165489, 265541]
            }, {
                distributeSeries: true,
                plugins: [
                  Chartist.plugins.tooltip()
                ],
                axisY: {
                  labelInterpolationFnc: function (value) {
                    return (value / 1000) + 'k';
                  }
                }
              });
            var arr=data.split(",");
            //Stacked bar chart
            new Chartist.Bar('#stacked-bar-chart', {
              labels: ['Q1', 'Q2', 'Q3', 'Q4'],
              series: [
                [parseInt(arr[0]), parseInt(arr[3]), parseInt(arr[6]), parseInt(arr[9])],
                [parseInt(arr[1]), parseInt(arr[4]), parseInt(arr[7]), parseInt(arr[10])],
                [parseInt(arr[2]), parseInt(arr[5]), parseInt(arr[8]), parseInt(arr[11])]
              ]
            }, {
                stackBars: true,
                axisY: {
                  labelInterpolationFnc: function (value) {
                    return (value / 1000) + 'k';
                  }
                },
                plugins: [
                  Chartist.plugins.tooltip()
                ]
              }).on('draw', function (data) {
                if (data.type === 'bar') {
                  data.element.attr({
                    style: 'stroke-width: 30px'
                  });
                }
              });
            //end Stacked bar chart

            //Pie chart with custom labels
            var data = {
              labels: ['食品', '日用品', '服饰', '玩具', '保健品', '书籍'],
              series: [parseInt(arr[12]), parseInt(arr[13]), parseInt(arr[14]), parseInt(arr[15]),
              parseInt(arr[16]), parseInt(arr[17])]
            };
            var options = {
              labelInterpolationFnc: function (value) {
                        return value[0];
              }
            };
                var responsiveOptions = [
              ['screen and (min-width: 640px)', {
                chartPadding: 30,
                labelOffset: 100,
                labelDirection: 'explode',
                labelInterpolationFnc: function (value) {
                  return value;
                }
              }],
              ['screen and (min-width: 1024px)', {
                labelOffset: 80,
                chartPadding: 20
              }]
            ];
            new Chartist.Pie('#pie-chart', data, options, responsiveOptions
            );

            //Line chart with tooltips
            new Chartist.Line('#line-chart-tooltips', {
              labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
              series: [
                {
                  name: '2018年销售情况',
                  data: [parseInt(arr[0]), parseInt(arr[1]), parseInt(arr[2]), parseInt(arr[3]),
                        parseInt(arr[4]), parseInt(arr[5]), parseInt(arr[6]), parseInt(arr[7]),
                        parseInt(arr[8]), parseInt(arr[9]), parseInt(arr[10]), parseInt(arr[11])]
                },
              ]
            },
              {
                plugins: [
                  Chartist.plugins.tooltip()
                ]
              }
            );

            var $chart = $('#line-chart-tooltips');

            var $toolTip = $chart
              .append('<div class="tooltip"></div>')
              .find('.tooltip')
              .hide();

            $chart.on('mouseenter', '.ct-point', function () {
              var $point = $(this),
                value = $point.attr('ct:value'),
                seriesName = $point.parent().attr('ct:series-name');
              $toolTip.html(seriesName + '<br>' + value).show();
            });

            $chart.on('mouseleave', '.ct-point', function () {
              $toolTip.hide();
            });

            $chart.on('mousemove', function (event) {
              $toolTip.css({
                left: (event.offsetX || event.originalEvent.layerX) - $toolTip.width() / 2 - 10,
                top: (event.offsetY || event.originalEvent.layerY) - $toolTip.height() - 40
              });
            });
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
  } );
! function ($) {
  "use strict";
  var ChartistChart = function () {
  };
  ChartistChart.prototype.init = function () {
  },
    //init
    $.ChartistChart = new ChartistChart, $.ChartistChart.Constructor =
    ChartistChart
}(window.jQuery),

  //initializing
  function ($) {
    "use strict";
    $.ChartistChart.init()
  }(window.jQuery);

