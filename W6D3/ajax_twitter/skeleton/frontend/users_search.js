class UsersSearch {
  constructor($el){
    this.input = $el.find('input');
    this.ul = $el.find('ul');
    this.el = $el;


    this.input.keypress((e) => {

      let key = e.which;
      let string = String.fromCharCode(key);
      this.handleInput(string);
    });
  }

  handleInput(string) {

    let result = APIUtil.searchUsers(string);
    $(result).each(function(user){
      $(this.ul).append(`<li>@${user.username}</li>`);
    });
  }
}


class APIUtil{
  static searchUsers(queryVal,success){
    return $.ajax({
      url: '/users/search',
      method: 'GET',
      dataType: 'JSON',
      data:{
        username: queryVal
      }

    });

  }
}

module.exports = UsersSearch;
