var openLists = [], oIcount = 0;

function compactMenu(oID, oAutoCol, oPlMn, oMinimalLink) {
  if (!document.getElementsByTagName || !document.childNodes || !document.createElement) {
    return;
  }
  var baseElement = document.getElementById(oID);
  if (!baseElement) {
    return;
  }
  compactChildren(baseElement, 0, oID, oAutoCol, oPlMn, baseElement.tagName.toUpperCase(), oMinimalLink && oPlMn);
}

function compactChildren(oOb, oLev, oBsID, oCol, oPM, oT, oML) {
  if (!oLev) {
    oBsID = escape(oBsID);
    if (oCol) {
      openLists[oBsID] = [];
    }
  }
  for (var x = 0, y = oOb.childNodes; x < y.length; x++) {
    if (y[x].tagName) {
      //for each immediate LI child
      var theNextUL = y[x].getElementsByTagName(oT)[0];
      if (theNextUL) {
        //collapse the first UL/OL child
        theNextUL.style.display = 'none';
        //create a link for expanding/collapsing
        var newLink = document.createElement('A');
        newLink.setAttribute('href', '#');
        newLink.onclick = new Function('clickSmack(this,' + oLev + ',\'' + oBsID + '\',' + oCol + ',\'' + escape(oT) + '\');return false;');
        //wrap everything upto the child U/OL in the link
        if (oML) {
          var theHTML = '';
        } else {
          var theT = y[x].innerHTML.toUpperCase().indexOf('<' + oT);
          var theA = y[x].innerHTML.toUpperCase().indexOf('<A');
          var theHTML = y[x].innerHTML.substr(0, (theA + 1 && theA < theT) ? theA : theT);
          while (!y[x].childNodes[0].tagName || (y[x].childNodes[0].tagName.toUpperCase() !== oT && y[x].childNodes[0].tagName.toUpperCase() !== 'A')) {
            y[x].removeChild(y[x].childNodes[0]);
          }
        }
        y[x].insertBefore(newLink, y[x].childNodes[0]);
        y[x].childNodes[0].innerHTML = oPM + theHTML.replace(/^\s*|\s*$/g, '');
        theNextUL.MWJuniqueID = oIcount++;
        compactChildren(theNextUL, oLev + 1, oBsID, oCol, oPM, oT, oML);
      }
    }
  }
}

function clickSmack(oThisOb, oLevel, oBsID, oCol, oT) {
  if (oThisOb.blur) {
    oThisOb.blur();
  }
  oThisOb = oThisOb.parentNode.getElementsByTagName(unescape(oT))[0];
  if (oCol) {
    for (var x = openLists[oBsID].length - 1; x >= oLevel; x -= 1) {
      if (openLists[oBsID][x]) {
        openLists[oBsID][x].style.display = 'none';
        if (oLevel !== x) {
          openLists[oBsID][x] = null;
        }
      }
    }
    if (oThisOb === openLists[oBsID][oLevel]) {
      openLists[oBsID][oLevel] = null;
    } else {
      oThisOb.style.display = 'block';
      openLists[oBsID][oLevel] = oThisOb;
    }
  } else {
    oThisOb.style.display = (oThisOb.style.display === 'block') ? 'none' : 'block';
  }
}

function stateToFromStr(oID, oFStr) {
  if (!document.getElementsByTagName || !document.childNodes || !document.createElement) {
    return '';
  }
  var baseElement = document.getElementById(oID);
  if (!baseElement) {
    return '';
  }
  if (!oFStr && typeof (oFStr) != 'undefined') {
    return '';
  }
  if (oFStr) {
    oFStr = oFStr.split(':');
  }
  for (var oStr = '', l = baseElement.getElementsByTagName(baseElement.tagName), x = 0; l[x]; x++) {
    if (oFStr && MWJisInTheArray(l[x].MWJuniqueID, oFStr) && l[x].style.display === 'none') {
      l[x].parentNode.getElementsByTagName('a')[0].onclick();
    } else if (l[x].style.display !== 'none') {
      oStr += (oStr ? ':' : '') + l[x].MWJuniqueID;
    }
  }
  return oStr;
}

function MWJisInTheArray(oNeed, oHay) {
  for (var i = 0; i < oHay.length; i++) {
    if (oNeed === oHay[i]) {
      return true;
    }
  }
  return false;
}

function selfLink(oRootElement, oClass, oExpand, oLink) {
  var tmpLink;
  if (!document.getElementsByTagName || !document.childNodes) {
    return;
  }
  oRootElement = document.getElementById(oRootElement);
  if (oLink) {
    tmpLink = document.createElement('a');
    tmpLink.setAttribute('href', oLink);
  }
  for (var x = 0, y = oRootElement.getElementsByTagName('a'); y[x]; x++) {
    if (y[x].getAttribute('href') && !y[x].href.match(/#$/) && getRealAddress(y[x]) === getRealAddress(oLink ? tmpLink : location)) {
      y[x].className = (y[x].className ? (y[x].className + ' ') : '') + oClass;
      if (oExpand) {
        oExpand = false;
        for (var oEl = y[x].parentNode, ulStr = ''; oEl !== oRootElement && oEl !== document.body; oEl = oEl.parentNode) {
          if (oEl.tagName && oEl.tagName === oRootElement.tagName) {
            ulStr = oEl.MWJuniqueID + (ulStr ? (':' + ulStr) : '');
          }
        }
        stateToFromStr(oRootElement.id, ulStr);
      }
    }
  }
}

function getRealAddress(oOb) {
  return oOb.protocol + ((oOb.protocol.indexOf(':') + 1) ? '' : ':') + oOb.hostname + ((typeof (oOb.pathname) === typeof (' ') && oOb.pathname.indexOf('/') !== 0) ? '/' : '') + oOb.pathname + oOb.search;
}

function expandCollapseAll(oElID, oState) {
  if (!document.getElementsByTagName || !document.childNodes) {
    return;
  }
  var oEl = document.getElementById(oElID);
  var oT = oEl.tagName;
  var oULs = oEl.getElementsByTagName(oT);
  for (var i = 0, oLnk; i < oULs.length; i++) {
    if (typeof (oULs[i].MWJuniqueID) != 'undefined') {
      oLnk = oULs[i].parentNode.getElementsByTagName('a')[0];
      if (oLnk && ((oState && oULs[i].style.display === 'none') || (!oState && oULs[i].style.display !== 'none'))) {
        oLnk.onclick();
      }
    }
  }
}
