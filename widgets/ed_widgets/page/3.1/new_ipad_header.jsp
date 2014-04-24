<!--START--><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
<!--
<script type="text/javascript">
document.getElementById('loadMsg').innerHTML = "";
</script>
-->


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% if ( !"%%canonicalUrl%%".equals("")) { %> 
<link rel="canonical" href="%%canonicalUrl%%">
<% } %>
<title>%%pageTitle%%</title>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes"/>

<%--
--%>
<jsp:include page="/tooltwist/frameworks/searchHeader-inc.jsp" flush="true" />
<link href="%%URL(tooltwist/wbd/wbd.css)%%" rel="stylesheet" type="text/css">
%%headerCode%%

<script type="text/javascript">
function jmpUrl(url) {
//	alert("jmpUrl("+url+")");
	window.location = url;
	return false;
}
function jmpNavpoint(navpoint) 
{
    //alert("jmpNavpoint("+navpoint+")");
	window.location = "%%URL(n/)%%" + encodeURIComponent(navpoint);
	return false;
}
function jmpProduct(productId,fakeUrl) {
//alert("jmpProduct("+productId+")");
	var url = "%%URL(p/)%%";
	if (fakeUrl && fakeUrl!="")
		url += encodeURIComponent(fakeUrl) + "/";
	url += encodeURIComponent(productId);
//alert("url="+url);
	window.location = url;
	return false;
}
<%
String q = WbdSession.getQuery(jh.getCredentials());
if (q == null || q.equals(""))
	q = "%%staticQuery%%";
String n = WbdSession.getNavpointId(jh.getCredentials());
if (n == null || n.equals(""))
	n = "%%staticNavpointId%%";
String cc = WbdSession.getCategoryFilter(jh.getCredentials());
if (cc == null || cc.equals(""))
	cc = "%%staticCategoryFilter%%";
String cn = WbdSession.getCategoryNameFilter(jh.getCredentials());
if (cn == null || cn.equals(""))
	cn = "%%staticCategoryNameFilter%%";
String man = WbdSession.getManufacturerFilter(jh.getCredentials());
if (man == null || man.equals(""))
	man = "%%staticManufacturerFilter%%";
String sfq = WbdSession.getTemporaryValue(jh.getCredentials(), RoutingUIM.SEARCH_FILTER_QUERY);
if (sfq == null || sfq.equals(""))
	sfq = "%%staticSearchFilterQuery%%";
String prc = WbdSession.getPriceFilter(jh.getCredentials());
if (prc == null || prc.equals(""))
	prc = "%%staticPriceFilter%%";
String dfq = WbdSession.getTemporaryValue(jh.getCredentials(), RoutingUIM.DYNAMIC_FACET_FILTER_QUERY);
if (dfq == null || dfq.equals(""))
	dfq = "%%staticDynamicFilterQuery%%";
String sbq = WbdSession.getTemporaryValue(jh.getCredentials(), RoutingUIM.SORT_BY_QUERY);
if (sbq == null || sbq.equals(""))
	sbq = "%%staticSortByQuery%%";


%>
var wbd_q = "<%=q%>";<%-- query --%>
var wbd_n = "<%=n%>";<%-- navpoint --%>
var wbd_cc = "<%=cc%>";<%-- category codes --%>
var wbd_cn = "<%=cn%>";<%-- category codes --%>
var wbd_man = "<%=man%>";<%-- manufacturers --%>
var wbd_sfq = "<%=sfq%>";<%-- search filter query --%>
var wbd_dfq = "<%=dfq%>";<%-- dynamic facet filter query --%>
var wbd_sbq = "<%=sbq%>";<%-- sort by query --%>
var wbd_prc = "<%=prc%>";<%-- prices --%>
var wbd_x = "";<%-- extra parameters (op, pageNo, etc) --%>
var resetFlag = "";<%-- used to check if user initiated search from the searchBox --%>
function setQ(str) { wbd_q = str; }
function setN(str) { wbd_n = str; }
function setCc(str) { wbd_cc = str; }
function setCn(str) { wbd_cn = str; }
function setMan(str) { wbd_man = str; }
function setSfq(str) { wbd_sfq = str; }
function setPrc(str) { wbd_prc = str; }
function setSbq(str) { wbd_sbq = str; }
function setX(str) { wbd_x = str; }
function resetFlag() { resetFlag = ""; }

function setDfq(str)
{
	wbd_dfq = wbd_dfq +";;;"+ str;
}

function removeDfq(str)
{

	var startIndex = wbd_dfq.indexOf(";;;"+str);
	var lastIndex = wbd_dfq.indexOf(";;;",startIndex+3);

	if (startIndex >=0 && lastIndex == -1)
		lastIndex = wbd_dfq.length; 
	
	var stringToReplace = wbd_dfq.substring(startIndex,lastIndex); 
	wbd_dfq = wbd_dfq.replace(stringToReplace,"");
		
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
	resetFlag = "1";
}
function jmpSrch(qry) {
//alert("jmpSrch("+qry+")");
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
	if (wbd_sbq != "")
		params += "&sbq="+encodeURIComponent(wbd_sbq);  
	if (wbd_x != "")
		params += "&"+wbd_x;<%-- not encoded, because it might contain multiple params --%> 
//alert("params="+params);
	var winLoc = window.location.pathname;
	if (resetFlag=="1") {
		winLoc = "%%URL(s)%%"
	}
	window.location = winLoc + "?rch" + params;
	return false;
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  class="wbd body-production">
%%topCode%%<!--END-->
</body>
</html>
