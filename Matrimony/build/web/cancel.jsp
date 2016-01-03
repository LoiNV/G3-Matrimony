<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="headerPaypal.jsp" %> 

	<span class="span4">
	</span>
	<span class="span5">
		<div class="hero-unit">
		   You cancelled the order.
		</div>
	</span>
	<span class="span3">
	</span>
	
<%@ include file="footerPayal.jsp" %> 

<% HttpSession nsession = request.getSession(false);
if(nsession!=null)
	session.invalidate();
%>