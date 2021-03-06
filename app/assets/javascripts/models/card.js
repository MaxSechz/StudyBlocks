StudyBlocks.Models.Card = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck.url() + "/cards";
  },

  initialize: function (attrs, options) {
    if (options.deck) {
      this.deck = options.deck
    } else if (this.collection) {
      this.deck = this.collection.deck;
    }
  },

  toJSON: function () {
    var attrs = _.clone(this.attributes);
    attrs.back = _.escape(attrs.back);
    attrs.image = this.image;
    return attrs;
  },

  set: function (attrs) {
    Backbone.Model.prototype.set.call(this, attrs);
    if (this.get('format') === "field" && typeof this.get('back') !== "object") {
      this.set('back', JSON.parse(this.get('back')));
    }
    return this;
  },

  parse: function (response, options) {
    if (response.deck) {
      this.deck = response.deck;
      delete response.deck;
    }
    if (response.image === "/images/original/missing.png") {
      delete response.image;
    }
    try {
      response.back = JSON.parse(response.back);
    } catch(error) {}

    return response;
  }
});
