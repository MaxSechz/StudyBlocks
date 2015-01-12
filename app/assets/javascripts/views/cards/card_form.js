StudyBlocks.Views.CardForm = Backbone.View.extend({
  tagName: "form",
  className: "card-form",
  template: JST["cards/form"],
  events: {
    "submit": "addCard",
    "click input[type='radio']": "changeCardType"
  },
  subTemplates: {
    response: JST["cards/text_form"],
    choice: JST["cards/text_form"],
    boolean: JST["cards/boolean_form"],
    field: JST["cards/field_form"]
  },

  initialize: function (options) {
    console.log(this.model)
    this.submit = options.submit;
    this.selected = this.model.escape('format');
  },

  render: function () {
    console.log(this.model)
    // this.setSelected();
    var content = this.template({
      card: this.model,
      template: this.subTemplates[this.selected]
    });
    this.$el.html(content);
    return this;
  },

  setSelected: function () {
    // if (this.model.get('format')) {
    //   var jQuerySearch = "input[value=" + this.model.escape('format') + "]";
    //   this.$el.find(jQuerySearch).prop({ checked: true });
    // }
  },

  addCard: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var thisForm = this;
    var thisDeck = this.model.deck;
    this.model.set(attrs);
    if (this.submit) {
      this.model.save({}, {
        success: function (model, response) {
          model.deck = thisDeck;
          thisDeck.cards().add(model, {merge: true});
        }
      });
    } else {
      thisForm.remove();
      thisDeck.cards().add(this.model, {merge: true});
    }
  },

  changeCardType: function (event) {
    this.selected = $(event.currentTarget).val();
    this.render();
  }
});
