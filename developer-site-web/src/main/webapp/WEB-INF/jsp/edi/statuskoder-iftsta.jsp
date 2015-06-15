<%@ taglib prefix="booking" tagdir="/WEB-INF/tags/contenttags/booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/> <misc:title value="Statuskoder (IFTSTA) - EDI"/> <misc:css_v2/>
</head>
<body>
<div class="wrapper">
    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="box">
                        <h1>Statuskoder (IFTSTA)</h1>
    <p class="preface">Her kan du laste ned spesifikasjoner</p>
    <div class="editor row push-3">
        <p>Disse sidene blir gradvis utvidet og flere guider vil bli lagt ut fortløpende. Skal det være noe du savner tar du kontakt
            for support.<br>Vi tilbyr levering på FTP eller smtp. Ta kontakt med oss før du bestemmer deg for metode og integrasjon.
        </p>
        <table>
            <tbody>
            <tr>
                <th style="text-align: left" nowrap="nowrap">Selskap</th>
                <th style="text-align: left" nowrap="nowrap">Fil for nedlasting</th>
            </tr>
            <tr>
                <td>Bring Norge Pakker (IFTSTA D96A)</td>
                <td><a href="/edi/statuskoder_D96A.pdf">Statuskoder</a></td>
            </tr>
            <tr>
                <td>Bring Norge Stykk/Parti og Pakker, Bring Express Norge, Sverige og Danmark&nbsp;(IFTSTA D04A)</td>
                <td><a href="/edi/statuskoder_D04A.pdf">Statuskoder</a></td>
            </tr>
            <tr>
                <td>Bring Parcels AB (CarryOn)</td>
                <td><a href="/edi/statuskoder_D94A.pdf">Statuskoder</a></td>
            </tr>
            </tbody>
        </table>
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
