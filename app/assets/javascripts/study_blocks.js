window.StudyBlocks = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    this.header = new StudyBlocks.Views.Navbar({ el: ".navbar" });
    this.header.render();
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
