<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 

<html xmlns="http://www.w3.org/1999/xhtml">

	<!-- HEADER INCLUDE   -->
	<jsp:include page="header.jsp" />

<body>
<h1>hiiiiiiiii</h1>
<%
String transactionId=request.getParameter("txn_id");
System.out.println("check these valuesss....."+transactionId);

%>
</body>
</html>