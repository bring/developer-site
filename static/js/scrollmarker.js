/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (function() { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./js/scrollmarker.js":
/*!****************************!*\
  !*** ./js/scrollmarker.js ***!
  \****************************/
/***/ (function() {

eval("//Show in left menu which endpoint is in viewport\nconst anchoredTitles = document.querySelectorAll('.dev-anchored')\n\nif(anchoredTitles.length > 0) {\n  const listItems = document.querySelectorAll('[data-list-item]')\n\n  let observerOptions = {\n    root:document.body.main,\n    rootMargin: '-45% -45%',\n    threshold: 0\n  }\n  \n  const ob = new IntersectionObserver(observeFunc,observerOptions)\n\n  anchoredTitles.forEach((el) => {\n    ob.observe(el)\n  })\n\n  function observeFunc(entries) {\n    entries.forEach(entry => {\n      if(entry.isIntersecting) {\n        let listItem = document.querySelector('[data-list-item=\"'+entry.target.id+'\"]')\n        if(listItem) {\n          listItems.forEach(item => {\n            item.classList.remove(\"active\")\n          })\n          listItem.scrollIntoView({ behavior: \"smooth\", block: \"center\", inline: \"nearest\" })\n          listItem.classList.add('active')\n        }\n      }\n    })\n  }\n\n  listItems.forEach(li => {\n    li.addEventListener('click', function() {\n      setTimeout(function() {\n        listItems.forEach(item => {\n          item.classList.remove(\"active\")\n        })\n        li.classList.add('active')\n      }, 10)\n    })\n  })\n}\n\n//# sourceURL=webpack://developer-site/./js/scrollmarker.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./js/scrollmarker.js"]();
/******/ 	
/******/ })()
;