import "../css/main.css"

import AnchorJS from "anchor-js"
const anchors = new AnchorJS();
anchors.options = { placement: "left", visible: "hover" }
anchors.add(".dev-anchored")

import "./servicefiltering.js"
import "./api.js"
import "./search/algolia.jsx"
import "./scrollmarker.js"

import "./drawer.js"

import "./tabs.js"

import "./collapsible.js"
window.collapsible.init()

