<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="${contextPath}/js/lib/jquery.js" type="text/javascript"></script>
	<!-- HEADER INCLUDE   -->
	<jsp:include page="header.jsp" />
<%
String path = request.getContextPath ();

String basePath = request.getScheme () + "://" + request . getServerName () + ":" + request.getServerPort () + path + "/";
System.out.println("basePath=="+basePath);

%>
<body onload="document.forms['paypalForm'].submit();"> 

 <form action="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=628NQ8AHYY2XC" name="paypalForm" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick" />
<!-- <input type="hidden" name="hosted_button_id" value="JTFDPZ53HYSTA" /> 
<input type="hidden" name="hosted_button_id" value="4LEQKMUZ97W4L" />
<input type="hidden" name="rm" value="1" />-->
<input type="hidden" name="tx" value="TransactionID" />
 <input type="hidden" name="cancel_return" value="<%=basePath%>register.html" />
 <input type="hidden" name="return" value="<%=basePath%>payment.html?form=${form}" /> 
 <input type="hidden" name="cert_id" value="API Singature" />  
 
 
<%-- <form name="paypalForm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
 <input type="hidden" name="cmd" value="_xclick" />
 <input type="hidden" name="business" value="monro.robin11@gmail.com" />
 <input type="hidden" name="password" value="drop7tile!"/>
 <input type="hidden" name="custom" value="1123" />
 <input type="hidden" name="item_name" value="Computer-Laptop" />
 <input type="hidden" name="amount" value="10"/>
 <!--<input type="hidden" name="rm" value="1" />  -->
 <input type="hidden" name="tx" value="TransactionID">
 <input type="hidden" name="cancel_return" value="<%=basePath%>register.html" />
 <input type="hidden" name="return" value="<%=basePath%>payment.html?form=${form}" />
 <input type="hidden" name="cert_id" value="API Singature" />

 
</form> 
 --%>



</body>
</html> 