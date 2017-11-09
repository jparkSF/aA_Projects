/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(2);


$( () => {
  const $el = $('button.follow-toggle');
  const $fl = $('.users-search');

  new UsersSearch($fl);

  $el.each(function(index) {

      new FollowToggle($(this));
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);