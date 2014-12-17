<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="adminHeader.jsp" />
 
<body>

	<table width="980" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>

			<jsp:include page="adminBanner.jsp" />

			<jsp:include page="adminInfo.jsp" />

			<tr>
				<td align="center" valign="top">
					<table width="980" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="238" align="left" valign="top"><jsp:include
										page="adminLeft.jsp" /></td>
								<td width="15">&nbsp;</td>
								<td width="727" align="left" valign="top">
									<table width="727" border="0" cellpadding="0" cellspacing="0" class="tbl_Grid">
										
										<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    															
																<th scope="col" style="border: 1px solid black;border-top-color:#990000" colspan="2">Disability System</th>
																
										</tr>
										
										   <c:set var="clientId" value="${questionId}"/>
										   										
										
											<!-- Write content here -->
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<tr><td colspan="2" align="center" style="width: 86px;"><b>User Name :</b>&nbsp;&nbsp;${userId}	</td></tr>
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<input type="hidden" value="${userId}" id="user"/>									
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<tr>
											<td colspan="2" align="middle">
											<input type="button" value="assign" align="middle" onclick="assignDisabilityForm();"/>
											</td>
											
											</tr>
											
											<!--End write content here  -->
											
											
											
										</tr>
									</table>
									<table>
									<tr><div  style="display: none;text-align: center;" align="center" id="waitImage">
									      <img title="wait" style="align-self:center;float:none!important;" align="center" src="<%=request.getContextPath()%>/images/spinner.gif" alt="Wait"/><font color="green">Please wait</font></div></tr>
									<tr><div id="message" style="display:none" align="center"><font color="green" size="3px">Updated Successfully.</font></div></tr>
								    </table>
								   <table>
								           
											<tr>
											<td>
											<a href="${contextPath}/admin/${clientId}/disabilityReport.html?userId=${userId}">Disability Report</a>
											</td>
											</tr>
									</table>
											
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table></table>

</body>
</html>