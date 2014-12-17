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

<form:form method="post"
		action="${pageContext.request.contextPath}/passwordRecovery.html"
		commandName="form">
		


 <table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
      <jsp:include page="banner.jsp" />
        <tr>
            <td align="center" valign="top">
                <table width="980" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="727" align="center" valign="top">
                            <div id="TabbedPanels1" class="TabbedPanels">
                                <ul class="TabbedPanelsTabGroup">
                                    <li class="TabbedPanelsTab">Password Recovery</li>
                                    <li class="TabbedPanelsTab"><a href="home.html">Home</a></li>
                                </ul>
                                <div class="TabbedPanelsContentGroup">
                                    <div class="TabbedPanelsContent">
                                        <table width="720" height="430"  border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="720" align="left" valign="top">
                                                    <br />
                                                    <table>
                                                        <tr>
                                                            <td style="width:150px;">
                                                                Enter your Email address :
                                                            </td>
                                                            <td style="width:200px;">
                                                                <input name="email" type="text" id="email" style="width:200px;" />
                                                            </td>
                                                            <td> <form:errors path="email" cssClass="errors"/> </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3" align="center">
                                                                <c:if test="${not empty error}">       
            														<div class="errors"> ${error} </div>       
    															</c:if> 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <input type="submit" name="ButtonRecoverPassword" value="Recover My password"  id="ButtonRecoverPassword" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td width="238" align="right" valign="top">
                            <table width="238" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="24">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            
                            <jsp:include page="contactUs.jsp" />
                         
                           
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