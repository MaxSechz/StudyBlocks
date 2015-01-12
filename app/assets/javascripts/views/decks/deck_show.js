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

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.cards(), "add", this.renderCollection);
  },

  newCard: function (event) {
    event.preventDefault();
    var emptyCard = new StudyBlocks.Models.Card({}, { deck: this.model });
    var formView = new StudyBlocks.Views.CardForm({
      model: emptyCard,
      submit: true
    });
    this.addSubview('.cards', formView);
  },

  deleteDeck: function (event) {
    event.preventDefault();
    this.model.destroy({
      success: function () {
        Backbone.history.navigate('', { trigger :true } );
      }
    });
  }
});
