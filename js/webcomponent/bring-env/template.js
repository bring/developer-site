import {postenLogo} from "./svgs/posten-logo.js";
import {compPackages} from "./svgs/comp-packages.js";
import {compGirl} from "./svgs/comp-girl.js";

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
          <div class="bring-env-image">
            ${compPackages}
          </div>
          <div class="bring-env-text">
            <h1>Hva er klimakompensert frakt?</h1>
            <p>Ved at du velger levering med Posten/Bring så vil vi sørge for at klimagassutslipp, som frakten medfører, jevnes ut ved at vi kjøper kvoter. Det vil si at utslippet blir minsket med samme mengde et annet sted i verden. I kassen er det miljøvennlige alternativet markert i grønt med «miljøvennlig». Slik kan du gjøre et grønnere valg.
            Posten og Bring jobber aktivt hver dag for å redusere våre klimautslipp, slik at vi kan frakte dine pakker med så lave utslipp som mulig. Konsernet har per i dag ca. 900 elektriske vare- og lastebiler, i tillegg til ca. 700 elektriske mopeder, sykler og traller. Vi har satt stopp for bestilling av fossile varebiler, og rundt 600 nye elektriske varebiler er bestilt.
            Målet er å oppnå et nettonullutslipp i 2050, som er i tråd med Parisavtalen (2030).
          </div>
        </section>
        <section>
          <div class="bring-env-text">
            <h2>Hva betyr det?</h2>
            <p>Her er noen av de tiltakene som vi har og skal gjennomføre:</p>
            <ul>
              <li>49 byer med utslippsfri postdistribusjon, mål om 40 nordiske byer med fossilfri distribusjon av pakker med varebil</li>
              <li>65 elektriske lastebiler og 70 biogassdrevne lastebiler er under levering</li>
              <li>Kontinuerlig optimalisering av ruter og økt fyllingsgrad av biler</li>
              <li>Etablering av solceller og ladeinfrastruktur ved våre terminaler</li>
              <li>Etablering av sentrumsnære lokasjoner for å kunne ta i bruk elektriske kjøretøy</li>
              <li>En av Nordens største brukere av tog</li>
            </ul>
          </div>
          <div class="bring-env-image">
            ${compGirl}
          </div>
        </section>
      </div>
    </div>
    ${isModal ? '<div class="backdrop" data-close-modal></div>' : ''}
  </div>`;
}