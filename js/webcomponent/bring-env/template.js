import {postenLogo} from "./svgs/posten-logo.js";
import {flyingPackages} from "./svgs/flying-packages.js";
import {bicycleDelivery} from "./svgs/bicycle-delivery.js";
import {greenLeaf} from "./svgs/green-leaf.js";
import {greenTruck} from "./svgs/green-truck.js";
import {smallCar} from "./svgs/small-car.js";
import {train} from "./svgs/train.js";
import {uploadingTruck} from "./svgs/uploading-truck.js";

export default function bringEnvTemplate(isModal) {
  return `<div class="bring-env">
    <div class="wrapper">
      <div class="bring-env-header">
        ${postenLogo}
        ${isModal ? `<div class="close-modal"><button class="close-modal-btn" aria-label="Close modal" data-close-modal>
            <svg width="16" height="16" viewBox="0 0 352 512">
            <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
          </button>
        </div>` : ''}
      </div>
      <div class="content">
        <section>
          <div class="bring-env-text">
            <h1>Hva er klimakompensert frakt</h1>
            <p>Når du velger levering med Posten, vil vi jevne ut klimagassutslippene ved kjøp av kvoter. Det vil si at utslippet som frakten medfører blir minsket med samme mengde et annet sted i verden. I kassen er det miljøvennlige alternativet markert i grønt med &laquo;miljøvennlig&raquo;. Slik kan du gjøre et grønnere valg.</p>
          </div>
        </section>
        <section>
          <div class="bring-env-text">
            <h2>Hva gjør Posten / Bring</h2>
            <p>I Posten og Bring jobber vi aktivt og målrettet hver dag for å redusere våre klimautslipp, slik at vi kan frakte dine pakker med så lave utslipp som mulig.</p>
          </div>
          <div class="bring-env-cards">
            <div class="card">
              <div class="card-heading">
                ${greenTruck}
                <h3>900</h3>
              </div>
              <p>Vi har idag <strong>900</strong> elektriske vare- og lastebiler</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${bicycleDelivery}
                <h3>700</h3>
              </div>
              <p>Vi har idag ca. <strong>700</strong> elektriske mopeder, sykler og traller</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${smallCar}
                <h3>600</h3>
              </div>
              <p>Vi har satt en stopp for bestilling av fossilfrie varebiler, og rundt <strong>600</strong> nye elektriske varebiler er bestilt.</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${greenTruck}
                <h3>65 / 70</h3>
              </div>
              <p>Vi har idag <strong>65</strong> elektriske lastebiler og <strong>70</strong> biogassdrevne lastebiler under levering.</p>
            </div>
          </div>
        </section>
        <section>
          <div class="bring-env-text">
            <h2>Mål</h2>
            <p>Målet er å oppnå et nettonullutslipp i 2050, som er i tråd med Parisavtalen (2030). Her er noen av de tiltakene som vi har gjennomført og skal gjennomføre:</p>
          </div>
          <div class="bring-env-cards">
            <div class="card">
              <div class="card-heading">
                ${flyingPackages}
              </div>
              <p>I dag har vi utslippsfri postdistribusjon i <strong>49</strong> byer, og har et mål om <strong>40</strong> nordiske byer til med fossilfri distribusjon av pakker med varebil.</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${uploadingTruck}
              </div>
              <p>Vi optimaliserer kontinuerlig kjøreruter og øker fyllingsgrad av biler.</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${greenLeaf}
              </div>
              <p>Vi etablerer solceller og ladeinfrastruktur på våre terminaler.</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${smallCar}
              </div>
              <p>Vi etablerer sentrumsnære lokasjoner for å kunne ta i bruk elektriske kjøretøy.</p>
            </div>
            <div class="card">
              <div class="card-heading">
                ${train}
              </div>
              <p>Vi er en av nordens største brukere av tog.</p>
            </div>
            <div class="bring-env-bottom">
              ${flyingPackages}
              <p>Les mer på <a href="https://www.postennorge.no/baerekraft" target="_blank">postennorge.no/baerekraft</a></p>
            </div>
          </div>
        </section>
      </div>
    </div>
    ${isModal ? '<div class="backdrop" data-close-modal></div>' : ''}
  </div>`;
}