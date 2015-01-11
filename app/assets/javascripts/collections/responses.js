StudyBlocks.Collections.Responses = Backbone.Collection.extend({
  model: StudyBlocks.Models.Response,
  url: function () {
    return this.test.url() + "/responses";
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
