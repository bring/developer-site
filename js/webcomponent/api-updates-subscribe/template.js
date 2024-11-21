export default function apiUpdatesTemplate(isModal, includeButton, buttonText, buttonClass) {
  return `${isModal && includeButton ? `<button class="${buttonClass}" data-api-updates-open>${buttonText}</button>` : ''}

${isModal ? '<dialog class="mb-modal api-updates bg-green1">' : '<div class="api-updates bg-green1">'}
  <div class="api-updates-wrapper">
    <div class="flex flex-dir-col gam${isModal ? '': ' pal'}">
      <div class="flex gal justify-csb align-ic">
        <h2>Subscribe</h2>
        ${isModal ? `<button class="btn-link--dark" aria-label="Close modal" data-close-modal>
            <svg class="icon-ui" viewBox="0 0 352 512">
            <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
          </button>` : ''}
      </div>
      <p class="mb0">Get API updates via email.</p>
      <form class="cr_form cr_font" action="https://seu2.cleverreach.com/f/362555-365663/wcs/" method="post" id="cr-subscribe-form" target="_blank">
        <div class="cr_font">
          <div id="8265196" rel="email" class="cr_ipe_item musthave" >
            <label for="text8265196">Email*</label>
            <input class="form__control required email" type="email" id="text8265196" name="email" value="" placeholder="name@example.com" >
          </div>

          <div class="flex flex-dir-col mbs">
            <fieldset class="flex flex-dir-col">
              <legend class="mbs">API areas</legend>
              <div id="8265204" rel="radio" class="cr_ipe_item musthave flex gam" >
          
                <label class="form__radio">
                    <input id="All8265204" name="1153579" type="radio" value="All" checked data-api-area>
                    All
                </label>
            
                <label class="form__radio">
                    <input id="Select API area8265204" name="1153579" type="radio" value="Select API area" data-api-area>
                    Select API area
                </label>

              </div>
            </fieldset>

            <fieldset>
              <legend class="screen-reader-text">Select one of the API areas</legend>
                <div id="8265206" rel="checkbox" class="cr_form-component cr_ipe_item">
                  <div class="flex flex-wrap plm gas mbm api-area-checkboxes hidden" id="apiAreas">

                  <label class="form__check">
                      <input id="Checkout8265206" type="checkbox" name="1153580[]" value="Checkout" >
                      Checkout
                  </label>

                  <label class="form__check">
                      <input id="Booking8265206" type="checkbox" name="1153580[]" value="Booking" >
                      Booking
                  </label>
              
                  <label class="form__check">
                      <input id="Tracking8265206" type="checkbox" name="1153580[]" value="Tracking" >
                      Tracking
                  </label>
              
                  <label class="form__check">
                      <input id="Reports8265206" type="checkbox" name="1153580[]" value="Analytics" >
                      Analytics
                  </label>
              
                  <label class="form__check">
                      <input id="Warehousing8265206" type="checkbox" name="1153580[]" value="Warehousing" >
                      Warehousing
                  </label>
              
                  <label class="form__check">
                      <input id="Order Management8265206" type="checkbox" name="1153580[]" value="Order management" >
                      Order Management
                  </label>
              </div>
            </fieldset>
          </div>

          <details class="mb-disclosure bg-green1 mbm">
            <summary>
              <span
                data-mybicon="mybicon-arrow-right"
                data-mybicon-width="16"
                data-mybicon-height="16"
              ></span>
              Privacy policy
            </summary>
            <div class="text-note pas content__gdprLegal">
              <p>You can unsubscribe at any time by clicking the link in the footer of our emails. Read more about <a href="https://www.bring.com/privacy-policy" target="_blank" rel="noopener noreferrer">our privacy policy</a>.</p>
              <p>We use CleverReach. By clicking below to subscribe, you acknowledge that your information will be transferred to CleverReach for processing. <a href="https://www.cleverreach.com/en-de/terms-of-service/" target="_blank" rel="noopener noreferrer">Learn more about CleverReach's privacy practices here.</a></p>
            </div>
          </details>

          <div id="cr-responses" class="mbs">
            <div class="cr-response error dn" id="cr-error-response" role="alert"></div>
          </div>

          <div id="8265198" rel="button" class="cr_form-component cr_form-component--submit cr_ipe_item  submit_container">
            <button type="submit" class="button btn btn--green" name="subscribe" id="cr-subscribe">Subscribe</button>
          </div>
        </div>
        <noscript><a href="http://www.cleverreach.com" target="_blank" rel="noopener noreferrer">www.CleverReach.com</a></noscript>
      </form>
    </div>
  </div>
  ${isModal ? '</dialog>' : '</div>'}`;
}
