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


			<!-- end test -->
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
												<td height="40px" align="left" valign="middle"
													class="tbl_red"><strong
													style="margin-left: 10px; font-size: 15px; font-weight: bold;">
														${report.name} (Question Listing) </strong></td>
											</tr>
											<tbody>
												<tr>
													<td class="tbl_red" align="left" height="25"
														valign="middle"><strong style="margin-left: 10px;">Record
															List</strong></td>
												</tr>
												<tr>
													<td style="height: 195px" valign="top"><br />
														<table width="100%">
															<tbody>
																<tr>
																	<td>
																		<fieldset>
																			<table>
																				<tbody>
																					<tr>
																						<td width="100px"><b>Full Name :</b></td>
																						<td><span>${client.foreName}
																								${client.surName}</span></td>
																					</tr>
																					<tr>
																						<td><b>User Name :</b></td>
																						<td><span>${client.userId}</span></td>
																					</tr>
																					<tr>
																						<td><b>City :</b></td>
																						<td><span>${client.city}</span></td>
																					</tr>
																				</tbody>
																			</table>
																		</fieldset>


																	</td>
																</tr>
																<tr>
																	<td><br />
																		<fieldset>
																			<table width="100%">
																				<tbody>
																					<tr>
																						<td align="right"><input type="button"
																							onclick="window.location='${contextPath}/admin/${client.clientId}/reportList.html';"
																							style="width: 157px;" id="reportList"
																							value="Go to Report Listing" /></td>
																					</tr>
																				</tbody>
																			</table>
																		</fieldset></td>
																</tr>
															</tbody>
														</table> <br /></td>
												</tr>







												<tr>
													<td style="width: 123px; height: 420px" valign="top">
														<div>
															<c:set var="count" value="0" scope="page" />
															<table cellspacing="0" cellpadding="4" rules="rows"
																border="1"
																style="color: #333333; height: 95px; width: 718px; border-collapse: collapse;">
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col">Site</th>
																	<th scope="col">Pain Type</th>
																	<!-- <th scope="col" style="width: 75px;">Min. Score</th> -->

																	<th scope="col" style="width: 75px;">Score</th>

																	<th scope="col" style="width: 75px;">Imported Data
																		Score</th>

																	<th scope="col" style="width: 50px;">Min possible
																		score</th>
																	<th scope="col" style="width: 50px;">Max possible
																		score</th>

																</tr>


																<tr>
																	<td colspan="7" class="tbl_red"><span
																		style="display: inline-block; width: 50%"><font><b>LOOKUP
																					TABLE FOR NON-SPECIFIC SYMPTOMS & SIGNS</b></font></span></td>

																</tr>

																<c:set var="maxPossibleScore" value="0" />
																<c:set var="minPossibleScore" value="0" />
																<c:set var="importedDataScore" value="0" />

																<c:forEach items="${report.questionGroups}"
																	var="questionGroup" varStatus="counter">

																	<c:set var="maximumValue" value="" />
																	<c:set var="minimumValue" value="" />
																	<c:set var="scoreVal" value="" />


																	<!-- Test -->


																	<c:forEach items="${questionGroup.description}"
																		var="forMin" varStatus="counter">


																		<c:if test="${reportId ne 3}">
																			<c:forEach items="${questionGroup.questions}"
																				var="list" varStatus="minValue" begin="1" end="1">



																				<c:set var="maxValue" value="${list.maxScore}" />
																				<c:set var="minValue" value="${list.maxScore}" />
																				<c:set var="counting" value="0" />
																				<c:set var="countingCompare" value="0" />


																				<c:forEach items="${questionGroup.questions}"
																					var="minimumVal" varStatus="counter">

																					<c:forEach var="clientScore" items="${clientScore}">



																						<c:if
																							test="${minimumVal.questionId == clientScore.key}">

																							<%--  key-> ${clientScore} --%>

																							<%-- 							                                         	<span style="display:inline-block;width:150px;">Score is ${clientScore.value}</span>
 --%>
																							<c:set var="scoreVal"
																								value="${clientScore.value}" />

																						</c:if>
																					</c:forEach>




																					<c:if test="${minimumVal.parentEntityId ne null}">

																						<c:set var="counting" value="${counting + 1}" />
																						<c:set var="countingCompare"
																							value="${countingCompare + 1}" />

																						<%--  min--${minValue}  max--${minimumVal.maxScore}  --%>
																						<c:if test="${maxValue < minimumVal.maxScore}">

																							<c:set var="smaxValue"
																								value="${minimumVal.maxScore}" />
																							<c:set var="maxValue"
																								value="${minimumVal.maxScore}" />
																						</c:if>

																						<c:if test="${minValue > minimumVal.maxScore}">

																							<c:set var="smaxValue"
																								value="${minimumVal.maxScore}" />
																							<c:set var="minValue"
																								value="${minimumVal.maxScore}" />
																						</c:if>

																					</c:if>

																				</c:forEach>
																				<%-- maxValue--${maxValue} 
																	  minValue--${minValue} --%>


																				<c:set var="minimumValue" value="${minValue}" />
																				<c:set var="maximumValue" value="${maxValue}" />


																				<c:set var="maxValue" value="${list.maxScore}" />
																			</c:forEach>
																		</c:if>

																		<!-- For Pain Report -->
																		<c:if test="${reportId eq 3}">
																			<c:forEach items="${questionGroup.questions}"
																				var="list" varStatus="minValue" begin="2" end="2">



																				<c:set var="maxValue" value="${list.maxScore}" />
																				<c:set var="minValue" value="${list.maxScore}" />
																				<c:set var="counting" value="0" />
																				<c:set var="countingCompare" value="0" />


																				<c:forEach items="${questionGroup.questions}"
																					var="minimumVal" varStatus="counter">


																					<c:if test="${minimumVal.parentEntityId ne null}">

																						<c:set var="counting" value="${counting + 1}" />
																						<c:set var="countingCompare"
																							value="${countingCompare + 1}" />

																						<%--  min--${minValue}  max--${minimumVal.maxScore}  --%>
																						<c:if test="${maxValue < minimumVal.maxScore}">

																							<c:set var="smaxValue"
																								value="${minimumVal.maxScore}" />
																							<c:set var="maxValue"
																								value="${minimumVal.maxScore}" />
																						</c:if>

																						<c:if test="${minValue > minimumVal.maxScore}">

																							<c:set var="smaxValue"
																								value="${minimumVal.maxScore}" />
																							<c:set var="minValue"
																								value="${minimumVal.maxScore}" />
																						</c:if>

																					</c:if>

																				</c:forEach>
																				<%-- maxValue--${maxValue} 
																	  minValue--${minValue} --%>
																				<c:set var="minimumValue" value="${minValue}" />
																				<c:set var="maximumValue" value="${maxValue}" />

																				<c:set var="maxValue" value="${list.maxScore}" />
																			</c:forEach>
																		</c:if>


																	</c:forEach>
																	<!--End test  -->

																	<%-- ${counting} --%>

																	<c:forEach items="${questionGroup.questions}"
																		var="question" varStatus="counter">

																		<c:forEach var="clientAnswer" items="${clientAnswer}">

																			<c:if
																				test="${question.questionId == clientAnswer.value}">
																				<c:set var="qId" value="${clientAnswer.value}" />
																			</c:if>
																		</c:forEach>

																		<c:if test="${question.parentEntityId ne null}">


																			<tr
																				style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;'};border: 1px solid black;">

																				<c:if test="${counting eq countingCompare}">
																					<td style="border: 1px solid black;"
																						bgcolor="#990000" rowspan="${counting}">

																						<div class='rotate'>
																							<font color="white">${questionGroup.description}</font>
																						</div>
																					</td>
																				</c:if>


																				<td>${question.questionText}</td>

																				<c:choose>

																					<c:when
																						test="${question.questionId eq qId && question.maxScore eq scoreVal}">

																						<td style="width: 75px; border: 1px solid black;"><u
																							style="color: red">${question.maxScore}</u></td>
																					</c:when>

																					<c:otherwise>
																						<td style="width: 75px; border: 1px solid black;">${question.maxScore}</td>
																					</c:otherwise>
																				</c:choose>

																				<c:if test="${counting eq countingCompare}">
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color: red">${scoreVal}</u></td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${minimumValue}</td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${maximumValue}</td>
																					<c:set var="counting" value="${counting - 1}" />

																					<c:set var="importedDataScore"
																						value="${scoreVal + importedDataScore}" />
																					<c:set var="minPossibleScore"
																						value="${minimumValue + minPossibleScore}" />
																					<c:set var="maxPossibleScore"
																						value="${maximumValue + maxPossibleScore}" />


																				</c:if>


																			</tr>
																		</c:if>
																	</c:forEach>

																</c:forEach>

																<!-- <td style="border:1px solid black;">SUM OF SCORES </td>
                                                            <td colspan="2" style="border:1px solid black;"></td>
                                                          
                                                            <td style="border:1px solid black;"></td>
                                                            <td style="border:1px solid black;"></td> -->

																<tr>
																	<td style="border: 1px solid black;">SUM OF SCORES
																	</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;">${importedDataScore}</td>

																	<td style="border: 1px solid black;">${minPossibleScore}</td>
																	<td style="border: 1px solid black;">${maxPossibleScore}</td>
																</tr>

																<tr>
																	<td style="border: 1px solid black;">Normalised
																		Score</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"><fmt:formatNumber
																			maxFractionDigits="1"
																			value="${importedDataScore div maxPossibleScore *10}"
																			type="number" /></td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																</tr>
															</table>

														</div> <br /> <br />

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