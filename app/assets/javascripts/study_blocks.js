window.StudyBlocks = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.$root = $("body");
    this.bumper = new StudyBlocks.Views.Modal().render().bumper();
    this.currentUser = new StudyBlocks.Models.User();
    this.navbar = new StudyBlocks.Views.NavBar({
      model: this.currentUser
    });
    var navbar = this.navbar;
    this.currentUser.fetch({
      complete: function (model) {
        navbar.model = this.currentUser;
        this.$root.prepend(navbar.render().$el);
        Backbone.history.start();
      }.bind(this),
    });
    this.modal = new StudyBlocks.Views.Modal();
    this.$root.append(this.modal.render().$el);
    var decks = new StudyBlocks.Collections.Decks();
    var router = new StudyBlocks.Routers.Router({
      $rootEl: $("main.content"),
      decks: decks
    });
  },
  bump: function () {
    this.$root.append(this.bumper.$el);
  },
  debump: function () {
    this.bumper.$el.remove();
  }
};

$(document).ready(function(){
  StudyBlocks.initialize();
});
