StudyBlocks.Models.Response = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck.url() + "/responses";
  },

  initialize: function (models, options) {
    this.test = options.test;
  },

  parse: function (response) {
    if (response.result) {
      console.log(response.result)
    }
  }
});
