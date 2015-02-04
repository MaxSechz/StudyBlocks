StudyBlocks.Views.UserNew = Backbone.View.extend({
  tagName: "form",
  className: "new-user",
  template: JST["users/new"],
  events: {
    "submit": "submit",
  },

  submit: function (event) {
    event.preventDefault();
    var data = $(event.target).serializeJSON();
    var thisView = this;
    this.model.save(data, {
      success: function (model) {
        var schools = new StudyBlocks.Collections.Schools();
        var schoolView = new StudyBlocks.Views.SchoolNew({
          collection: schools,
          model: model
        });
        StudyBlocks.modal.set(schoolView, "form");
      },
      error: function (model, response) {
        thisView.displayErrors(response.responseJSON);
      }
    });
   }

});
