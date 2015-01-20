StudyBlocks.Views.SchoolOption = Backbone.View.extend({
  tagName: "option",
  className: "school",
  template: JST["schools/option"],
  attributes: {
      value: {}
  },

  initialize: function () {
    this.attributes.value = this.model.id;
  },

  render: function () {
    var content = this.template({ school: this.model });
    this.$el.html(content);
    return this;
  }
});
