export default function apiUpdatesStyle(isModal) {
  return `<style>
    :root[data-theme="dark"] {
      & .api-updates {
        color: var(--green-86);
        & label:has(input[type="checkbox"],input[type="radio"]):hover {
          color: var(--green-60);
        }
      }
    }
    
    .api-updates {
      width: 100%;
      max-width: 28rem;
    }

    .api-updates h2 {
      padding-left: 0;
      margin-bottom: 0;
    }

    .api-area-checkboxes.hidden {
      display: none;
    }

    .api-area-checkboxes label {
      flex: 1 1 11rem;
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
  </style>`;
}