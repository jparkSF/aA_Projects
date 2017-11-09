class FollowToggle {
  constructor($el){
    this.userId = $el.attr('data-user-id');
    this.followState = $el.attr('data-initial-follow-state');
    this.el = $el;
    this.render();

    this.el.click(function(evt){
      evt.preventDefault();
      this.handleClick();

    }.bind(this));

  }

  render() {
    if (this.followState === "unfollowed"){
      this.el.text('');
      this.el.append('<p>Follow!</p>');
    } else {
      this.el.text('');
      this.el.append('<p>Unfollow!</p>');
    }
  }

  handleClick() {
      if (this.followState === "unfollowed") {
        this.followState = "followed";
        $.ajax({
          url: `/users/${this.userId}/follow`,
          method: 'POST',
          dataType: 'json',
          data: {
            followee_id: this.userId
          }
        });
      } else {
        this.followState = "unfollowed";
        $.ajax({
          url: `/users/${this.userId}/follow`,
          method: 'DELETE',
          dataType: 'json',
          data: {
            followee_id: this.userId
          }
        });
      }
      this.render();
  }
}

module.exports = FollowToggle;
