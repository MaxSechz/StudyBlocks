StudyBlocks.Models.Response = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck.url() + "/responses";
  },

  initialize: function (models, options) {
    this.test = options.test;
  },

  parse: function (response, options) {
    thisTest = this.test;
    response.forEach(function (obj) {
      obj.test = thisTest;
    });
    return response;
  },
});
