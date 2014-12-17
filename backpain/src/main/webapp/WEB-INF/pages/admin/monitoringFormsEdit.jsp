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
									   <font color="green">${message}</font>
										<tr>
												<td height="40px" align="left" valign="middle" class="tbl_red" colspan="2">
													<strong style="margin-left: 10px; font-size:15px;font-weight:bold;">Monitoring Forms</strong>
												</td>
											</tr>
										<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    															
																<th scope="col" style="border: 1px solid black;border-top-color:#990000" colspan="2">Questions</th>
																
										</tr>
											<!-- Write content here -->
										
										<form:form method="post" action="${contextPath}/admin/${clientId}/monitoringFormsEdit.html" id="criteria">
											<c:set var="index" value="1"/>
											
											
											
											<c:forEach items="${form}" var="question" varStatus="counter">
											
									         <tr id="${currentListVal.code}" style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">

											 <td style="width: 650px;height:40px;border: 1px solid black">${index}-${question.questiontext}</td>
											
											 <td style="width: 50px;height:40px;border: 1px solid black">
											 
											 
											 <c:choose>
											 <c:when test="${listVal[index-1].flag eq 1}">
											 
											  <input type="checkbox" name="status${index}" id="status${index}" value="true" checked></input><br>
											 </c:when>
											 <c:otherwise>
											  <input type="checkbox" name="status${index}" id="status${index}" value="true"></input><br>
											 </c:otherwise>
											 </c:choose>
											
											 
											 <input type="hidden" id="que${index}" name="que${index}" value="${question.id}"></input>
											 
											 </td>
											 </tr>
											 <c:set var="index" value="${index+1}"/>
											</c:forEach> 
											
											<tr>
											<td>
											<input type="submit" id="submitVal" value="Submit"/>
											<a href="/calba/admin/25/monitoringSystem.html">Back To Monitoring System</a>
											
											</td>
											</tr>
										</form:form>
											
											<!--End write content here  -->
											
											
											
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