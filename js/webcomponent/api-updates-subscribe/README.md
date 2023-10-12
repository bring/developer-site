# API updates subscription

A web component made for subscribing to API updates on the developer-site. This
can be reused wherever it's needed by adding the custom element
`api-updates-subscribe` and the script reference. Additionally it can be treated
as a modal by passing an optional attribute `modal="true"` on the custom element.

## Including the script

Include the script with `type="module"` where it's best suited:
`<script type="module" src="https://developer.bring.com/assets/api-updates-subscribe/main.js"></script>`

## Usage example

```
<api-updates-subscribe
  modal="true"
  button-text="Click me"
  button-class="some-class"
/>
```

## Optional attributes

`modal` - Defaults to `false`. If added with `true` value (string), the web component will be treated as a modal.
`include-button` - Defaults to `true` and is rendered only if `modal="true"` is set. If added with `false` value (string), no button will be rendered.
`button-text` - Defaults to `Register email`. Another string can be passed as value.
`button-class` - Defaults to `btn`. Other class names can be passed as string values.

## Implemented in

The web component is currently implemented in:

- mybring-useradmin
- frontpage