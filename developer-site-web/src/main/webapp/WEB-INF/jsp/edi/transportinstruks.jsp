<%@ taglib prefix="booking" tagdir="/WEB-INF/tags/contenttags/booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html>

<html>
<head>
  <misc:contenttype/> <misc:title value="Transportinstruks - EDI"/> <misc:css_v2/>
</head>
<body>
<div class="wrapper">
  <misc:header_v2 selected_tab="developer"/>
  <div id="page">
    <section id="content">
      <div class="row-fluid">
        <div class="span12">

          <div class="box">
            <h1>Transportinstruks for IFTMIN 04</h1>
  <div class="editor row push-3">
    <p>Hovedformålet med denne&nbsp;guiden er å være en rettesnor for gjennomføring av Brings fraktinnstruks basert på IFTMIN D04A EDIFACT.
      Oversikten og guiden viser i detalj informasjon om hvordan tjenester og tilleggstjenester skal angis korrekt i Bring sine
      EDI intrukser. Disse tjenestene utvikles kontinuerlig. Dokumentet forutsetter nødvendig kunnskap om EDIFACT.
    </p>
    <p>For andre versjoner (D04A BIG01) kan du kontakte&nbsp;EDI Support.</p>
    <p><strong>Vedlagt kan Brings siste versjon av IFTMIN D04A BIG 14 lastes ned:</strong></p>
    <p><a href="/edi/IG_BIG14_1_5_2015-10-28.pdf">Hoveddokument D04A BIG14</a></p>
    <p><strong>Appendix til nedlasting:</strong></p>
    <p><a href="/edi/BIG14_Appendix_1.pdf">Appendix 1 Locations</a></p>
    <p><a href="/edi/BIG14_Appendix_2.pdf">Appendix 2 Services</a> &nbsp;(Oversikt over tjenester, husk også å lese Appendix2A)
    </p>
    <p><a href="/edi/BIG14_Appendix_2A.pdf">Appendix 2A</a> (English version is comming soon)
    </p>
    <p><a href="/edi/BIG14_Appendix_5.pdf">Appendix 5 Document type</a></p>
    <p><a href="/edi/BIG14_Appendix_6.pdf">Appendix 6 HUB-information</a></p>
    <p><strong>Tilleggsinformasjon&nbsp;for Bring Parcel AB (CarryOn):</strong></p>
    <p><a href="/edi/Appendix_A_2015-10-22_and_2016-01-04.pdf">Appendix A - Bring Parcels products and services from DK, FI, NO, SE and Europe</a></p>
    <p>&nbsp;<a href="/edi/BIG14_BCAP_service_codes.pdf">Tilleggsinformasjon - Service Code 0010 and 0011 to Denmark (BIG14) 1.3</a></p>
  </div>
          </div>

        </div>
      </div>
    </section>
  </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>
