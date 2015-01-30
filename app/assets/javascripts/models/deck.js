StudyBlocks.Models.Deck = Backbone.Model.extend({
  urlRoot: "api/decks",

  linkUrl: function (endPoint) {
    endPoint = endPoint || '';
    endPoint = endPoint && "/" + endPoint;
    return "#/decks/" + this.id + endPoint;
  },

  cards: function () {
    if (!this._cards) {
      this._cards = new StudyBlocks.Collections.Cards([], { deck: this });
    } else if (!this.isNew() && this._cards.isEmpty()) {
      this._cards.fetch({
        success: function () {
          this.done = true;
        }.bind(this)
      });
    }

    return this._cards;
  },

  toJSON: function (options) {
    var attrs = _.clone(this.attributes);
    attrs.cards_attributes = this.cards().toJSON();
    return { deck: attrs };
  },

  course: function () {
    if (!this._course) {
      this._course = new StudyBlocks.Models.Course({ id: this.course_id});
    }

    return this._course;
  },

  errors: function (errorField) {
    this._errors = this._errors || {};

    if (!errorField) {
      return this._errors;
    } else if (this._errors[errorField]) {
      return this._errors[errorField];
    }
  },

  tests: function () {
    if (!this._tests) {
      this._tests = new StudyBlocks.Collections.Tests([], { deck: this });
    } else if (!this.isNew() && this._tests.isEmpty()) {
      this._tests.fetch();
    }

    return this._tests;
  },

  parse: function (response) {
    if (response.cards) {
      this.cards().set(response.cards, {parse: true});
      delete response.cards;
    }
    if (response.course) {
      this.course().set(response.course);
      delete response.course;
    }
    if (response.scores) {
      this.scores = response.scores;
      delete response.scores;
    }
    if (response.user) {
      this.user = new StudyBlocks.Models.User(response.user);
      delete response.user;
    }
    return response;
  },

  progress: function () {
    return _.last(this.scores);
  }
});
