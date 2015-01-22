StudyBlocks.Views.DeckShow = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck",
  template: JST["decks/show"],
  events: {
    "click .new": "newCard",
    "click .delete": "deleteDeck",
    "click .import": "importCards"
  },
  subModelViewName: "CardShow",
  renderThis: {
    deck: 'model'
  },
  selector: '.cards',
  options: { submit: true },
  postRenderCallback: 'adjust2',

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  adjust2: function () {
    this.$(this.selector).imagesLoaded(this.adjust.bind(this));
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

  importCards: function (event) {
    event.preventDefault();
    var importView = new StudyBlocks.Views.ImportForm({ model: this.model });
    $(".modal").html(importView.render().$el).addClass("form");
  },

  adjust: function (thing) {
    this.$(this.selector).masonry({
      stamp: ".info",
      itemSelector: ".card-show",
      containerStyle: null,
      "gutter": 0
    });
  }
});
