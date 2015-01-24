StudyBlocks.Views.ImportForm = Backbone.View.extend({
  tagName: "form",
  className: "import",
  events: {
    "click .close": "cancel",
    "click .import": "importCards",
    "click .modal": "cancel",
    "change #cards-input": "fileInputChange"
  },
  template: JST["cards/import"],

  importCards: function (event) {
    event.preventDefault();
    $.ajax({
      url: "api/decks/" + this.model.id + "/import",
      data: { csv: this.reader.result },
      type: "PATCH",
      dataType: "json",
      success: function () {
        Backbone.history.navigate("decks/" + this.model.id, { trigger: true });
      }.bind(this)
    });
  },

  cancel: function (event) {
    event && event.preventDefault();
    this.$el.parent().removeClass("form");
    this.remove();
  },

  fileInputChange: function(event) {
    var that = this;
    var file = event.currentTarget.files[0];
    this.reader = new FileReader();
    if (file && file.type === "text/csv") {
      $(".file-name").text("File Name: " + file.name);
      this.reader.readAsText(file);
    } else {
      $("#cards-input").val('');
    }
  },
});
