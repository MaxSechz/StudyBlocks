StudyBlocks.Views.ImportForm = Backbone.View.extend({
  tagName: "form",
  className: "import",
  events: {
    "click .import": "importCards",
    "change .cards-input": "fileInputChange"
  },
  template: JST["cards/import"],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  importCards: function (event) {
    event.preventDefault();
    $.ajax({
      url: "api/decks/" + this.model.id + "/import",
      data: { csv: this.reader.result },
      type: "PATCH",
      dataType: "json"
    });
  },

  fileInputChange: function(event) {
    console.log(event)
    var that = this;
    var file = event.currentTarget.files[0];
    this.reader = new FileReader();

    if (file) {
      this.reader.readAsText(file);
    } else {
      $(".cards-input").val('');
    }
  },
});
