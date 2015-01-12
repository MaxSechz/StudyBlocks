StudyBlocks.Views.CardForm = Backbone.View.extend({
  tagName: "form",
  className: "card-form",
  template: JST["cards/form"],
  events: {
    "submit": "addCard",
    "click .new-field": "addField",
    "click input[type='radio']": "changeCardType"
  },
  subTemplates: {
    response: JST["cards/text_form"],
    choice: JST["cards/text_form"],
    boolean: JST["cards/boolean_form"],
    field: JST["cards/field_form"]
  },

  initialize: function (options) {
    this.submit = options.submit;
    this.selected = this.model.escape('format');
  },

  render: function () {
    var content = this.template({
      card: this.model,
      template: this.subTemplates[this.selected]
    });
    this.$el.html(content);
    this.setSelected();
    return this;
  },

  setSelected: function () {
    if (this.selected) {
      var jQuerySearch = "input[value=" + this.selected + "]";
      this.$el.find(jQuerySearch).prop({ checked: true });
    }
  },

  addField: function (event) {
    event.preventDefault();
    var $field = $("<input>").prop("type", "text").prop("name", "field");
    var $value = $("<input>").prop("type", "text").prop("name", "definition");
    var $fullField = $("<div class='field'>").append([$field, $value]);
    this.$el.find("div.back").append($fullField);
  },

  addCard: function (event) {
    event.preventDefault();
    this.$el.find(".field").each(function () {
      var $field = $(this).find("input[name='field']");
      var $definition = $(this).find("input[name='definition']");
      $field.attr('name', "back[" + $field.val() + "][field]");
      $definition.attr('name', "back[" + $field.val() + "][definition]");
    });
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
