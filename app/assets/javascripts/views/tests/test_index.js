StudyBlocks.Views.TestIndex = Backbone.View.extend({
  tagName: 'main',
  className: 'performance notready',
  template: JST['tests/index'],
  toolTemplate: JST['tests/tooltip'],
  renderThis: {
    tests: "collection"
  },
  preRender: "prep",
  postRender: "draw",

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  prep: function () {
    var thisView = this;
    this.data = new google.visualization.DataTable();
    this.data.addColumn('datetime', 'Date');
    this.data.addColumn('number', 'Score');
    this.data.addColumn({type: 'string', role: 'tooltip', p: { html: true }});
    this.collection.each(function (test) {
      var date = new Date(test.get('created_at'));
      var htmlString = thisView.toolTemplate({
        date: date,
        test: test,
        deck: thisView.model
      });
      thisView.data.addRow([date, test.score, htmlString]);
    });
  },

  draw: function () {
    if (this.data) {
      this.chart = new google.visualization.LineChart(this.$("#performance-chart")[0]);
      this.options = {
        title: 'Performance',
        vAxis: { gridlines: {}},
        hAxis: { gridlines: {}},
        legend: { position: 'none' },
        pointSize: 15,
        tooltip: {isHtml: true, trigger: 'hover'},
        height: 700
      };
      this.options.vAxis.maxValue = 100;
      this.options.vAxis.gridlines.count = -1;
      this.options.vAxis.gridlines.color = '#fff';
      this.options.vAxis.title = 'Score (%)';
      this.options.vAxis.gridlines.count = -1;
      this.options.vAxis.baseline = 0;
      this.options.hAxis.title = 'Date';
      this.options.hAxis.gridlines.count = 5;
      this.options.hAxis.gridlines.color = '#fff';
      this.chart.draw(this.data, this.options);
    }
  }
});
