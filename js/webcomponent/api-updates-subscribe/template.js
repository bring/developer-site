export default function apiUpdatesTemplate(isModal) {
  return `<div class="api-updates" ${isModal ? 'role="dialog" aria-modal="true"' : ''}>
    <div class="api-updates-wrapper">
      ${isModal ? `<div class="api-updates-header justify-cfe ptm prm">
        <button class="btn-link--dark" aria-label="Close modal" data-close-modal>
          <svg class="icon-ui" viewBox="0 0 352 512">
          <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
        </button>
      </div>` : ''}
      <div class="api-updates-content pal${isModal ? ` pt0` : ``}" id="mc_embed_signup">
        <h1>Subscribe to API updates</h1>
        <form action="https://bring.us5.list-manage.com/subscribe/post?u=f6b9d5de1a234124c14558d51&amp;id=8b45ecec29" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
          <div id="mc_embed_signup_scroll">
            <div class="mc-field-group flex flex-dir-col">
              <fieldset class="flex flex-dir-col">
                <legend>API areas</legend>
                <label class="form__radio">
                  <input type="radio" value="All" name="APIAREA" id="mce-APIAREA-0" data-api-area checked>
                  All
                </label>
                <label class="form__radio">
                  <input type="radio" value="Select API area" name="APIAREA" id="mce-APIAREA-1" aria-controls="api-areas" data-api-area>
                  Select API area
                </label>
              </fieldset>
              <fieldset>
                <legend class="screen-reader-text">Select one of the API areas</legend>
                <div class="flex flex-wrap plm gas mbm api-area-checkboxes hidden" id="api-areas">
                  <label class="form__check">
                    <input type="checkbox" value="1" name="group[383557][1]" id="mce-group[383557]-383557-0">
                    Checkout
                  </label>
                  <label class="form__check">
                    <input type="checkbox" value="2" name="group[383557][2]" id="mce-group[383557]-383557-1">
                    Booking
                  </label>
                  <label class="form__check">
                    <input type="checkbox" value="4" name="group[383557][4]" id="mce-group[383557]-383557-2">
                    Tracking
                  </label>
                  <label class="form__check">
                    <input type="checkbox" value="8" name="group[383557][8]" id="mce-group[383557]-383557-3">
                    Warehousing
                  </label>
                  <label class="form__check">
                    <input type="checkbox" value="16" name="group[383557][16]" id="mce-group[383557]-383557-4">
                    Reports and invoices
                  </label>
                  <label class="form__check">
                    <input type="checkbox" value="32" name="group[383557][32]" id="mce-group[383557]-383557-5">
                    Order management
                  </label>
                </div>
              </fieldset>
            </div>
            <div class="mc-field-group">
              <label for="mce-EMAIL" class="form__label">Email address
              </label>
              <input type="email" value="" name="EMAIL" class="form__control required email" id="mce-EMAIL">
            </div>
            <div id="mergeRow-gdpr" class="mbm mergeRow gdpr-mergeRow content__gdprBlock mc-field-group">
              <div class="content__gdpr">
                <fieldset class="mc_fieldset gdprRequired mc-field-group" name="interestgroup_field">
                  <label class="checkbox subfield form__check mbm" for="gdpr_366129"><input type="checkbox" id="gdpr_366129" name="gdpr[366129]" value="Y" class="av-checkbox gdpr">I confirm that Posten Norge AS can send me API update emails</label>
                </fieldset>
              </div>
              <details class="mb-disclosure mb-disclosure--arrow bg-green1 mbm">
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
                  <p>We use Mailchimp. By clicking below to subscribe, you acknowledge that your information will be transferred to Mailchimp for processing. <a href="https://mailchimp.com/legal/terms" target="_blank">Learn more about Mailchimp's privacy practices here.</a></p>
                </div>
              </details>
            </div>
            <div id="mce-responses" class="clear foot">
              <div class="mce-response error" id="mce-error-response" style="display:none" role="alert"></div>
              <div class="mce-response success" id="mce-success-response" style="display:none"></div>
            </div>
            <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
            <div style="position: absolute; left: -5000px;" aria-hidden="true">
              <label for="hiddenMCInput" class="form__label">Hidden input</label>
              <input type="text" name="b_f6b9d5de1a234124c14558d51_8b45ecec29" tabindex="-1" value="" id="hiddenMCInput">
            </div>
            <div class="optionalParent">
              <div class="clear foot">
                <input type="submit" value="Subscribe to API updates" name="subscribe" id="mc-embedded-subscribe" class="button btn btn--green">
                <p class="brandingLogo dn"><a href="http://eepurl.com/hOnEJv" title="Mailchimp - email marketing made easy and fun"><img src="https://eep.io/mc-cdn-images/template_images/branding_logo_text_dark_dtp.svg" width="0" height="0" alt="Hidden image"></a></p>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
    ${isModal ? '<div class="api-updates-backdrop" data-close-modal></div>' : ''}
  </div>`;
}