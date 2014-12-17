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

				<td align="center" valign="top"><form:form method="post"
						action="${contextPath}/admin/userListing.html"
						commandName="criteria">
						<table width="980" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td width="238" align="left" valign="top"><jsp:include
											page="adminLeft.jsp" /></td>
									<td width="15">&nbsp;</td>
									<td width="727" align="left" valign="top">
										<table width="727" border="0" cellpadding="0" cellspacing="0"
											class="tbl_Grid">
											<tr>
												<td height="25" align="left" valign="middle" class="tbl_red">
													<strong style="margin-left: 10px;">User Listing </strong>
												</td>
											</tr>
											<tr>
												<td height="25" width="500" align="right" valign="middle">
													<i>Search For</i>&nbsp;<input type="text" id="search">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sort
														By&nbsp; <form:select path="sortBy"
															cssStyle="height:20px;width:150px;">
															<form:option value="1" label="First Name" />
															<form:option value="3" label="User Name" />
															<form:option value="2" label="Last Name" />
															<form:option value="4" label="City" />
															<form:option value="5"
																label="Registration Date descending" />
															<%-- <form:option value="6" label="Category" /> --%>
														</form:select>
												</td>
											</tr>
											<tr>
												<td style="width: 123px; height: 420px" valign="top"><c:if
														test="${empty result.result}"><span><font color="red" style="padding-left: 280px;">No matches found</font></span>
																	
											
												</c:if> <c:if test="${not empty result.result}">
														<div>
															<table cellspacing="0" cellpadding="4" rules="rows"
																border="1"
																style="color: #333333; height: 95px; width: 718px; border-collapse: collapse;">
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col">User Name</th>
																	<th scope="col">First Name</th>
																	<th scope="col">Last Name</th>
																	<th scope="col">City</th>
																	<th scope="col">Telephone No</th>
																	<th scope="col">Registration Date</th>
																	<th scope="col">Assigned To</th>
																	<th scope="col">View Report</th>
																	<th scope="col">Show Record</th>
																</tr>
																<c:forEach items="${result.result}" var="client"
																	varStatus="counter">
																	<tr
																		style="color:#333333;background-color:${counter.count % 2 == 0 ? '#FFFBD6;' : 'White;' }">

																		<td>${client.userId}</td>
																		<td>${client.foreName}</td>
																		<td>${client.surName}</td>
																		<td>${client.city}</td>
																		<td>${client.phoneNumber}</td>
																		<td><fmt:formatDate type="date"
																				value="${client.createdDate}" /></td>
																		<td><span>Admin</span></td>
																		<c:if test="${client.clientStateId  == 4}">
																			<td style="width: 90px;"><a
																				href="${contextPath}/admin/${client.clientId}/reportList.html?userId=${client.userId}"
																				style="display: inline-block; width: 90px;">View
																					Report</a></td>
																		</c:if>
																		<c:if test="${client.clientStateId  != 4}">
																			<td style="width: 90px;"><a href="javascript:;"
																				style="display: inline-block; width: 90px;">No
																					Data</a></td>
																		</c:if>
																		<td style="width: 90px;"><a
																			href="${contextPath}/admin/${client.clientId}/recordReportList.html"
																			style="display: inline-block; width: 90px;">Show
																				Record</a></td>
																	</tr>
																</c:forEach>

																<tr style="color: #333333; background-color: #FFCC66;"
																	align="right">
																	<td colspan="9"><table>
																			<tbody>
																				<tr>
																					<c:set var="pageNumber" scope="request"
																						value="${result.pageId}" />
																					<c:if test="${pageNumber gt 1}">
																						<td><a
																							href="javascript:showPage(${pageNumber - 1})"
																							style="color: #333333;">Previous</a></td>
																					</c:if>
																					<c:forEach begin="1" end="${result.totalPages}"
																						var="i">
																						<c:choose>
																							<c:when test="${i!=pageNumber}">
																								<td><a href="javascript:showPage(${i})"
																									style="color: #333333;"><c:out value="${i}" /></a></td>
																							</c:when>
																							<c:otherwise>
																								<td><span><c:out value="${i}" /></span></td>
																							</c:otherwise>
																						</c:choose>
																					</c:forEach>

																					<c:if test="${pageNumber lt result.totalPages}">
																						<td><a
																							href="javascript:showPage(${pageNumber + 1})"
																							style="color: #333333;">Next</a></td>
																					</c:if>

																				</tr>
																			</tbody>
																		</table></td>
																</tr>



															</table>

														</div>
													</c:if><br /> <br /> <form:hidden path="pageId" /> <form:hidden
														path="searchValue" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</form:form></td>
			</tr>

			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table>

	<script>


$( document ).ready(function() {
	 $('[name=sortBy]').val(${searchCrieteriaVal});
	 
	});

$(function() {
	
	$("select#sortBy").change(function () {
		$("#pageId").val("1");
		$('#criteria').submit();		
	});	


	
});
$(document).keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
    	$('[name=searchValue]').val($("#search").val());
    	$("#pageId").val("1");
    	$("#searchValue").val($("#search").val());
    	//alert($("#searchValue").val());
    	$('#search').submit();		
    }
});

function showPage(pageId) {
	$("#pageId").val(pageId);
	$('#criteria').submit();	
}



</script>


</body>
</html>