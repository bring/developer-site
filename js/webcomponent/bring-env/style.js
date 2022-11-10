export default function bringEnvStyle(isModal) {
  return `<style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'PSRegular';
    }

    h1, h2 {
      font-family: 'PSBold';
      font-size: 2.2rem;
      line-height: 1.6;
      color: #4a1011;
      margin: 0 0 1rem;
    }

    p, li, a {
      font-size: 1.2rem;
      line-height: 1.6;
      color: #000;
    }

    a {
      color: #000;
      text-decoration: none;
      border-bottom: 1px solid #e32d22;
    }

    a:hover {
      color: #e32d22;
    }

    .bring-env {
      ${isModal ?
      `display: none;
      height: 100vh;
      width: 100vw;
      position: fixed;
      top: 0;
      left: 0;`
      : 'display:flex;'}
      justify-content: center;
      align-items: center;
    }

    .bring-env.open {
      display: flex;
    }

    ${isModal ?
    `.bring-env-backdrop {
        position: fixed;
        height: 100vh;
        width: 100vw;
        background: hsla(0,0%,10%,0.5);
        top: 0;
        left: 0;
        z-index:5000;
      }`
    : ''}

    .bring-env-wrapper {
      padding: 0;
      position: relative;
      ${isModal ?
      `background: #ffffff;
      border-radius: 3px;
      width: 50rem;
      max-width: 94vw;
      height: 100%;
      max-height: 80vh;
      overflow: hidden;
      box-shadow: 0 2px 2px 0 rgb(0 0 0 / 10%), 0 1px 5px 0 rgb(0 0 0 / 12%);
      z-index: 5001;`
      : 'width: 100%;'}
    }

    .bring-env-header {
      height: 5rem;
      display: flex;
      align-items: center;
      ${isModal ?
        `padding: 0 2rem;`
      : 'padding: 0;'}
    }

    .bring-env-header-logo {
      width: 125px;
    }
    
    .close-modal {
      display: flex;
      width: 100%;
      justify-content: flex-end;
      align-items: center;
    }

    .close-modal-btn {
      background: hsl(0, 0%, 95%);
      -webkit-appearance: none;
      appearance: none;
      border: 1px solid hsl(0, 0%, 75%);
      border-radius: 2px;
      padding: 0.3rem;
      text-align: center;
      transition: 0.15s ease-out;
      margin: 0;
    }

    .close-modal-btn:hover {
      background: hsl(0, 0%, 90%);
    }

    .close-modal-btn svg {
      display:block;
      fill: hsl(0, 0%, 20%);
    }

    .bring-env-content {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      width: 100%;
      gap: 2rem;
      ${isModal ?
      `height: calc(100% - 5rem);
      overflow-y: auto;`
      : ''}
    }

    .bring-env section {
      display: flex;
      flex-direction: column;
      width:100%;
      ${isModal ?
        `padding: 0 4rem;`
      : 'padding: 0;'}
    }

    ${isModal ?
      `@media only screen and (max-width: 38em) {
        .bring-env section {
          padding: 0 2rem;
        }
      }`
    : ''}

    ${isModal ? `
      .bring-env section:last-child {
        margin-bottom: 4rem;
      }`
    : ''}

    .bring-env-text {
      width: 100%;
      max-width: 46rem;
    }

    .bring-env-text ul {
      padding: 0;
      margin-left: 1.3rem;
    }

    .bring-env-cards {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
      max-width: 46rem;
      margin-top: 1rem;
    }

    .bring-env-cards .bring-env-card {
      background: #fff5f0;
      border-radius: 3px;
      padding: 2rem;
      flex: 1 1 15rem;
      display:flex;
      flex-direction: column;
      text-align: center;
    }

    .bring-env-cards .bring-env-card svg {
      max-height: 3rem;
      display: block;
      margin: 0 0 0.5rem;
      width:100%;
    }

    .bring-env-cards .bring-env-card p {
      font-size: 1rem;
      margin-top: 1rem;
    }

    .bring-env-cards .bring-env-card p strong {
      font-family: 'PSMedium';
      font-weight: normal;
    }
    
    .bring-env-bottom {
      text-align:center;
      width:100%;
    }

    .bring-env-bottom svg {
      max-width: 15rem;
      margin: 3rem 0;
    }
  </style>`;
}