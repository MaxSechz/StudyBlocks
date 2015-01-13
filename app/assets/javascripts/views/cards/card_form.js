StudyBlocks.Views.CardForm = Backbone.View.extend({
  tagName: "form",
  className: "card-form",
  template: JST["cards/form"],
  events: {
    "submit": "addCard",
    "click .new-field": "addField",
    "click .format": "changeCardType",
    "change #input-image": "fileInputChange"
  },
  subTemplates: {
    response: JST["cards/text_form"],
    choice: JST["cards/text_form"],
    boolean: JST["cards/boolean_form"],
    field: JST["cards/field_form"]
  },

  initialize: function (options) {
    this.submit = options.submit;
    if (this.model.escape('format')) {
      this.selected = this.model.escape('format');
    } else {
      this.selected = 'response';
    }
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
      $field.attr('name', "back[" + $field.val() + "]");
      $definition.attr('name', "back[" + $field.val() + "]");
    });
    var attrs = this.$el.serializeJSON();
    if (typeof attrs.back === "object") {
      attrs.back = JSON.stringify(attrs.back);
    }
    var thisForm = this;
    var thisDeck = this.model.deck;
    this.model.set(attrs);
    if (this.submit) {
      this.model.save({}, {
        success: function (model, response) {
          model.deck = thisDeck;
          thisDeck.cards().add(model, {merge: true});
        },
        error: function (model, response) {
          console.log(model);
          console.log(response);
        }
      });
    } else {
      thisForm.remove();
      thisDeck.cards().add(this.model, {merge: true});
    }
  },

  changeCardType: function (event) {
    this.selected = $(event.currentTarget).val();
    var content = this.subTemplates[this.selected]({
      card: this.model
    });
    this.$el.find("div.back").html(content);
  },

  fileInputChange: function(event){

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._updatePreview(reader.result);
      that.model.set('image', reader.result);

      console.log(that.model);
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      this._updatePreview("");
      delete this.model.unset('image');

      console.log(this.model);
    }
  },

  _updatePreview: function(src){
    this.$el.find("#preview-image").attr("src", src);
  }
});
