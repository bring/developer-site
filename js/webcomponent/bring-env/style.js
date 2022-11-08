export default function bringEnvStyle(isModal) {
  return `<style>
    * {
      font-family: 'PSRegular';
    }

    h1, h2 {
      font-family: 'PSBold';
      font-size: 3rem;
      line-height: 1.4;
      color: #00643A;
      margin: 0 0 2rem;
    }

    h2 {
      font-size: 2rem;
    }

    p, li, a {
      font-size: 1.4rem;
      line-height: 1.6;
      color: rgba(0, 47, 25, 0.8);
    }

    a {
      color: #0066db;
      text-decoration: none;
    }

    a:hover {
      color: inherit;
    }

    @media only screen and (max-width: 768px) {
      h1 {
        font-size: 2rem;
      }
      h2 {
        font-size: 1.5rem;
      }
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
    `.backdrop {
        position: fixed;
        height: 100vh;
        width: 100vw;
        background: hsla(0,0%,50%,0.5);
        top: 0;
        left: 0;
        z-index:5000;
      }`
    : ''}

    .wrapper {
      background: #F1F7E9;
      padding: 0;
      box-sizing: border-box;
      position: relative;
      ${isModal ?
      `border-radius: 3px;
      width: 40rem;
      max-width: 100%;
      height: 40rem;
      max-height: 100vh;
      overflow: hidden;
      box-shadow: 0 2px 2px 0 rgb(0 0 0 / 10%), 0 1px 5px 0 rgb(0 0 0 / 12%);
      z-index: 5001;`
      : 'width: 100%;'}
    }

    .bring-env-header {
      height: 5rem;
      display: flex;
      padding: 0 2rem;
      align-items: center;
    }

    .header-logo {
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

    .content {
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

    section {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      align-items: flex-start;
      width:100%;
      padding: 0 2rem 2rem;
    }

    .bring-env-image {
      display: flex;
      flex: 1 1 30rem;
      max-width: 40rem;
      justify-content: center;
      margin: 3rem 0;
    }
    
    .bring-env-image .image {
      width: 76%;
      display: block;
    }

    .bring-env-text {
      flex: 0 1 40rem;
      max-width: 40rem;
    }

    .bring-env-text ul {
      padding: 0;
      margin-left: 1.3rem;
    }
  </style>`;
}