StudyBlocks.Collections.Decks = Backbone.Collection.extend({
  url: "api/decks",
  model: StudyBlocks.Models.Deck,

  getOrFetch: function (id) {
    var targetModel = this.get(id);
    if (!targetModel) {
      targetModel = new StudyBlocks.Collections.Deck({ id: id });
      targetModel.fetch({
        success: function () {
          this.add(targetModel);
        }
      });
    } else {
      targetModel.fetch()
    }

    return targetModel;
  }
});
