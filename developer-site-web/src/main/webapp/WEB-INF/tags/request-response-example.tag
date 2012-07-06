<%-- Dette er ingen ordentlig tag! Dette brukes som en mal som kan kopieres inn i andre jsp-sider --%>

<div class="row-fluid">
    <div class="box">


        <div class="row element-sample">
            <ul class="tab-group minimal" data-tabs="tabs">
                <li class="active"><a href="#tab1">XML</a></li>
                <li><a href="#tab2">JSON</a></li>
            </ul>
            <div class="tab-content tab-minimal">

                <div class="tab-pane active" id="tab1">
                    <div data-tab="xml" class="tab api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407"
                           data-internal="/proxy/shipping-guide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">
                            /all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407
                        </a>
                        <pre class="code-box xml response delay-snippet"></pre>
                    </div>
                </div>

                <div class="tab-pane active" id="tab2">
                    <div data-tab="json" class="tab api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/all.json?weightInGrams=1500&amp;from=7600&amp;to=1407"
                           data-internal="/proxy/shipping-guide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">
                            /all.json?weightInGrams=1500&amp;from=7600&amp;to=1407
                        </a>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>

                <div class="tab-pane" id="tab3">
                    <pre class="code-box json response delay-snippet"><%--Legg inn ev. JAVA-kode  her--%></pre>
                </div>

            </div>
        </div>
    </div>
</div>

