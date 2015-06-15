<%@ taglib prefix="booking" tagdir="/WEB-INF/tags/contenttags/booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/> <misc:title value="Spesifikasjon transportetikett - EDI"/> <misc:css_v2/>
</head>
<body>
<div class="wrapper">
    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="box">
                        <h1>Spesifikasjon transportetikett</h1>
                        <table>
                            <tbody>
                            <tr>
                                <th style="text-align: left" nowrap="nowrap">Selskap</th>
                                <th style="text-align: left" nowrap="nowrap">Fil for nedlasting</th>
                            </tr>
                            <tr>
                                <td>Bring Pakker, Bring Cargo AS, Bring Cargo Inrikes AB, Bring Cargo International AB</td>
                                <td><a href="/edi/labelspec_1.pdf">Last ned fil</a></td>
                            </tr>
                            <tr>
                                <td>Bring Parcels AB (CarryOn)</td>
                                <td><a href="/edi/labelspec_2.pdf">Last ned fil</a></td>
                            </tr>
                            <tr>
                                <td>Bring Parcels AB (CarryOn) Label description - Appendix E</td>
                                <td><a href="/edi/labelspec_3.pdf">Last ned fil</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <p>Skulle du ha behov for logo til etiketten kan du laste ned den her<br><br><a href="/edi/Logo_Bring_etikett.zip">Logo_etikett (Svart-hvitt)</a></p>
                    </div>

                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>
