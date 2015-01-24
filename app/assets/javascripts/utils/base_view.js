Backbone.View = Backbone.View.extend({
  renderThis: {
    model: ''
  },
  preRender: '',
  postRender: '',
  onDom: '',

  render: function () {
    console.log(this)
    this.preTasks();
    var content = this.template(this.renderObject());
    this.$el.html(content);
    this.postTasks();
    return this;
  },

  postTasks: function () {

    if (typeof this.postRender === "Array") {
      _.each(this.postRender, function (callback) {
        this[callback]();
      });
    } else if (this.postRender) {
      this[this.postRender]();
    }
  },

  preTasks: function () {
    if (typeof this.preRender === "Array") {
      _.each(this.preRender, function (callback) {
        this[callback]();
      });
    } else if (this.preRender) {
      this[this.preRender]();
    }
  },

  renderObject: function (renderThis) {
    var renderObject = {};
    var renderThis = renderThis || this.renderThis
    for (var attr in renderThis) {
      var attrVal = renderThis[attr];
      if (typeof this[attrVal] === "function") {
        renderObject[attr] = this[attrVal]();
      } else {
        renderObject[attr] = this[attrVal];
      }
    }
    return renderObject;
  },

});
