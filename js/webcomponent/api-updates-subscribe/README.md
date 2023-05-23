# API updates subscription
A web component made for subscribing to API updates on the developer-site. This can be reused whereever it's needed by adding the custom element `api-updates-subscribe` and the script reference. Additionally it can be treated as a modal by passing an optional attribute `modal="true"` on the custom element and adding the data attribute `data-api-updates-open` on a trigger.

## Example of usage
```
<button className="btn" data-api-updates-open>
  Register email
</button>

<api-updates-subscribe modal="true" />
```

## Including the script
Include the script with `type="module"` and `defer` where it's best suited:
`<script type="module" src="https://developer.bring.com/assets/api-updates-subscribe/main.js" defer></script>`

## Implemented in
The web component is currently implemented in:
- mybring-useradmin
