StudyBlocks.Views.Modal = Backbone.CompositeView.extend({
  tagName: "div",
  className: "modal",
  template: JST["static/modal"],
  events: {
    "click": "erase",
    "click .cancel": "erase"
  },

  set: function (view, newClass) {
    this.clear();
    this.addSubview(".modal-content", view).$el.addClass(newClass);
  },

  reset: function () {
    this.$el.removeClass("active").removeClass("form");
  },

  erase: function (event) {
    if ( event && ($( event.target ).hasClass("modal") || $(event.target).hasClass("cancel") )) {
      event.preventDefault();
      this.clear();
    } else if (event === undefined) {
      this.clear();
    }
  },

  bumper: function () {
    var bumperCard = new StudyBlocks.Models.Card({
      front: "We are building your blocks",
      back: "Please be patient",
      format: "response",
    }, {});
    var bumperView = new StudyBlocks.Views.CardShow({
      model: bumperCard,
    });
    bumperView.render().$el.addClass("bumper");
    var $spinner = $("<i class=\"fa fa-cog fa-spin fa-4x\"></i>");
    this.set(bumperView, "form");
    bumperView.$(".front").append("<br>").append($spinner);
    bumperView.$(".score").empty();
    for (var i = 0; i < 3; i++) {
      bumperView.$(".right-face").append("<br>").append("<i class=\"fa fa-cog fa-spin fa-4x\"></i>").append("<br>");
    }
    return this;
  },

  clear: function () {
    _.each(this.subviews(".modal-content"), function (subview, selector, subviews) {
      subview.remove();
      delete subviews[selector];
    });

    this.reset();
  }
});
