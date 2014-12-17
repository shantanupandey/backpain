<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<body>

	<form:form method="post" modelAttribute="form"
		action="${pageContext.request.contextPath}/myAccount.html"
		commandName="form">
			
 		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
 		
 			<jsp:include page="banner.jsp" />

				<jsp:include page="userInfo.jsp" />
        
        <tr>
            <td align="center" valign="top">
                <table width="980" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="238" align="left" valign="top">
                        	<jsp:include page="left.jsp" />
                        </td>                        
                        <td width="15">
                            &nbsp;
                        </td>
                        <td width="727" align="left" valign="top">
                            
    <table width="727" border="0" cellpadding="3" cellspacing="0" class="tbl_Grid">
        <tr>
            <td height="25" colspan="2" align="left" valign="middle" class="tbl_red">
                <strong style="margin-left: 10px;">Change Password</strong>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <br />
            </td>
        </tr>
         <tr>
            <td colspan="1" style=" width: 179px;">
                Current Password
            </td>
            <td>
            	<input name="password" type="password" id="password" value="" />       	    
            </td>
        </tr>
        <tr>
            <td colspan="1" style=" width: 179px;">
                New Password
            </td>
            <td>
                <form:password path="newPassward" />                  
            </td>
        </tr>
        <tr>
            <td colspan="1" style=" width: 179px;">
                Confirm New Password
            </td>
            <td>
                <form:password path="confirmPassward" />                
            </td>
        </tr>
         <tr>
            <td colspan="2" >
               <form:errors path="*"  cssClass="errors"/> 
            </td>
        </tr>
        <tr>
            <td style=" width: 179px;">
                <label>
                    &nbsp;<input type="submit" name="submit" value=" Update Details" />
                </label>
            </td>
            <td>
            </td>
        </tr>
    </table>

                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       <jsp:include page="footer.jsp" />
    </table>		
		
		
</form:form>
</body>
</html>