StudyBlocks.Views.CardShow = Backbone.CompositeView.extend({
  tagName: "li",
  className: "card",
  template: JST["cards/show"],
  events: {
    "click .delete": "destroyCard",
    "click .edit": "editCard"
  },

  initialize: function () {
    this.listenTo(this.model, "sync change", this.render);
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
      submit: true
    });
    this.addSubview('.card-attrs', formView);
  }
});
