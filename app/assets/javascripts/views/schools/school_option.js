StudyBlocks.Views.SchoolOption = Backbone.View.extend({
  tagName: "option",
  className: "school",
  template: JST["schools/option"],
  attributes: {
      value: {}
  },
  renderThis: {
      school: "model"
  },

  initialize: function () {
    this.attributes.value = this.model.id;
  }
});
