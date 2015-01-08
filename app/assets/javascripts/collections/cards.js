StudyBlocks.Collections.Cards = Backbone.Collection.extend({
  url: "api/cards",
  model: StudyBlocks.Models.Card,

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
})
