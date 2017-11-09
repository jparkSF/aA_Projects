const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');


$( () => {
  const $el = $('button.follow-toggle');
  const $fl = $('.users-search');

  new UsersSearch($fl);

  $el.each(function(index) {

      new FollowToggle($(this));
  });
});
