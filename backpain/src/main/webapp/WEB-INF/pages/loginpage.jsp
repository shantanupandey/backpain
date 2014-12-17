<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<script type="text/javascript">
	function showloader(){
		document.getElementById("waitImage").style.display = "block";
		 setTimeout("jQuery('#waitImage').hide();Modalbox.resizeToContent();",8000)
	}
	</script>
<body onload="showloader(); document.forms['hideform'].submit();">
	<form:form method="post" name="hideform"
		action="${pageContext.request.contextPath}/login.html"
		commandName="loginForm">
	<!--  <table hidden border="0" cellspacing="0" cellpadding="0"
			style="width: 248px; margin-left: 5px;">
			<tbody>
				
				<tr>
					<td height="25" colspan="1"
						style="font-family: Calibri; width: 100%; font-size: 14px; padding-top: 15px;">
						User Name</td>
					<td align="right" colspan="2"
						style="padding-top: 15px; padding-right: 5px;"> --><form:input
							path="userId" cssStyle="width:150px;" type="hidden"/><!-- </td>
				</tr>
				<tr>
					<td height="25" colspan="1"
						style="font-family: Calibri; font-size: 14px; padding-top: 15px;">
						Password&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="right" colspan="2"
						style="padding-top: 15px; padding-right: 5px;"> --><form:input
							path="password" cssStyle="width:150px;" type="hidden"/>
							<div  style="display: none;text-align: center;" align="center" id="waitImage">
									      <img title="wait" style="align-self:center;float:none!important;" align="center" src="<%=request.getContextPath()%>/images/spinner.gif" alt="Wait"/>Please wait
									      <br><br><font color="green">You have been registered successfully please check your email.</font></div>
									
							<!-- </td>
				</tr>
				<tr>
					<td colspan="4" align="right"
						style="padding-top: 10px; padding-right: 5px;"><label>
							&nbsp; --><!-- <input type="submit" name="ButtonLogin" value="Log In"
							id="ButtonLogin" /> -->
					<%-- </label></td>
				</tr>
				<c:if test="${not empty message}">
					<tr>
						<td height="25" colspan="4"
							style="font-family: Calibri; font-size: 15px;">
							<div style="color: #4F8A10;">
								<b><font color="red"> ${message} </font></b>
							</div>
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty param.message}">
					<tr>
						<td height="25" colspan="4"
							style="font-family: Calibri; font-size: 14px;">
							<div style="color: #4F8A10;">${param["message"]}</div>
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty error}">
					<tr>
						<td height="25" colspan="4"
							style="font-family: Calibri; font-size: 14px;">
							<div class="errors">${error}</div>
						</td>
					</tr>
				</c:if>
				<tr>
					<td height="25" colspan="4"
						style="font-family: Calibri; font-size: 14px;"><form:errors
							path="userId" cssClass="errors" element="div" /> <form:errors
							path="password" cssClass="errors" element="div" /></td>
				</tr>
				<tr>
					<td height="22" colspan="1"
						style="font-family: Calibri; font-size: 14px; text-align: center;">
						<a id="HyperLink1" href="register.html">New User ?</a>
					</td>
					<!-- <td height="22" colspan="1" style="font-family: Calibri; font-size: 14px; text-align: center;">
                                                    <a id="HyperLink1" href="register.html">New User ?</a>
                                                </td> -->
					<td height="22" colspan="2"
						style="font-family: Calibri; font-size: 14px; text-align: center;">
						<a id="forgotPassword" href="passwordRecovery.html">Forgot
							Password ?</a>
					</td>
				</tr>
			</tbody>
		</table>  --%>
	</form:form>

</body>

</html>