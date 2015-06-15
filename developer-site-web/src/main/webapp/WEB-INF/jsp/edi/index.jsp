<%@ taglib prefix="booking" tagdir="/WEB-INF/tags/contenttags/booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/> <misc:title value="EDI"/> <misc:css_v2/>
</head>
<body>
<div class="wrapper">
    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="box">
                        <h1>EDI</h1>
                        <p class="preface">EDI (Electronic Data Interchange) muliggjør effektiv kommunikasjon.</p>
                    </div>

                    <div class="box">
                        <h2><a name="implementasjonsguider"></a>Implementasjonsguider</h2>
                        <p class="preface">Siste versjoner av Bring sine Implementasjonsguider</p>

                        <p>Disse sidene blir gradvis utvidet og flere guider vil bli lagt ut fortløpende. Skal det være noe du savner tar du kontakt for support.</p>

                        <p>EDI i Bring og Posten startet på 90-tallet. Det har blitt laget EDI Guider basert på ulike versjoner av EDIFACT og XML. Dette er Iftmin s93a, d97a, BringXML og Posten XML. Pluss dagens versjon som er basert på D04A.</p>

                        <p>
                            <strong>Merk!</strong> Selv om Bring og Posten fortsatt støtter tidligere versjoner vil ikke disse bli oppdatert med endringer i Produkt og tjenester.
                            Alle anbefales derfor å benytte D04A eller XML. Ta kontakt ved spørsmål.
                        </p>

                        <h3>Oversikt over Implementasjonsguider i Bring</h3>

                        <ul>
                            <li><a href="/edi/transportinstruks/">Transporter</a></li>
                            <li><a href="/edi/tolldokumenter/">Tolldokumenter</a></li>
                            <li><a href="/edi/management/">WMS</a></li>
                            <li><a href="/edi/ig-for-efaktura/">Eksempel E-faktura (XML)</a></li>
                            <li><a href="/edi/statuskoder-iftsta/">Statuskoder (IFTSTA)</a></li>
                            <li><a href="/edi/spesifikasjon-transportetikett/">Spesifikasjon transportetikett</a></li>
                        </ul>

                        <p>Her kan du laste ned EDIFACT meldinger som sikrer at din bedrift har støtte for en effektiv informasjonsflyt.</p>

                        <p>Disse kan leveres på en FTP-konto som vi oppretter til deg eller vi kan sende det til Dere via SMTP. Har du spørsmål ta kontakt med EDI SUPPORT</p>

                    </div>

                    <div class="box">
                        <h2><a name="programleverandorer"></a>Programvarehus som leverer EDI løsninger for våre kunder</h2>
                        <p>Med et EDI-program kan dere velge fritt i alle våre pakkeprodukter og tilleggstjenester for både innland og utland. Hver enkelt leverandør må svare på hvilke av Bring sine tjenester de har tilgjengelig. Det kan variere og må tas i vært enkelt kundetilfelle / kundebehov.</p>
                        <table>
                            <tbody>
                            <tr>
                                <th style="text-align: left" nowrap="nowrap">Firmanavn</th>
                                <th style="text-align: left" nowrap="nowrap">Telefon</th>
                                <th style="text-align: left" nowrap="nowrap">E-post</th>
                                <th style="text-align: left" nowrap="nowrap">Web</th>
                                <th style="text-align: left" nowrap="nowrap">Kontor</th>
                            </tr>
                            <tr>
                                <td>Axia</td>
                                <td>69128500</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=firmapost@axia.no" class="external" target="_blank">firmapost@axia.no</a></td>
                                <td><a href="http://www.axiafrakt.no/" class="external">www.axiafrakt.no</a></td>
                                <td>Norge</td>
                            </tr>
                            <tr>
                                <td>EDI Soft</td>
                                <td>23249490</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=salg@edi-soft.no" class="external" target="_blank">salg@edi-soft.no</a></td>
                                <td><a href="http://www.edisoft.no/" class="external">www.edisoft.no</a></td>
                                <td>Norge/Sverige/Danmark</td>
                            </tr>
                            <tr>
                                <td>Pitney Bowes</td>
                                <td>61159000</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=support@edipost.no" class="external" target="_blank">support@edipost.no</a></td>
                                <td><a href="http://www.edipost.no/" class="external">www.edipost.no</a></td>
                                <td>Norge</td>
                            </tr>
                            <tr>
                                <td>Centiro Solutions</td>
                                <td>92466629</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=sales@centiro.com" class="external" target="_blank">sales@centiro.com</a></td>
                                <td><a href="http://www.centiro.com" class="external">www.centiro.com</a></td>
                                <td>Norge/Sverige</td>
                            </tr>
                            <tr>
                                <td>Logistra</td>
                                <td>40002312</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=post@logistra.no" class="external" target="_blank">post@logistra.no</a></td>
                                <td><a href="http://www.logistra.no/cargonizer/" class="external">www.logistra.no</a></td>
                                <td>Norge</td>
                            </tr>
                            <tr>
                                <td>ProTeria</td>
                                <td>45286660</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=salg@proteria.no" class="external" target="_blank">salg@proteria.no</a></td>
                                <td><a href="http://www.proteria.no/" class="external">www.proteria.no</a></td>
                                <td>Norge</td>
                            </tr>
                            <tr>
                                <td>Logtrade</td>
                                <td>+ 46 (0)406307200</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=info@logtrade.se" class="external" target="_blank">info@logtrade.se</a></td>
                                <td><a href="http://www.logtrade.se" class="external">www.logtrade.se</a></td>
                                <td>Sverige</td>
                            </tr>
                            <tr>
                                <td>Unifaun</td>
                                <td>
                                    <div><span style="white-space: nowrap;">+46 (0)31-7253500</span></div>
                                </td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=info@unifaun.se" class="external" target="_blank">info@unifaun.se</a></td>
                                <td><a href="http://www.unifaun.se" class="external">www.unifaun.se</a></td>
                                <td>Norge/Sverige/Danmark</td>
                            </tr>
                            <tr>
                                <td>Transportnett</td>
                                <td>95968000</td>
                                <td><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=post@transportnett.no" class="external" target="_blank">post@transportnett.no</a></td>
                                <td><a href="http://www.transportnett.no" class="external">www.transportnett.no</a></td>
                                <td>Norge</td>
                            </tr>
                            <tr>
                                <td>KSD EDICOM</td>
                                <td>22129770</td>
                                <td>&nbsp; <a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=info@ksdsoftware.com" class="external" target="_blank">info@ksdsoftware.com</a></td>
                                <td>&nbsp; <a href="http://www.ksdsoftware.com/no/" class="external">http://www.ksdsoftware.com/no/</a></td>
                                <td>Norge/Sverige/Danmark</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>
