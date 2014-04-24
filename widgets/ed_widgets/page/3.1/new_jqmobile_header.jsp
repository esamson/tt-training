<!--START--><!DOCTYPE html>
<!-- page:new_jqmobile_header.jsp --> 
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
<%
	String jspName = "searchPage";
	JspHelper jh = JspHelper.getJspHelper(pageContext, jspName);
%%preFetchCode%%
%>
<html> 
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="generator" content="ToolTwist" />
	<meta name="viewport" content="height=device-height,width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" /> 
	<meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
	<meta name="apple-mobile-web-app-capable" content="yes" />
<% if ( !"%%canonicalUrl%%".equals("")) { %> 
	<link rel="canonical" href="%%canonicalUrl%%">
<% } %>
	<title>%%pageTitle%%</title>
%%headerCode%%
	<!-- 
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a3.min.css" />
	<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a3.min.js"></script>
	 -->
	<link rel="stylesheet" href="/ttsvr/tooltwist/frameworks/jquery.mobile-1.0a3/jquery.mobile-1.0a3.css" />
	<script src="/ttsvr/tooltwist/frameworks/jquery-1.4.3/jquery-1.4.3.min.js"></script>
	<script src="/ttsvr/tenam/scripts/tenam-pre-jquerymobile.js"></script><!-- This must be placed before jquery.mobile -->
	<script src="/ttsvr/tooltwist/frameworks/jquery.mobile-1.0a3/jquery.mobile-1.0a3.min.js"></script>
	
<!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZ START -->
	<script src="/ttsvr/tenam/scripts/tenam.js"></script>
<!-- 
	
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<script src="http://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key=ABQIAAAAjU0EJWnWPMv7oQ-jjS7dYxQ82LsCgTSsdpNEnBsExtoeJv4cdBSUkiLH6ntmAr_5O4EfjDwOa0oZBQ" type="text/javascript"></script>
 -->

<!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZ END -->
</head> 
<body> 
%%topCode%%
<div tooltwist-page-widget="%%pageWidget%%" tooltwist-navpoint-id="%%navpointId%%" data-role="page" data-theme="%%theme%%">
<!--END-->	<div data-role="header">
		<h1>Page Title</h1>
	</div><!-- /header -->

	<div data-role="content">	
		<p>Page content goes here.</p>		
	</div><!-- /content -->

	<div data-role="footer">
		<h4>Page Footer</h4>
	</div><!-- /header -->
</div><!-- /page -->
</body>
</html>