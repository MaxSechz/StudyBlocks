StudyBlocks.Views.SchoolNew = Backbone.CollectionView.extend({
  tagName: "div",
  className: "new-school",
  template: JST["schools/new"],
  events: {
    "keyup .search": "searchSchools",
    "focusout .search": "openSelect",
    "submit": "submit",
  },
  selector: ".school-list",
  subModelViewName: "SchoolOption",

  initialize: function () {
    this.listenTo(this.collection, "sync", this.renderCollection);
  },

  openSelect: function (event) {
    event.preventDefault();
    this.$($("option")[0]).prop('selected', true);
    this.$("select").click();
  },

  searchSchools: function (event) {
    event.preventDefault();
    var thisView = this;
    this.collection.fetch({
      data: {query: this.$(".search").val()},
      success: function (collection) {
        thisView.renderCollection();
      }
    });
  },

  submit: function (event) {
    event.preventDefault();
    var data = $(event.target).serializeJSON();
    var thisView = this;
    this.model.save(data, {
      success: function (model) {
        StudyBlocks.currentUser = model;
        StudyBlocks.navbar.render();
        StudyBlocks.modal.clear();
        Backbone.history.navigate('decks', { trigger: true });
      },
    });
  }

});
