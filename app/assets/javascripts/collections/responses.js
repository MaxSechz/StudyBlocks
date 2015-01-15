StudyBlocks.Collections.Responses = Backbone.Collection.extend({
  model: StudyBlocks.Models.Response,
  url: function () {
    return this.test.url() + "/responses";
  },

  initialize: function (models, options) {
    this.test = options.test;
    this.deck = options.deck;
  },

  parse: function (response, options) {
    thisTest = this.test;
    thisDeck = this.deck;
    response.forEach(function (obj) {
      obj.test = thisTest;
      obj.deck = thisDeck;
    });
    return response;
  },
});
