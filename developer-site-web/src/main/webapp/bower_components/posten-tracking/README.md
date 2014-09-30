# Posten Tracking Polymer Web Component

Implement tracking results directly in your web shop, web app or **anywhere**!

This is a [Polymer web component](http://www.polymer-project.org), which lets you include asynchronous tracking
results in your web project. It supports IE10+ and all other modern browsers.

## Installation

You can install this component in your web app through [Bower](http://www.bower.io):

    bower install --save https://github.com/bring/tracking-web-component.git#master

In the website, include the following lines of code in your head tag:

    <script src="bower_components/platform/platform.js"></script>

    <link rel="import" href="bower_components/posten-tracking/posten-tracking.html">

## Usage

The components has a few different modes, that can be used to fit your needs.

### Simple search box

You can implement a search box wherever you want in your web application.

    <posten-tracking></posten-tracking>

### Predefined tracking number

If you know the tracking number of the shipment you want to track, you can show
the status without ever prompting the user for a tracking number. Use the
``trackingNumber`` attribute:

    <posten-tracking trackingNumber="123-tracking-number-123"></posten-tracking>


### Choose the language

You probably have a preferred language for your website. You can set this
explicitly by using the ``language`` attribute:

    <posten-tracking language="en"></posten-tracking>

Supported languages are Norwegian (no) and English
(en). **The default is Norwegian (no)**.

### Override the styles

We've implemented some basic styles for you. If you want to change the
look-and-feel of the component, you can do so quite simply. For example, if you
want to override the color of the tracking number, put this in your CSS file:

    posten-tracking /deep/ h1.small {
      color: red;
    }

Inspect the DOM to figure out what selectors to choose.

## Feedback

If you find a bug, or want to suggest a feature, please file an issue here on
Github.
