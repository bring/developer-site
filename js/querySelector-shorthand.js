function $ (selector, el) {
     if (!el) {el = document;}
     return el.querySelector(selector);
}
function $$ (selector, el) {
     if (!el) {el = document;}
     // return an array instead of a NodeList
     return Array.prototype.slice.call(el.querySelectorAll(selector));
}
