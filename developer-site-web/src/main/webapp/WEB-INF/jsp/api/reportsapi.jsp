<%@ taglib prefix="reports" tagdir="/WEB-INF/tags/contenttags/reports" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/>
    <misc:title value="Reports API"/>
    <misc:css_v2/>
<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $.ajax({
      url: 'https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-10001040731/PARCELS-DELIVERED.json/?fromDate=01.08.2014&toDate=01.09.2014',
      type: 'GET',
      dataType: 'JSONP',
      jsonpCallback: 'callback',
      success: function (data) {
              console.log(data);
          },
      beforeSend: setHeader
    });
  });

  function fnsuccesscallback() {
   alert('done');
  }
  function setHeader(xhr) {
    xhr.setRequestHeader('X-MyBring-API-Uid', 'savitad.2007@gmail.com');
    xhr.setRequestHeader('X-MyBring-API-Key', '3c180005-4b9a-42a3-b06e-13cfacab64ba');
  }
</script>

</head>
<body>
<div class="wrapper">
    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Reports API</h1>
                    </div>

                    <div class="box">
                        <h2><a name="introduction"></a>
                        <div id=resp></div>
                            Introduction</h2>
                        <reports:introduction/>
                    </div>

                    <div class="box">
                        <h2><a name="HTU"></a>
                            How to Use</h2>
                        <reports:how_to_use/>
                    </div>

                    <div class="box">
                        <h2><a name="reference"></a>
                            Reference</h2>
                        <reports:reference/>
                    </div>
                </div>

                <div class="span3" id="additional-resources">
                    <div id="sidebar">
                        <sidebar:reports-sidebar/>
                    </div>
                </div>

            </div>
        </section>
    </div>
</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>


</body>
</html>
