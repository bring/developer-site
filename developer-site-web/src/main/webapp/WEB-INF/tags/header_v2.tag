<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="selected_tab" required="true" type="java.lang.String" rtexprvalue="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header role="banner">
    <div class="inner group">

        <div id="logo">

            <a href="http://developer.bring.com">
                <h1>Bring</h1>
            </a>

        </div>

        <nav role="main" id="main-menu">
            <a href="#menu" class="menu"></a>
            <ul class="menu-main">
                <li class="menu-level-1"><a href="http://www.bring.no" class="first">Bring.no</a></li>
                <li class="menu-level-1 <c:out value="${selected_tab == 'developer' ? 'path parent' : ''}"/>"><a
                        href="/index.html">Developer</a></li>
                <li class="menu-level-1 <c:out value="${selected_tab == 'support' ? 'path parent' : ''}"/>"><a
                        href="/support.html">Support</a></li>
            </ul>
        </nav>

    </div>
</header>




