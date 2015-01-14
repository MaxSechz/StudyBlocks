StudyBlocks.Views.TestIndex = Backbone.View.extend({
  tagName: 'main',
  className: 'performance',
  template: JST['tests/index'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.prep);
  },

  prep: function () {
    var thisView = this;
    this.data = new google.visualization.DataTable();
    this.data.addColumn('date', 'Date');
    this.data.addColumn('number', 'Score');
    this.data.addColumn({type: 'string', role: 'tooltip', p: { html: true }});
    this.collection.each(function (test) {
      var date = new Date(test.get('created_at'));
      var htmlString = $("<a>").attr('href', thisView.model.linkUrl('tests/' + test.id)).text(date.toDateString());
      thisView.data.addRow([date, test.score, htmlString.prop('outerHTML')]);
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
    if (this.data) {
      this.chart = new google.visualization.LineChart(this.$("#performance-chart")[0]);
      var options = {
        title: 'Performance',
        vAxis: { gridlines: {}},
        legend: { position: 'none' },
        pointSize: 10,
        tooltip: {isHtml: true},
        height: 700
      };
      options.vAxis.maxValue = 100;
      options.vAxis.gridlines.count = -1;
      options.vAxis.baseline = 0;
      // this.chart.setAction({
      //   id: 'testAction',
      //   text: 'test text',
      //   action: function () {
      //     this.getTest();
      //   }.bind(this)
      // });
      google.visualization.events.addListener(this.chart, 'select', this.getTest.bind(this));
      this.chart.draw(this.data, options);
    }
  }
});
