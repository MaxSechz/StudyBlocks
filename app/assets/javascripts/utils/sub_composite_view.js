Backbone.CollectionView = Backbone.CompositeView.extend({
  selector: '',
  subModelViewName: '',
  options: {},

  subModelView: function (obj) {
    var realOptions = {};
    for (var attr in this.options) {
      obj[attr] = this.options[attr];
    }
    return new StudyBlocks.Views[this.subModelViewName](obj);
  },

  postTasks: function () {
    this.renderCollection();
  },

  renderCollection: function () {
    var keys = [];
    for (var i = 0; i < this.collection.models.length; i++) {
      var modelId = this.addModelView(this.collection.models[i]);
      modelId && keys.push(modelId.toString());
    }
    var trash = _.omit(this.subviews(this.selector), keys);
    _.each(trash, function (subview) {
      subview.remove();
    });
    this.subviews()[this.selector] = _.pick(this.subviews(this.selector), keys);
    Backbone.View.prototype.postTasks.apply(this);
  },

  addModelView: function (subModel) {
    if (this.subModelView === undefined) {
      return;
    }
    var subView = this.subModelView({ model: subModel });
    this.addSubview(this.selector, subView.render());
    return subModel.id || subModel.cid;
  },
});
