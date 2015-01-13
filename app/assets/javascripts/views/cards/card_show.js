StudyBlocks.Views.CardShow = Backbone.CompositeView.extend({
  tagName: "li",
  className: "card",
  template: JST["cards/show"],
  events: {
    "click .delete-card": "destroyCard",
    "click .edit-card": "editCard"
  },

  initialize: function (options) {
    this.submit = options.submit;
    this.listenTo(this.model, "change", this.render);
  },

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    return this;
  },

  destroyCard: function (event) {
    event.preventDefault();
    this.model.destroy();
    this.remove();
  },

  editCard: function (event) {
    event.preventDefault();
    var formView = new StudyBlocks.Views.CardForm({
      model: this.model,
      submit: this.submit
    });
    this.addSubview('.card-attrs', formView);
  }
});
