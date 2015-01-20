window.StudyBlocks = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    this.currentUser = new StudyBlocks.Models.User();
    this.navbar = new StudyBlocks.Views.NavBar();
    var navbar = this.navbar
    this.currentUser.fetch({
      success: function () {
        $("body").prepend(navbar.render().$el);
      },
      error: function () {
        $("body").prepend(navbar.render().$el);
      }
    });
    var decks = new StudyBlocks.Collections.Decks();
    var router = new StudyBlocks.Routers.Router({
      $rootEl: $("main.content"),
      $modalEl: $("div.modal"),
      decks: decks
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  StudyBlocks.initialize();
});
