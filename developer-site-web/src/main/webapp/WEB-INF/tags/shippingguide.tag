<%@ tag language="java" pageEncoding="UTF-8"%>

                <div class="article">
              
                      
<h1>Hvordan bruke data?</h1>

<p>
Lag dine egne tjenester med data fra Bring! Velg selv hvordan du ønsker å hente data fra Fraktguiden.
</p>

<h2>XML API</h2>
<p>
    XML API er den letteste metoden for å integrere mot Fraktguiden for en nettbutikk. Metoden gir tilgang til data fra Bring via et enkelt grensesnitt.
</p>
<p>
    Eksempel på hvordan man henter XML fra Fraktguiden:
</p>
<p>
    <a target="_blank" href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/all.xml?from=1407&amp;to=1476&amp;weightInGrams=4000">Servicepakke på 4 kg fra Levanger til Rasta</a>
</p>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/xmlOverHttp.do">Flere eksempler!</a>
</p>

<h2>JSON</h2>
<p>
    Nettlesere kan hente informasjon fra eksterne sider dersom data tilgjengeliggjøres i JSONP format. 
    Hensikten med dette er at du kan lime inn HTML/Javascript på din side og enkelt bruke data fra Fraktguiden uten serverkomponenter på din side.
</p>
<p> 
    JSON har samme funksjonalitet som XML API og kan levere data i JSON eller JSONP format.
</p>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/jsonp.do">Prøv tjenesten!</a>
</p>

<h2>Online data (Web Services)</h2>
<p>
    Med Online Web Services kan du slå opp pris, transporttid, dekningsområde og produkttekster for det enkelte produkt etter behov. 
    For avanserte brukere anbefaler vi Web Services da man har flere muligheter i spørringen.
</p>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/fraktguideGui.do">Prøv tjenesten!</a>
</p>

<h2>Offline data (nedlastbart og Web Services)</h2>
<p>
    Dette er et ferdig tilrettelagt datagrunnlag for offline bruk. 
    Du oppgir postnummer du sender fra og hvilke produkter du ønsker data for og får (for hvert produkt):
</p>
<ul>
    <li>Prissone og transporttid i virkedager for hvert postnummer</li>
    <li>Priser for hver prissone</li>
</ul>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/offlineData.do">Prøv tjenesten!</a>
</p>
<p>
    <strong>NB!</strong> Med offline datagrunnlag må du selv håndtere alle regler som spesialgods, 
    <a target="_blank" href="http://www.bring.no/324.cms">fraktberegnet vekt (volumvekt)</a>, mm.
    Husk å oppdater datagrunnlaget ved prisendringer!
</p>



                    </div>