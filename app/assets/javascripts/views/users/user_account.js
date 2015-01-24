StudyBlocks.Views.UserAccount = Backbone.CollectionView.extend({
  tagName: "form",
  className: "profile",
  template: JST["users/account"],
  events: {
    "click .password-reset": "openPasswords",
    "click .cancel": "removeForm",
    "keyup .search": "searchSchools",
    "focusout .search": "openSelect",
    "click .submit": "update"
  },
  selector: ".school-list",
  subModelViewName: "SchoolOption",
  renderThis: {
    user: "model"
  },

  initialize: function () {
    console.log(this.model)
    this.render();
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

  update: function (event) {
    event.preventDefault();
    var data = this.$el.serializeJSON();
    var thisView = this;
    this.model.save(data, {
      success: function (model) {
        StudyBlocks.currentUser = model;
        thisView.removeForm();
      },
      error: function (response) {
        console.log(response);
      }
    });
  },

  openPasswords: function (event) {
      event.preventDefault();
      this.$(".password-fields").toggleClass("open");
  },

  removeForm: function (event) {
    event && event.preventDefault();
    this.remove();
    $(".modal").removeClass("form");
  }
});
