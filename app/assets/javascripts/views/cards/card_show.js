StudyBlocks.Views.CardShow = Backbone.CompositeView.extend({
  tagName: "li",
  className: "card-show cube-wrap",
  template: JST["cards/show"],
  events: {
    "click .flip-right .delete-card": "destroyCard",
    "click .flip-right .edit-card": "editCard",
    "click .cube": "flip",
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
    $(".modal").html(formView.render().$el).addClass("form");
  },

  flip: function (event) {
    event.preventDefault();
    this.$(".cube").toggleClass("flip-right");
  }
});
