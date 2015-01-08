window.StudyBlocks = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    var decks = new StudyBlocks.Collections.Decks();
    var router = new StudyBlocks.Routers.Router({
      $rootEl: $("main.content"),
      decks: decks
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  StudyBlocks.initialize();
});
