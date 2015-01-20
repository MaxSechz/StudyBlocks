StudyBlocks.Views.UserLogin = Backbone.View.extend({
  tagName: "form",
  className: "login",
  template: JST["users/login"],
  events: {
    "click .login": "login"
  },

  render: function () {
      var content = this.template();
      this.$el.html(content);
      return this;
  },

  login: function (event) {
    event.preventDefault();
    var data = { user: this.$el.serializeJSON() };
    var thisView = this;
    $.ajax({
      url: "/api/session",
      type: "POST",
      data: data,
      success: function (response) {
        StudyBlocks.currentUser.set(response)
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
