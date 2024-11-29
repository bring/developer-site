---
layout: post
title: Abomination stylesheet
excerpt: A low-level HTML markup quality assurance tool
publishDate: 2024-11-27 06:35:00
tags: 
    - CSS
authors:
    - Igor-J86
---

The different browsers today are pretty forgiving when it comes to HTML markup and CSS. They have become good at rendering the markup, even if it‘s invalid HTML markup, causing the HTML validation to fail. While we should always strive to write valid HTML markup, mistakes do happen, and luckily the browsers do a pretty good job at rendering the code without breaking the layout completely. But, we still have invalid HTML markup, and our goal was to address these issues by making a low-level HTML markup quality assurance tool.

The intention of such a tool is that we suddenly have continuous live testing tool for markup code across different teams / applications, with no need of additional dependencies. It can be included in the `<head>` of the project as a standalone stylesheet, based on the environment we want it to appear in, or import it into an existing CSS.

## Abomination
The term *abomination* was totally strange to me, and after looking it up, it was surprising that the meaning of it is:

***Something that you dislike, disapprove, or something that is regarded with disgust.***

Huh... Should the thing we create show something that is disliked, disapproved or disgusting?
Why should we create something that can be destructive to the UI implementations we have?

It all became clear when I realised that the intention of such a thing is not to destroy or make things uglier, but rather making certain elements in the UI *stand out* in some way, signaling that there‘s an issue there.

## The power of CSS
Over the last decade CSS has gotten pretty versatile, and the browser support for features that have been added some years ago is now great.
We can now make use of all the nice features CSS offers, and utilise the power of CSS wildcards, pseudo-class functions and nesting. Using these techniques we can make very specific CSS selectors targeting the invalid HTML markup, and showing the issue by making those elements eye catching.

## Invalid markup
Some of the common mistakes we do are placing `<div>` element inside `<p>` elements, an `<a>` element inside a `<button>` element (or the other way around), and the one and only; making a `<label>` without the `for` attribute or not wrapping the `<input>` element.

```html
<!-- ❌ DON‘T -->
<p>
  <div>Doing something smart here</div>
  Some text here...
</p>

<!-- ❌ DON‘T -->
<button>
  <a href="#">Label</a>
</button>

<!-- ❌ DON‘T -->
<a href="#">
  <button>Label</button>
</a>

<!-- ❌ DON‘T -->
<ul>
  <div>Doing something smart here</div>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>

<!-- ❌ DON‘T -->
<label>Input label</label>
<input type="text" placeholder="user@example.com">
```

## Making specific selectors
We can start by selecting the elements we want to target, where we sometimes write invalid HTML markup, either by mistake or trying to make something really clever. By utilising the CSS functionalities and techniques we can mark those elements with an ugly, red outline.

Here are just some examples of our approach targeting some of these issues:

```css
p:has(div) div {
  --note: "🚫 <div> element cannot be inside a <p> element";
  outline: 2px solid var(--red);
}

button:has(a) a {
  --note: "🚫 <a> element cannot be inside a <button> element";
  outline: 2px solid var(--red);
}

a:has(button) button {
  --note: "🚫 <button> element cannot be inside <a> element";
  outline: 2px solid var(--red);
}

a[onclick],
a[href*="javascript"] {
  --note: "🚫 don‘t use <a> element to handle js events. Use event listeners instead.";
  outline: 2px solid var(--red);
}

ul:has(> :not(li)) > :not(li),
ul.list-bullets:has(> :not(li)) > :not(li) {
  --note: "🚫 only <li> elements can be descendant of the <ul> element";
  outline: 2px solid var(--red);
}

label:not([for],:has(input),:has(textarea),:has(select)) {
  --note: "😢 <label> is missing <for> attribute, or <input>, <textarea> or <select> child element";
  outline: 2px solid var(--red);
}
```

*We use `outline` instead of `border` since some elements already have borders applied, and we don‘t want to mess around with those. The size of the element will also not be affected by using the `outline` like it is by using `border`.*

## Inform
It is maybe not enough to just make an element stand out, but we should also inform about what the issue is in some way. A nice thing that comes in handy then is a custom property we can set: `--note`

This will show up in the developer tools (console) when you inspect the element that is suddenly surrounded by an ugly red outline, and can quickly identify what the fuzz is all about.

But, wait... By the power of CSS-Gods; we can actually display the note directly in the UI as well! 🤯

The whole CSS can be nested inside a wildcard selector. This will target all the elements that are defined inside and already marked with a red outline. By hovering these, we can then also display the `--note` that is applied to each of them inside an `::after` element.

```css
* {
  /* nested elements here */
  
  &:hover::after {
	content: var(--note);
	background-color: white;
	border: 2px solid var(--red);
	padding: 1rem;
	position: fixed;
	top: 20rem;
	left: 50%;
	transform: translateX(-50%);
	box-shadow: var(--shadow-dark);
	z-index: 9999;
  }
}

/*
  If you don‘t want elements to be selected
  by the wildcard selector, just use a :not()
  on it: *:not(.some-element)
*/
```

## How we use it
In Mybring, we are currently linking to the abomination stylesheet directly within the `<head>` tag, but based on the testing environments we have. We don‘t want this to be available in the production environment. 😅

With such a tool, our main goal is that we can produce correct and valid HTML markup, that also results in writing less code, and where CSS and JS can be more direct and logically structured.

By using this as a tool for writing better and valid semantic markup, it will not only result in making the code easier and more efficient to iterate and develop further, but also make better usability and accessibility of the web application.
