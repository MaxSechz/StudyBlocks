StudyBlocks.Collections.Decks = Backbone.Collection.extend({
  url: "api/decks",
  model: StudyBlocks.Models.Deck,

  getOrFetch: function (id) {
    var currentCollection = this;
    var targetModel = this.get(id);
    if (!targetModel) {
      targetModel = new StudyBlocks.Models.Deck({ id: id });
      targetModel.fetch({
        success: function () {
          currentCollection.add(targetModel);
        }
      });
    } else {
      targetModel.fetch();
    }

    return targetModel;
  }
});
