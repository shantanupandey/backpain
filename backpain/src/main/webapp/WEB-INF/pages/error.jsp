<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%!  Logger logger = Logger .getLogger(this.getClass());
%>
<% logger.error("error.jsp : " , exception); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<!-- HEADER INCLUDE   -->
	<jsp:include page="header.jsp" />


<body>
    
    <table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
        <tbody>
        
        <!-- BANNER INCLUDE  -->
        <jsp:include page="banner.jsp" />
        
       
        
        <tr>
            <td>       
            	<div style="color:red;"> <h2> Sorry! Internal Server Error</h2>            	
            	</div>    			 
            </td>
        </tr>
            <tr>
            <td>      
            	<div>
            		The server encountered an internal error and was unable to complete your request.
					Please contact the server administrator.
            	</div>  
            </td>
        </tr>
        
         <tr><td height="300px"><div></div></td></tr>      


   		<jsp:include page="footer.jsp" />
   		</tbody>
    </table>	
</body>
</html>