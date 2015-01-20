StudyBlocks.Views.UserNew = Backbone.CollectionView.extend({
  tagName: "div",
  className: "new-user",
  template: JST["users/new"],
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
        console.log(model);
        thisView.remove();
        $(".modal").removeClass("form");
        StudyBlocks.navbar.render()
        Backbone.history.history.back();
      },
      error: function (response) {
        console.log(response);
      }
    });
  }

});
