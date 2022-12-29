import {postenLogo} from "./svgs/posten-logo.js";
import {flyingPackages} from "./svgs/flying-packages.js";
import {bicycleDelivery} from "./svgs/bicycle-delivery.js";
import {greenLeaf} from "./svgs/green-leaf.js";
import {greenTruck} from "./svgs/green-truck.js";
import {smallCar} from "./svgs/small-car.js";
import {train} from "./svgs/train.js";
import {uploadingTruck} from "./svgs/uploading-truck.js";

export default function bringEnvTemplate(isModal) {
  return `<div class="bring-env" ${isModal ? 'role="dialog" aria-modal="true" aria-labelledby="modalTitle"' : ''}>
    <div class="bring-env-wrapper">
      <div class="bring-env-header">
        ${postenLogo}
        ${isModal ? `<div class="close-modal"><button class="close-modal-btn" aria-label="Close modal" data-close-modal>
            <svg width="16" height="16" viewBox="0 0 352 512">
            <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
          </button>
        </div>` : ''}
      </div>
      <div class="bring-env-content">
        <section>
          <div class="bring-env-text">
            <h1 ${isModal ? 'id="modalTitle"' : ''}>Hva er miljøvennlig levering?</h1>
            <p>Miljøvennlig levering vil si at din pakke leveres med elektrisk kjøretøy hjem til deg.</p>
          </div>
        </section>
        <section>
          <div class="bring-env-text">
            <h2>Hva gjør Posten og Bring?</h2>
            <p>I Posten og Bring jobber vi aktivt og målrettet hver dag for å redusere våre miljøavtrykk, slik at vi kan frakte dine pakker med så lave utslipp som mulig.</p>
          </div>
          <div class="bring-env-cards">
            <div class="bring-env-card">
              ${greenTruck}
              <p>Vi har <strong>900</strong> elektriske vare- og lastebiler, og flere er bestilt.</p>
            </div>
            <div class="bring-env-card">
              ${bicycleDelivery}
              <p>Vi har ca. <strong>700</strong> elektriske sykler, mopeder og traller.</p>
            </div>
            <div class="bring-env-card">
              ${smallCar}
              <p>Vi har satt en stopp for bestilling av fossile varebiler.</p>
            </div>
            <div class="bring-env-card">
              ${greenTruck}
              <p>Vi har utslippsfri postdistribusjon i <strong>49</strong> norske byer.</p>
            </div>
            <div class="bring-env-card">
              ${train}
              <p>Vi er en av nordens største brukere av tog.</p>
            </div>
          </div>
          <div class="bring-env-text">
            <p>Når vi ikke har mulighet til å levere med miljøvennlig transportmiddel kjøper Posten og Bring klimakvoter. Disse kvotene handles i <a href="https://www.regjeringen.no/globalassets/upload/md/2012/nyheter/mer_om_cdm.pdf" target="_blank" rel="noopener noreferrer">Den grønne utviklingsmekanismen (CDM)</a> markedet, som er en del av <a href="https://www.fn.no/om-fn/avtaler/miljoe-og-klima/kyotoprotokollen" target="_blank" rel="noopener noreferrer">Kyoto avtalen</a>.</p>
          </div>
        </section>
        <section>
          <div class="bring-env-text">
            <h2>Mål</h2>
            <p>Målet er å oppnå et netto nullutslipp i 2050, som er i tråd med <a href="https://www.fn.no/om-fn/avtaler/miljoe-og-klima/parisavtalen" target="_blank" rel="noopener noreferrer">Parisavtalen</a>. Her er noen av de tiltakene vi har gjennomført og skal gjennomføre:</p>
          </div>
          <div class="bring-env-cards">
            <div class="bring-env-card">
              ${flyingPackages}
              <p>Vi har et mål om at <strong>40</strong> nordiske byer skal få fossilfri distribusjon av pakker.</p>
            </div>
            <div class="bring-env-card">
              ${uploadingTruck}
              <p>Vi optimaliserer kjøreruter kontinuerlig og øker fyllingsgrad av biler.</p>
            </div>
            <div class="bring-env-card">
              ${greenLeaf}
              <p>Vi installerer solcellepaneler og ladeinfrastruktur på våre terminaler.</p>
            </div>
            <div class="bring-env-card">
              ${smallCar}
              <p>Vi etablerer sentrumsnære distribusjonspunkt for å kunne ta i bruk helelektriske kjøretøy.</p>
            </div>
            <div class="bring-env-bottom">
              ${flyingPackages}
              <p>Les mer: <a href="https://www.postennorge.no/baerekraft" target="_blank" rel="noopener noreferrer">postennorge.no/baerekraft</a></p>
            </div>
          </div>
        </section>
      </div>
    </div>
    ${isModal ? '<div class="bring-env-backdrop" data-close-modal></div>' : ''}
  </div>`;
}