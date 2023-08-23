export default function apiUpdatesStyle(isModal) {
  return `<style>
    .api-updates {
      ${isModal ?
      `display: none;
      height: 100vh;
      width: 100vw;
      position: fixed;
      top: 0;
      left: 0;
      z-index: 5000;`
      : 'display:flex;'}
      justify-content: center;
      align-items: center;
    }

    .api-updates h2 {
      padding-left: 0;
      margin-bottom: 0;
    }

    .api-updates.open {
      display: flex;
    }

    .api-updates-wrapper {
      padding: 0;
      position: relative;
      max-width: 28rem;
      ${isModal ?
      `border-radius: 3px;
      width: 96vw;
      height: auto;
      max-height: 80vh;
      overflow-y: auto;
      box-shadow: 0 2px 2px 0 rgb(0 0 0 / 10%), 0 1px 5px 0 rgb(0 0 0 / 12%);
      z-index: 5002;`
      : 'width: 100%;'}
    }

    .api-updates-header {
      background: var(--green-lighter);
      height: 3rem;
      display: flex;
      align-items: center;
      position: sticky;
      top: 0;
    }

    .api-updates-content {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      ${isModal ?
      `height: calc(100% - 3rem);
      overflow-y: auto;`
      : ''}
    }

    .api-area-checkboxes.hidden {
      display: none;
    }

    .api-area-checkboxes label {
      flex: 1 1 10rem;
      margin-bottom: 0;
    }

    .cr-response {
      background-color: unset;
      margin-bottom: 1rem;
      padding: 0;
    }

    .cr-response.error {
      color: var(--red);
    }

    .cr-response.success {
      color: var(--green-dark);
    }

    .clever_form_error {
      border-color: var(--red) !important;
    }

    ${isModal ?
      `.api-updates-backdrop {
        position: fixed;
        height: 100vh;
        width: 100vw;
        background: hsla(0,0%,10%,0.5);
        top: 0;
        left: 0;
        z-index:5001;
      }`
    : ''}
  </style>`;
}