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
	<c:set var="pageNumber" scope="request" value="${pageId}" />
	<c:set var="totalPages" scope="request" value="8" />
	<table width="980" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>

			<jsp:include page="adminBanner.jsp" />

			<jsp:include page="adminInfo.jsp" />

			<tr>
				<td align="center" valign="top"><form:form method="post"
						action="${contextPath}/admin/questionListing.html" id="criteria">
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
												<td height="40px" align="left" valign="middle" class="tbl_red">
													<strong style="margin-left: 10px; font-size:15px;font-weight:bold;">History Factors Lookup Table</strong>
												</td>
											</tr>
											

											<tr>
												<td style="width: 123px; height: 420px" valign="top">
													<div>
														<c:set var="count" value="0" scope="page" />
														<table cellspacing="0" cellpadding="4" rules="rows"
															border="1"
															style="color: #333333; height: 95px; width: 725px; border-collapse: collapse;">
															
															<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    
																
																
																<th scope="col" style="border: 1px solid black" colspan="4">Values for Selection by Input</th>
																<th scope="col" style="border: 1px solid black" colspan="8">Output Factors (from Lookup Table, below)</th>
																<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
															</tr>
															
															<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    <th scope="col" style="border: 1px solid black;border-top-color:#990000">Time Since Last Leg/Foot Pain</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Time Since First Low Back Pain Started</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Time Since Current Episode Started or Time Since Last Leg/Foot Pain</th>
																
																<th scope="col" style="border: 1px solid black">Time Since First Leg/Foot Pain</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Acute</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Early</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Early Mid</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Late Mid</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Late</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Recovered</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Chronic</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Consult Doctor</th>
																<th scope="col" style="border: 1px solid black;border-top-color:#990000">Master Update</th>
																
															</tr>
															<!-- start for current list -->
															<c:set var="currentList1strow" value="34"/>
															<c:set var="currentList2ndrow" value="0"/>
															
															<c:forEach items="${currentListVal}" var="currentListVal" varStatus="counter">
															<tr id="${currentListVal.code}" style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
															
															<c:if test="${currentList1strow eq 34}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="34">Current</td>
															<c:set var="currentList1strow" value="${currentList1strow-1}"/>
															</c:if>
															
															<c:if test="${(currentList2ndrow eq 0)}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="7">${currentListVal.first_occurance}</td>
															</c:if>
															
															<c:if test="${(currentList2ndrow eq 7)}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="8">${currentListVal.first_occurance}</td>
															</c:if>
															
															<c:if test="${(currentList2ndrow eq 15)}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="9">${currentListVal.first_occurance}</td>
															</c:if>
															
															<c:if test="${(currentList2ndrow eq 24)}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="10">${currentListVal.first_occurance}</td>
															</c:if>
															
															
															
															
															
															
															
															<c:set var="currentList2ndrow" value="${currentList2ndrow+1}"/>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.last_occurance}</td>
														    <td style="width: 50px;height:40px;border: 1px solid black"></td>
															
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.acute}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.early}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.early_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.late}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.late_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.recovered}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.dd1}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${currentListVal.dd2}</td>
															<td style="width: 50px;"><a	href="${contextPath}/admin/${currentListVal.code}/historyFactor.html"
																			style="display: inline-block; width: 50px;">Edit</a></td>
															</tr>
															</c:forEach>
															
															
															
															<!-- start for Past list -->
															<c:set var="pastList1strow" value="29"/>
															<c:set var="pastList2ndrow" value="0"/>
															
															<c:forEach items="${pastListVal}" var="pastListVal" varStatus="counter">
															<tr id="${pastListVal.code}" style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
															
															<c:if test="${pastList1strow eq 29}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="29">Past Year</td>
															<c:set var="pastList1strow" value="${pastList1strow-1}"/>
															</c:if>
															<c:if test="${pastList2ndrow eq 0}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="7">${pastListVal.first_occurance}</td>
															</c:if>
															
															<c:if test="${pastList2ndrow eq 7}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="7">${pastListVal.first_occurance}</td>
															</c:if>
															
															<c:if test="${pastList2ndrow eq 14}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="7">${pastListVal.first_occurance}</td>
															</c:if>
															
															<c:if test="${pastList2ndrow eq 21}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="8">${pastListVal.first_occurance}</td>
															</c:if>
															
															<c:set var="pastList2ndrow" value="${pastList2ndrow+1}"/>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.last_occurance}</td>
														    <td style="width: 50px;height:40px;border: 1px solid black"></td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.acute}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.early}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.early_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.late}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.late_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.recovered}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.dd1}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${pastListVal.dd2}</td>
															<td style="width: 50px;"><a	href="${contextPath}/admin/${pastListVal.code}/historyFactor.html"
																			style="display: inline-block; width: 50px;">Edit</a></td>
															</tr>
															</c:forEach>
															
															
															<!-- start for 1-2 year list -->
															<c:set var="twoYearList" value="3"/>
															<c:set var="oneTwoYearList2ndrow" value="0"/>
															
															<c:forEach items="${twoYearListVal}" var="twoYearListVal" varStatus="counter">
															<tr id="${twoYearListVal.code}" style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
															
															<c:if test="${twoYearList eq 3}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="3">1-2 year ago</td>
															<c:set var="twoYearList" value="${twoYearList-1}"/>
															</c:if>
															
							
															
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.first_occurance}</td>
															
															
															
															<c:set var="pastList2ndrow" value="${pastList2ndrow+1}"/>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.last_occurance}</td>
														    <td style="width: 50px;height:40px;border: 1px solid black"></td>
															
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.acute}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.early}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.early_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.late}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.late_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.recovered}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.dd1}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${twoYearListVal.dd2}</td>
															<td style="width: 50px;"><a	href="${contextPath}/admin/${twoYearListVal.code}/historyFactor.html"
																			style="display: inline-block; width: 50px;">Edit</a></td>
															</tr>
															</c:forEach>
															
															<!-- start for 3-5 year list -->
															<c:set var="threeYearList" value="2"/>
															<c:set var="threeFiveyearList2ndrow" value="0"/>
															
															<c:forEach items="${threeYearListVal}" var="threeYearListVal" varStatus="counter">
															<tr id="${threeYearListVal.code}" style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
															
															<c:if test="${threeYearList eq 2}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="2">3-5 year ago</td>
															<c:set var="threeYearList" value="${threeYearList-1}"/>
															</c:if>
															
							
															
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.first_occurance}</td>
															
															<c:set var="pastList2ndrow" value="${pastList2ndrow+1}"/>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.last_occurance}</td>
														    <td style="width: 50px;height:40px;border: 1px solid black"></td>
															
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.acute}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.early}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.early_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.late}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.late_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.recovered}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.dd1}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${threeYearListVal.dd2}</td>
															<td style="width: 50px;"><a	href="${contextPath}/admin/${threeYearListVal.code}/historyFactor.html"
																			style="display: inline-block; width: 50px;">Edit</a></td>
															</tr>
															</c:forEach>
															
															
															<!-- start for 5 year list -->
														
														
														    <c:set var="fiveYearList" value="1"/>
															<c:set var="fiveyearList2ndrow" value="0"/>
															
															<c:forEach items="${fiveYearListVal}" var="fiveYearListVal" varStatus="counter">
															
															<tr id="${fiveYearListVal.code}" style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
															
															<c:if test="${fiveYearList eq 1}">
															<td style="width: 50px;height:40px;border: 1px solid black" rowspan="1">>5 year ago</td>
															<c:set var="fiveYearList" value="${fiveYearList-1}"/>
															</c:if>
															
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.first_occurance}</td>
															
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.last_occurance}</td>
														    <td style="width: 50px;height:40px;border: 1px solid black"></td>
															
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.acute}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.early}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.early_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.late}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.late_mid}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.recovered}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.dd1}</td>
															<td style="width: 50px;height:40px;border: 1px solid black">${fiveYearListVal.dd2}</td>
															<td style="width: 50px;"><a	href="${contextPath}/admin/${fiveYearListVal.code}/historyFactor.html"
																			style="display: inline-block; width: 50px;">Edit</a></td>
															</tr>
															</c:forEach>
															
															


														</table>

													</div> <br />
												<br />

												</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						
						<!-- New Format of Table  -->
						
						<!--End New Format of Table -->
						
						
						
					</form:form></td>
			</tr>

			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table>

	<script>
	

function showPage(pageId) {
	$("#pageId").val(pageId);
	$('#criteria').submit();	
}



</script>


</body>
</html>