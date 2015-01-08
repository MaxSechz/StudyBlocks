StudyBlocks.Views.DeckForm = Backbone.View.extend({
  tagName: "form",
  className: "deck-form",
  template: JST["decks/form"],
  events: {
    "submit": "submit"
  },
  
  initialize: function () {
    this.courses = new StudyBlocks.Collections.Courses();
    this.courses.fetch();
    this.listenTo(this.courses, "sync", this.render)
  },
  render: function () {
    var content = this.template({ deck: this.model, courses: this.courses });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault()
    var formView = this;
    var data = this.$el.serializeJSON()
    this.model.set(data);
    this.model.save({}, {
      success: function (model, response) {
        Backbone.history.navigate("decks/" + model.id, {trigger: true})
      },
      error: function (model, response) {
        jQuery.extend(formView.model.errors(), response.responseJSON)
        formView.render()
      }
    });
  }
});
