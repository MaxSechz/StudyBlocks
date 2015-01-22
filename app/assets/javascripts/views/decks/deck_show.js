StudyBlocks.Views.DeckShow = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck",
  template: JST["decks/show"],
  events: {
    "click .new": "newCard",
    "click .delete": "deleteDeck",
  },
  subModelViewName: "CardShow",
  renderThis: {
    deck: 'model'
  },
  selector: '.cards',
  options: { submit: true },
  postRenderCallback: 'adjust',

  initialize: function () {
    // this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "sync", this.render);
    // this.$el.imagesLoaded(this.adjust.bind(this));
  },

  newCard: function (event) {
    event.preventDefault();
    var emptyCard = new StudyBlocks.Models.Card({}, { deck: this.model });
    var formView = new StudyBlocks.Views.CardForm({
      model: emptyCard,
      submit: true
    });
    $(".modal").html(formView.render().$el).addClass("form");
  },

  deleteDeck: function (event) {
    event.preventDefault();
    this.model.destroy({
      success: function () {
        Backbone.history.navigate('', { trigger: true } );
      }
    });
  },

  adjust: function () {
    this.$(this.selector).masonry({ "gutter": 40 });
  }
});
