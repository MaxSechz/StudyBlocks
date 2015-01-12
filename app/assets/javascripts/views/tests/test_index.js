StudyBlocks.Views.TestIndex = Backbone.View.extend({
  tagName: 'main',
  className: 'performance',
  template: JST['tests/index'],

  initialize: function () {
    this.matrix = [['Test', 'Performance']];
    this.listenTo(this.collection, "sync", this.prep);
  },

  prep: function () {
    var thisMatrix = this.matrix;
    this.collection.each(function (test) {
      thisMatrix.push([test.id, test.score]);
    });
    this.render();
  },

  render: function () {
    var content = this.template({ tests: this.collection });
    this.$el.html(content);
    this.draw();
    return this;
  },

  draw: function () {
    var data = google.visualization.arrayToDataTable(this.matrix);
    if (data.Nf.length > 0) {
      var options = {
        title: 'Performance',
        vAxis: { gridlines: {}},
        legend: { position: 'bottom' },
        height: 700
      };
      options.vAxis.maxValue = 100;
      options.vAxis.gridlines.count = -1;
      options.vAxis.baseline = 0;
      var chart = new google.visualization.LineChart(this.$("#performance-chart")[0]);
      chart.draw(data, options);
    }
    console.log(data);
  }
});
