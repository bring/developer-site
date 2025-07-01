---
layout: post
title: Principle for responsive tables
publishDate: 2020-02-27 06:35:00
tags:
  - code-and-design
params:
  authors:
    - HalvorSanden
---

When I set out to _solve_ responsive tables, I figured it would take a whole team a couple of weeks and we would build a microscopic component to provide clever shuffling of `<div>` elements. Instead, my conclusion led me to the opposite. Responsive tables are less about making them responsive and more about presenting them in responsive environments.

## The principle
Use the `<table>` element for things that it would make sense to copy and paste into a spreadsheet. This means that a table should be used when the data is best presented as such, and the alternatives are inferior. Which in turn means that responsiveness should be about presenting tables more or less as they are. That is, without distorting or rearranging them or the surrounding layout in a way that makes either lose meaning.

## The explanation

### Content, not layout
The mantra “never use tables for layout” has been repeated for what seems like twenty years. And as with most things that start with “never use”, only the first part seems to stick. It has mostly led to good things, but it has also led people, including myself, to believe that tables, or rather the `<table>` element, is bad. Its lack of responsiveness a contributing factor.

I’m fairly certain the original intent was “never use the `<table>` element for layout”. Which is slightly more precise but provides a lot more insight.

It implies that tables are not layout. Yet, by striving for responsive tables, we keep treating them as such. I’ll be the first one to admit that I have seen tables as something that must adapt to the viewport to match the layout. But tables are not a way of placing content, it _is_ content. And it holds data. Data that has meaning because of its relation and position to the other data in the table. Not unlike other kinds of content, such as figures, maps and text, where one single part holds little meaning on its own, but moving it around will alter the total.

The mantra also means that there are use cases where the `<table>` element _is_ the best and perhaps only solution. An interpretation which might have snuffed out some of the nested `<div>`-based tables and libraries that make data near-impossible to copy and paste or make sense of using assistive tech. Not too different from showing your text as images.

### Scaling and scrolling
If you manage to scale down and rearrange a table without change or loss of meaning, then go for it. That can usually be done with [data-attributes and CSS](https://codepen.io/hwsanden/pen/oNXzpqd) or by making a separate [description list component](https://inclusive-components.design/data-tables/). This is usually unproblematic for smaller tables that are part of articles or a larger interface.

Scaling like that is not a viable option for table-heavy interfaces with maybe ten to twenty columns and twenty to hundred rows with sorting and filtering. In such cases, overflow and scroll is your friend. But make sure it can be tabbed to when overflowing, and that only the table is scrolling horizontally, not the entire page.

For such big tables, 1500 px can be a small screen. The solution can then be to provide users with more control. For instance, selecting which columns to show, adjusting widths or the font size manually.

### Widths and readability
Responsiveness doesn’t make all screens equally convenient to use. If a huge part of the user base is required to work on mobile, it might be time to reconsider the table and the data altogether. But table-heavy services tend to be used by office workers, which makes ever-increasing screen sizes a more pressing matter. Responsiveness is also about not filling the entire viewport. 

Tables should not be set to 100 per cent width – or any width at all. Out of the box, tables take up the space they need within what is available. If the container is smaller, the columns will shrink down to either the biggest data piece or the individually set min-width of each column before it starts overflowing. If the container is wider, the table columns will either be as wide as their data plus padding or individually set max-width. 

Whenever you start filling the width of the layout, you move that unpredictable, infinite empty space into your content. Making _that_, in turn, fall apart. In terms of tables, it increases the spacing between the columns, making it difficult to follow the rows.

Wrapping long lines by setting a column’s max-width might be helpful for readability as well. Just remember to align the content at the top of the cells, so the users can follow _the sequential flow of the writing system_ – the reading direction.

### Some tables are not `<table>`
Not using the `<table>` element for layout means that content that isn’t tabular data, but might look like tables, should use something else. Content that needs to be aligned in some kind of fashion doesn’t automatically call for the `<table>` element. If it has nested content, and lots of actions, it’s probably some sort of toolbar, listing or separate boxes instead. And a block element with flex or grid is probably a better choice.

## Future table
I don’t think tables are perfect the way they are, but it’s the best we have at the moment – and they have an undeserved bad reputation. For the foreseeable future, it makes more sense to keep most tabular data in tables without shuffling them around too much. 

There are different types of tables that solve different things. But chasing a CSS grid or flexbox level of responsiveness only mutates tables into something they’re not. Maybe, within ten years time, the `<table>` element and corresponding CSS will see improvements, while still remaining a meaningful way to arrange and display data.
