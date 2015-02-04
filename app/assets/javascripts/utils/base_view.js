Backbone.View = Backbone.View.extend({
  renderThis: {
    model: ''
  },
  preRender: '',
  postRender: '',
  onDom: '',

  render: function () {
    this.preTasks();
    var content = this.template(this.renderObject());
    this.$el.html(content);
    this.postTasks();
    return this;
  },

  postTasks: function () {
    if (typeof this.postRender === "object") {
      _.each(this.postRender, function (callback) {
        this[callback]();
      }.bind(this));
    } else if (this.postRender) {
      this[this.postRender]();
    }
  },

  preTasks: function () {
    if (typeof this.preRender === "object") {
      _.each(this.preRender, function (callback) {
        this[callback]();
      }.bind(this));
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

  displayErrors: function (errors) {
    for (var input in errors) {
      var $input = $("#" + input);
      var $error = $input.next(".error");

      if ($error.length === 0 ) {
        $error = $("<span>").addClass("error");
        $error.text(errors[input]);
        $input.after($error);
      } else {
        $error.text(errors[input]);
      }
    }
  },
});
