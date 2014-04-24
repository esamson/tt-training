<!--START-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8"%>
<%@page errorPage="../tooltwist/basic/error.jsp"%>
<%@page import="java.text.DateFormat"%>
<%@page import="tooltwist.misc.DateUtils"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>

<%@page import="java.io.FileReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Properties"%>

<%@page import="com.dinaa.data.XData"%>
<%@page import="com.dinaa.ui.UimData"%>
<%@page import="com.dinaa.xpc.XpcSecurity"%>

<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%@page import="tooltwist.wbd.SnippetParam"%>
<%@page import="tooltwist.wbd.WbdException"%>
<%@page import="tooltwist.wbd.WbdRadioTextProperty"%>
<%@page import="tooltwist.wbd.WbdRenderHelper"%>
<%@page import="tooltwist.wbd.WbdSizeInfo"%>
<%@page import="tooltwist.wbd.WbdStringProperty"%>
<%@page import="tooltwist.wbd.WbdSession"%>
<%@page import="tooltwist.wbd.WbdProductionHelper"%>
<%@page import="tooltwist.wbd.WbdCache"%>
%%importCode%% 
<%--
<script type="text/javascript">
document.write('<div id="loadMsg" style="font: 16px arial"><br>&nbsp;&nbsp;&nbsp;&nbsp;loading...<br></div>');
</script>
--%>    
<%
        String jspName = "searchPage";
        JspHelper jh = JspHelper.getJspHelper(pageContext, jspName);
%%preFetchCode%%
%>              
        
        
        
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="%%descriptionMetatag%%">
<meta name="keywords" content="%%keywordMetatag%%">
<% if ( !"%%canonicalUrl%%".equals("")) { %> 
<link rel="canonical" href="%%canonicalUrl%%">
<% } %>
<title>%%pageTitle%%</title>
        
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="/ttsvr/tooltwist/frameworks/ciui-0.3/CiUI.css" />
<script src="%%URL(tooltwist/frameworks/ciui-0.3/CiUI.js)%%" type="text/javascript"></script>
<!-- Prototype Jsp Header -->
<script src="%%URL(tooltwist/frameworks/prototype-min-1.6.0.2/p-min.js)%%" type="text/javascript"></script>

<link href="%%URL(tooltwist/wbd/wbd.css)%%" rel="stylesheet" type="text/css">
%%headerCode%%

<script type="text/javascript">
function jmpUrl(url) {
        window.location = encodeURI(url);
        return false;
}
function jmpNavpoint(navpoint)
{
        window.location = "/ttsvr/n/" + encodeURIComponent(navpoint);
        return false;
}
function jmpProduct(productId,seoBooster) {
        var url = "/ttsvr/p/";
        if (seoBooster && seoBooster!="")
                url += encodeURIComponent(seoBooster) + "/";
        url += encodeURIComponent(productId);
        window.location = url;
        return false;
}

function resetSrch(qry)
{
//alert("resetSrch("+qry+")");
        wbd_q = "";
        wbd_n = "";
        wbd_cc = "";
        wbd_cn = "";
        wbd_man = "";
        wbd_prc = "";
        wbd_x = "";
        wbd_sfq = "";
        wbd_dfq = "";
        wbd_sbq = "";
        wbd_pfq = "";
        resetFlag = "1";
}

function jmpSrchFromHeader(qry)
{
        if (qry && qry!="" && qry!="Search MacMall")
                return jmpSrch(qry)
        else
                return false;
}


function jmpSrch(qry) {
        if (qry && qry!="" && qry!="Search MacMall")
                wbd_q = qry;

        var params = "";
        if (wbd_q != "")
                params +="&q="+encodeURIComponent(wbd_q);
        if (wbd_n != "")
                params +="&n="+encodeURIComponent(wbd_n);
        if (wbd_cc != "")
                params += "&cc="+encodeURIComponent(wbd_cc);
        if (wbd_cn != "")
                params += "&cn="+encodeURIComponent(wbd_cn);
        if (wbd_man != "")
                params += "&man="+encodeURIComponent(wbd_man);
        if (wbd_prc != "")
                params += "&prc="+encodeURIComponent(wbd_prc);
        if (wbd_sfq != "")
                params += "&sfq="+encodeURIComponent(wbd_sfq);
        if (wbd_dfq != "")
                params += "&dfq="+encodeURIComponent(wbd_dfq);
        if (wbd_pfq != "")
                params += "&pfq="+encodeURIComponent(wbd_pfq);
        if (wbd_sbq != "")
                params += "&sbq="+encodeURIComponent(wbd_sbq);
        if ($('removedProdDesc') && $('removedProdDesc').checked)
                params += "&removedProdDesc=true";
        if ($('shipOnlyFilter') && $('shipOnlyFilter').checked)
                params += "&shipOnlyFilter=true";
        if ($('removedLicenseFilter') && $('removedLicenseFilter').checked)
                params += "&removedLicenseFilter=true";
        if ($('licenseOnlyFilter') && $('licenseOnlyFilter').checked)
                params += "&licenseOnlyFilter=true";

        if ($('includeImage') && !$('includeImage').checked)
                params += "&includeImage=false";
        else
                params += "&includeImage=true";

        if ($('refurbishedCondition') && $('refurbishedCondition').checked)
                params += "&refurbishedCondition=true";
        if ($('openBoxCondition') && $('openBoxCondition').checked)
                params += "&openBoxCondition=true";
        if ($('clearanceCondition') && $('clearanceCondition').checked)
                params += "&clearanceCondition=true";

        if (wbd_x != "")
                params += "&"+wbd_x;<!-- not encoded, because it might contain multiple params -->
        var winLoc = window.location.pathname;
        if (resetFlag=="1") {
                winLoc = "/ttsvr/s"
        }
        window.location = winLoc + "?rch" + params;
        return false;
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  class="wbd body-production">
    <!-- <div id="iphone_header">

        <div id="iphone_backbutton">
            <img src="/ttsvr/tooltwist/frameworks/ciui-0.3/images/back-button-tip.png" border="0" align="left" />
            <a id="iphone_backbutton_text" href="#" class="go_back">Back</a>
        </div>
        <div id="iphone_title"></div>
        </div>-->

        <div id="iphone_body" style="clear:both;"><!-- THE ENDING TAG OF THIS DIV IS IN THE FOOTER PART -->
<%--
                <ul class="menu">
                        <li><a href="form.php?demo=1" class="go_forward" title="Form Demo 1">Form Demo 1</a></li>
                        <li><a href="form.php?demo=2" class="go_forward" title="Form Demo 2">Form Demo 2</a></li>
                        <li><a href="page.php?page=1" class="go_forward" title="Item 1">Item 1</a></li>
                        <li><a href="page.php?page=2" class="go_forward cache" title="Item 2">Item 2 (cached)</a></li>
                        <li><a href="page.php?page=3" class="go_forward" title="Item 3">Item 3</a></li>
                        <li><a href="page.php?page=4" class="go_forward" title="Item 4">Item 4</a></li>
                        <li><a href="page.php?page=5" class="go_forward" title="Item 5">Item 5</a></li>
                </ul>
                <br style="clear:both"/>
--%>





%%topCode%%<!--END-->
</body>
</html>

