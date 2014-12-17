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
																	<th scope="col" style="width: 57px;">Site</th>
																	<th scope="col" style="width: 243px;">Pain Type</th>
																	<!-- <th scope="col" style="width: 75px;">Min. Score</th> -->
																	<th scope="col" style="width: 75px;">Score</th>

																	<th scope="col" style="width: 75px;">Left Imported
																		Data Score</th>
																	<th scope="col" style="width: 75px;">Right
																		Imported Data Score</th>

																	<th scope="col" style="width: 50px;">Min possible
																		score</th>
																	<th scope="col" style="width: 50px;">Max possible
																		score</th>

																</tr>

																<tr>
																	<td colspan="7" class="tbl_red"><span
																		style="display: inline-block; width: 50%"><font><b>RADICULAR
																				PAIN SCORES AT L3-S1</b></font></span></td>

																</tr>


																<!-- Start table d1 -->

																<c:set var="maxPossibleScore" value="0" />
																<c:set var="minPossibleScore" value="0" />
																<c:set var="leftImportedDataScore" value="0" />
																<c:set var="rightImportedDataScore" value="0" />

																<c:forEach items="${report.questionGroups}"
																	var="questionGroup" varStatus="counter" begin="${4}"
																	end="${9}">

																	<c:set var="maximumValue" value="" />
																	<c:set var="minimumValue" value="" />
																	<c:set var="scoreVal" value="" />
																	<c:set var="scoreVal1" value="" />
																	<c:set var="flag" value="true" />


																	<!-- Test -->


																	<c:forEach items="${questionGroup.description}"
																		var="forMin" varStatus="counter">


																		<c:if test="${reportId ne 3}">
																			<c:forEach items="${questionGroup.questions}"
																				var="list" varStatus="minValue" begin="2" end="2">



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
																							<c:set var="scoreVal1"
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


																	</c:forEach>
																	<!--End test  -->

																	<%-- ${counting} --%>



																	<c:forEach items="${questionGroup.questions}"
																		var="question" varStatus="counter">

																		<c:forEach var="clientScore" items="${clientScore}">
																			<c:if
																				test="${question.questionId == clientScore.key}">


																				<c:choose>
																					<c:when test="${flag eq true}">
																						<c:set var="scoreVal" value="${clientScore.value}" />
																						
																						<c:set var="flag" value="false" />
																						
																						
																					</c:when>
																					<c:otherwise>
																						<c:set var="scoreVal1"
																							value="${clientScore.value}" />
																							
																							
																							
																						<c:set var="flag" value="true" />
																					</c:otherwise>
																				</c:choose>


																			</c:if>

																		</c:forEach>
																		
																		  <c:forEach var="clientAnswer" items="${clientAnswer}">
                                                                              
																			<c:if test="${question.questionId == clientAnswer.value}">

																				<%--  key12-> ${clientAnswer.key} --%>
																				 <c:set var="qId" value="${clientAnswer.value}" />
																				 
																			</c:if>
																		   </c:forEach>

																		<c:if test="${question.parentEntityId ne null}">





																			<tr
																				style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">

																				<c:if test="${counting eq countingCompare}">

																					<td style="border: 1px solid black;"
																						bgcolor="#990000" rowspan="${counting}">
																						
																						<div class='rotate'><font color="white">${questionGroup.description}</font></div></td>


																				</c:if>


																				<td>${question.questionText}</td>
																				
																				
																				<!--  strt-->
																				
																				
																		
																				<!--  end strt-->
																				
																				

																				<%-- <td style="width: 50px;">${question.minScore}</td> --%>

																				<%-- 	<c:set var="minValue" value="0"/>
																		<c:set var="score" value="${question.maxScore}"></c:set> --%>


																				<%-- <c:if test="${score > minValue}">
																			
																		<c:set var="mnValue" value="${score}"/>
																		
																		</c:if>
																		
																		<c:out value="${mnValue}"></c:out> --%>

                                                                                <%-- <c:if test="${question.maxScore eq scoreVal1}">
                                                                               <td style="width: 75px; border: 1px solid black;"><u style="color:red">${question.maxScore}</u></td>
                                                                                </c:if>
                                                                                  <c:if test="${question.maxScore ne scoreVal1}">
                                                                                <td style="width: 75px; border: 1px solid black;">${question.maxScore}</td>
                                                                                </c:if> --%>
                                                                            
                                                                            
                                                                            <c:choose>
                                                                            
                                                                                <c:when test="${question.questionId eq qId && question.maxScore eq scoreVal}">
                                                                                 
                                                                                   <td style="width: 75px; border: 1px solid black;"><b><u style="color:red">${question.maxScore}</u></b></td>
                                                                                </c:when>
                                                                                <c:when test="${question.questionId eq qId && question.maxScore eq scoreVal1}">
                                                                                 
                                                                                   <td style="width: 75px; border: 1px solid black;"><b><u style="color:green">${question.maxScore}</u></b></td>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                 <td style="width: 75px; border: 1px solid black;">${question.maxScore}</td>
                                                                                </c:otherwise>
                                                                              </c:choose> 
																				
																				

																				<c:if test="${counting eq countingCompare}">
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color:red">${scoreVal}</u></td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color:green">${scoreVal1}</u></td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${minimumValue}</td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${maximumValue}</td>
																					<c:set var="counting" value="${counting - 1}" />

																					<c:set var="leftImportedDataScore"
																						value="${scoreVal1 + leftImportedDataScore}" />
																					<c:set var="rightImportedDataScore"
																						value="${scoreVal + rightImportedDataScore}" />
																					<c:set var="minPossibleScore"
																						value="${minimumValue + minPossibleScore}" />
																					<c:set var="maxPossibleScore"
																						value="${maximumValue + maxPossibleScore}" />
																				</c:if>


																			</tr>
																		</c:if>
																	</c:forEach>



																	<!-- code for d1 d3 -->

																	<!--code for d2 d3  -->

																</c:forEach>


																<tr>
																	<td style="border: 1px solid black;">SUM OF SCORES
																	</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;">${rightImportedDataScore}</td>
																	<td style="border: 1px solid black;">${leftImportedDataScore}</td>
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
																			value="${rightImportedDataScore div maxPossibleScore *10}"
																			type="number" var="rightPainSum" />${rightPainSum}</td>
																	<td style="border: 1px solid black;"><fmt:formatNumber
																			maxFractionDigits="1"
																			value="${leftImportedDataScore div maxPossibleScore *10}"
																			type="number" var="leftPainSum" />${leftPainSum}</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																</tr>
																<c:set var="leftPainDataSum" value="${leftPainSum}" />
																<c:set var="rightPainDataSum" value="${rightPainSum}" />
																<!-- End table d1  -->



																<!-- Start table d2 other table-->
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td colspan="7" class="tbl_red"><span
																		style="display: inline-block; width: 50%"><font><b>NUMBNESS
																				AND P&N SCORES AT L3-S1</b></font></span></td>

																</tr>
																<c:set var="maxPossibleScore1" value="0" />
																<c:set var="minPossibleScore1" value="0" />
																<c:set var="leftImportedDataScore1" value="0" />
																<c:set var="rightImportedDataScore1" value="0" />

																<c:forEach items="${report.questionGroups}"
																	var="questionGroup" varStatus="counter" begin="${0}"
																	end="${4}">

																	<c:set var="maximumValue" value="" />
																	<c:set var="minimumValue" value="" />
																	<c:set var="scoreVal" value="" />
																	<c:set var="scoreVal1" value="" />
																	<c:set var="flag" value="true" />


																	<!-- Test -->


																	<c:forEach items="${questionGroup.description}"
																		var="forMin" varStatus="counter">


																		<c:if test="${reportId ne 3}">
																			<c:forEach items="${questionGroup.questions}"
																				var="list" varStatus="minValue" begin="2" end="2">



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
																							<c:set var="scoreVal1"
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


																	</c:forEach>
																	<!--End test  -->

																	<%-- ${counting} --%>




																	<c:forEach items="${questionGroup.questions}"
																		var="question" varStatus="counter">

																		<c:forEach var="clientScore" items="${clientScore}">



																			<c:if
																				test="${question.questionId == clientScore.key}">

																				<%--  key-> ${clientScore} --%>

																				<c:choose>
																					<c:when test="${flag eq true}">
																						<c:set var="scoreVal" value="${clientScore.value}" />
																						<c:set var="flag" value="false" />
																					</c:when>
																					<c:otherwise>
																						<c:set var="scoreVal1"
																							value="${clientScore.value}" />
																						<c:set var="flag" value="true" />
																					</c:otherwise>
																				</c:choose>


																			</c:if>

																		</c:forEach>
																		
																		 <c:forEach var="clientAnswer" items="${clientAnswer}">
                                                                              
																			<c:if test="${question.questionId == clientAnswer.value}">

																				 <%-- key12-> ${clientScore.value}  --%>
																				 <c:set var="qId" value="${clientAnswer.value}" />
																			</c:if>
																		   </c:forEach>


																		<c:if test="${question.parentEntityId ne null}">





																			<tr
																				style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">

																				<c:if test="${counting eq countingCompare}">
																					<td style="border: 1px solid black;"
																						bgcolor="#990000" rowspan="${counting}">
																						<div class='rotate'><font color="white">${questionGroup.description}</font></div></td>
																				</c:if>

																				<td>${question.questionText}</td>
																				

																				<%-- <td style="width: 50px;">${question.minScore}</td> --%>

																				<%-- 	<c:set var="minValue" value="0"/>
																		<c:set var="score" value="${question.maxScore}"></c:set> --%>


																				<%-- <c:if test="${score > minValue}">
																			
																		<c:set var="mnValue" value="${score}"/>
																		
																		</c:if>
																		
																		<c:out value="${mnValue}"></c:out> --%>


																				<c:choose>
                                                                            
                                                                                <c:when test="${question.questionId eq qId && question.maxScore eq scoreVal}">
                                                                                 
                                                                                   <td style="width: 75px; border: 1px solid black;"><b><u style="color:red">${question.maxScore}</u></b></td>
                                                                                </c:when>
                                                                                <c:when test="${question.questionId eq qId && question.maxScore eq scoreVal1}">
                                                                                 
                                                                                   <td style="width: 75px; border: 1px solid black;"><b><u style="color:green">${question.maxScore}</u></b></td>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                 <td style="width: 75px; border: 1px solid black;">${question.maxScore}</td>
                                                                                </c:otherwise>
                                                                              </c:choose> 


																				<c:if test="${counting eq countingCompare}">
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color:red">${scoreVal}</u></td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color:green">${scoreVal1}</u></td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${minimumValue}</td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${maximumValue}</td>
																					<c:set var="counting" value="${counting - 1}" />

																					<c:set var="leftImportedDataScore1"
																						value="${scoreVal1 + leftImportedDataScore1}" />
																					<c:set var="rightImportedDataScore1"
																						value="${scoreVal + rightImportedDataScore1}" />
																					<c:set var="minPossibleScore1"
																						value="${minimumValue + minPossibleScore1}" />
																					<c:set var="maxPossibleScore1"
																						value="${maximumValue + maxPossibleScore1}" />
																				</c:if>


																			</tr>
																		</c:if>
																	</c:forEach>



																	<!-- code for d1 d3 -->

																	<!--code for d2 d3  -->

																</c:forEach>


																<tr>
																	<td style="border: 1px solid black;">SUM OF SCORES
																	</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;">${rightImportedDataScore1}</td>
																	<td style="border: 1px solid black;">${leftImportedDataScore1}</td>
																	<td style="border: 1px solid black;">${minPossibleScore1}</td>
																	<td style="border: 1px solid black;">${maxPossibleScore1}</td>
																</tr>

																<tr>
																	<td style="border: 1px solid black;">Normalised
																		Score</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	
																	<td style="border: 1px solid black;"><fmt:formatNumber
																			maxFractionDigits="1"
																			value="${rightImportedDataScore1 div maxPossibleScore1 *10}"
																			type="number" var="rightNumbnessSum" />${rightNumbnessSum}</td>
																	<td style="border: 1px solid black;"><fmt:formatNumber
																			maxFractionDigits="1"
																			value="${leftImportedDataScore1 div maxPossibleScore1 *10}"
																			type="number" var="leftNumbnessSum" />${leftNumbnessSum}</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																</tr>
																<c:set var="leftNumbnessDataSum"
																	value="${leftNumbnessSum}" />
																<c:set var="rightNumbnessDataSum"
																	value="${rightNumbnessSum}" />

																<!--  end table d2-->



																<!-- Dermotome table -->
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td colspan="7" class="tbl_red"><span
																		style="display: inline-block; width: 50%"><font><b>DERMATOME
																				REPORT</b></font></span></td>
																</tr>


																<tr bgcolor="#990000">
																	<td style="border: 1px solid black;" colspan="3"></td>
																	<td style="border: 1px solid black;" colspan="2"><font
																		color="white">*Scores (L3-S1 )</font></td>
																	<td style="border: 1px solid black;" colspan="2"><font
																		color="white">Limits</font></td>
																</tr>

																<tr bgcolor="#990000">
																	<td style="border: 1px solid black;" colspan="3"></td>
																	<td style="border: 1px solid black;"><font
																		color="white">Left</font></td>
																	<td style="border: 1px solid black;"><font
																		color="white">Right</font></td>
																	<td style="border: 1px solid black;"><font
																		color="white">Min</font></td>
																	<td style="border: 1px solid black;"><font
																		color="white">Max</font></td>
																</tr>

																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" bgcolor="#990000"
																		colspan="3"><font color="white">Pain</font></td>
																	<td style="border: 1px solid black;">${rightPainDataSum}</td>
																	<td style="border: 1px solid black;">${leftPainDataSum}</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																</tr>

																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="3"
																		bgcolor="#990000" colspan="3"><font color="white">Numbness,
																			etc.</font></td>
																	<td style="border: 1px solid black;">${rightNumbnessDataSum}</td>
																	<td style="border: 1px solid black;">${leftNumbnessDataSum}</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																</tr>

																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="3"
																		bgcolor="#990000" colspan="3"><font color="white">Integrated
																			score (sum)</font></td>
																	
																	<td style="border: 1px solid black;">
																	<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${rightPainDataSum + rightNumbnessDataSum}"
																			type="number" var="sumIntegratedLeftScore"/>
																	${sumIntegratedLeftScore}</td>
																	
																	<td style="border: 1px solid black;">
																	<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${leftPainDataSum + leftNumbnessDataSum}"
																			type="number" var="sumIntegratedRightScore"/>
																	${sumIntegratedRightScore}
																	</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">20</td>
																</tr>

																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="3"
																		bgcolor="#990000" colspan="3"><font color="white">Integrated
																			score (adjusted)</font></td>
																	
																	<td style="border: 1px solid black;">
																	<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${(rightPainDataSum + rightNumbnessDataSum) div 2}"
																			type="number" var="TotalSumLeft"/>${TotalSumLeft}
																	</td>
																	<td style="border: 1px solid black;">
																	<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${(leftPainDataSum+leftNumbnessDataSum) div 2}"
																			type="number" var="TotalSumRight"/>${TotalSumRight}
																	</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																</tr>
																<!-- End dermotome table -->

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