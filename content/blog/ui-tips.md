---
layout: post
title: DIY UI Tips for Backend Developers
publishDate: 2018-06-11 15:30:00 +01:00
tags:
  - code-and-design
params:
  authors:
    - ElisabethIrgens

---

Do you ever find yourself having to build user interfaces for web applications without an interaction designer or UI developer in sight? **What on earth is a fullstack-ish backender supposed to do?!** The UXers are off gathering insights, graphic designers are in a different corporate silo all together, the nearest frontender is busy.

Fear not! While design work sounds like a scary slippery slope away from coding, there is great pleasure in actually coding the right stuff. There are things you can do to figure out what that is, and DIY till your department hires more frontenders.

## The first milestone

All your instincts tell you to dive into your codebase to build the new feature right in the app, but stop. Don’t do that yet. Step away from the repo! The goal is to achieve clarity and agreement with all stakeholders. Then, and only then, is it a good idea to proceed coding the new feature. Depending on the complexity of the UI, repeat these exercises as needed. Remember to split up work just as you would your PRs.

---

## Describe the problem ✏️

Write down what you are trying to solve. Difficult? Maybe you need to ask more questions! When you have a couple of sentences down, post them on Slack for input from your team. Only get thumbs up? Great, you now have added confidence that everyone shares the general gist of the next steps. But describing the problem will often surface misunderstandings – and it’s excellent when this happens early.

## Use real content 🚨

Writing is hard, so people want to postpone doing it. You get asked to make the UI first, then words will be ”filled in later”. But content is really important. Don’t code a button if no-one yet knows what it should do. Aim to build UIs from the content out. Ask for text from the very beginning, temporary WIP drafts are fine. If you don’t get anything, start writing suggestions yourself and use that.

## Paper doodles 💭

Find a friend or five, pens for everyone, a stack of paper and brainstorm 10 different ways to layout this feature. Try different inputs, check what it looks like with a different order in the flow. Pick 3 versions you think are most promising, redraw to make them more understandable – and show your team for feedback.

## Whiteboard discussion 💬

Find a friend or five, the nearest whiteboard and brainstorm what this UI might look like. Explain your ideas, ask questions, have discussions about why you are using a select, or perhaps checkboxes would be better? Should you ask for the inputs in a different order? What happens when that button is clicked? Take photos of the board.  Take 10 minutes, take an hour. Rinse and repeat as needed.

## Codepen 🔍

Create isolated components in a Codepen, JS Bin or similar – and share the URLs one by one to your team for feedback. This task is helpful for removing distractions as you work on someting, both application complexity and surrounding components. Considering pages as a whole is great, but you can do that later. As with any type of work, splitting up into smaller parts can be helpful and makes discussions with stakeholders simpler when you all focus on one thing at a time.

## Prototype 🔨

Build a prototype in static HTML/CSS. Make loads of different versions. Don’t underestimate the value of this exercise; it can be great to start coding without dealing with the entire application complexity. Prototypes that your team can open in a browser and click around in, are really valuable for getting shared understanding of where the proposed solution is headed.

## UI critique 🤔

Find a group of people who have not been involved, developers from other teams are great for this exercise. Get them to ask critical questions about the UI you are working on. _Why does this arrow point down? Why does this X say Y?_ Take notes, but don’t answer the questions. The point is not to justify decisions to a new group of people. Some of the questions will be super annoying to hear, the group might not have the context, there can be a good reason for why X says Y. But other questions will point out issues that you have not thought about, and this is where the gold lies with involving a new group of people.

## User test 👩‍💻

Find a friend from a different team who has not seen what you are working on and ask them to use your UI. Write down what they say, where they are confused, where they try doing something that won’t work. You can do this with a prototype, you can do this with an early version of the feature in the app. User testing can be a science of it’s own, but it can also be this simple. Hand over the keyboard to someone else and watch what they do.

---

## Use this list as a toolbox

You need to figure out which tools to use when and in what order. You do not need all of them all the time. For a very large project, perhaps most of them come in handy — but often just a few will do. Experiment! Sometimes you try using a hammer, but later understand that it doesn’t quite cut it and you should pick up an axe.

This list is not a step by step progress, but a dance where you hop back and forth as needed. User test reveal new problems? Jump back to paper doodles or a whiteboard discussion. Complete clarity after a codepen? Fast forward and dive into the codebase.
