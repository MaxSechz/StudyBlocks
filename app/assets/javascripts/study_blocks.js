window.StudyBlocks = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new StudyBlocks.Models.User();
    this.navbar = new StudyBlocks.Views.NavBar();
    var navbar = this.navbar
    this.currentUser.fetch({
      complete: function (model) {
        navbar.model = this.currentUser;
        $("body").prepend(navbar.render().$el);
        Backbone.history.start();
      }.bind(this),
    });
    this.modal = new StudyBlocks.Views.Modal({ el: $(".modal")[0] })
    var decks = new StudyBlocks.Collections.Decks();
    var router = new StudyBlocks.Routers.Router({
      $rootEl: $("main.content"),
      decks: decks
    });
  }
};

$(document).ready(function(){
  StudyBlocks.initialize();
});
