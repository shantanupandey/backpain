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
														${report1.name} (Question Listing) </strong></td>
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
																							value="Go to report1 Listing" /></td>
																					</tr>
																				</tbody>
																			</table>
																		</fieldset></td>
																</tr>
															</tbody>
														</table> <br /></td>
												</tr>


                                                
																	<!--Start Dermotome table -->
															
																<c:set var="maxPossibleScore" value="0" />
																<c:set var="minPossibleScore" value="0" />
																<c:set var="leftImportedDataScore" value="0" />
																<c:set var="rightImportedDataScore" value="0" />
																<c:set var="maxGlobalValue" value="" />

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

																													                   

																							<c:set var="scoreVal"
																								value="${clientScore.value}" />
																							<c:set var="scoreVal1"
																								value="${clientScore.value}" />

																						</c:if>
																					</c:forEach>


																					<%-- ${scoreVal} --%>

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
																				


																				<c:set var="minimumValue" value="${minValue}" />
																				<c:set var="maximumValue" value="${maxValue}" />


																				<c:set var="maxValue" value="${list.maxScore}" />
																			</c:forEach>
																		</c:if>

																		<!-- For Pain Report -->


																	</c:forEach>
																	<!--End test  -->

																	



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

																				
																				 <c:set var="qId" value="${clientAnswer.value}" />
																				 
																			</c:if>
																		   </c:forEach>

																		<c:if test="${question.parentEntityId ne null}">

																				

																				<c:if test="${counting eq countingCompare}">
																					
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
																	<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${leftImportedDataScore div maxPossibleScore *10}"
																			type="number" var="leftPainSum" />
																	<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${rightImportedDataScore div maxPossibleScore *10}"
																			type="number" var="rightPainSum" />

																<c:set var="leftPainDataSum" value="${leftPainSum}" />
																<c:set var="rightPainDataSum" value="${rightPainSum}" />
																<!-- End table d1  -->
																


																<!-- Start table d2 other table-->
																
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
																				


																				<c:set var="minimumValue" value="${minValue}" />
																				<c:set var="maximumValue" value="${maxValue}" />


																				<c:set var="maxValue" value="${list.maxScore}" />
																			</c:forEach>
																		</c:if>

																		<!-- For Pain Report -->


																	</c:forEach>
																	<!--End test  -->

																	




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

																				 <c:set var="qId" value="${clientAnswer.value}" />
																			</c:if>
																		   </c:forEach>


																		<c:if test="${question.parentEntityId ne null}">
														
																			
																		<c:set var="mnValue" value="${score}"/>
																		
																		</c:if>
																		
																		

																				<c:if test="${counting eq countingCompare}">
																					
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


																			
																		
																	</c:forEach>



																	<!-- code for d1 d3 -->

																	<!--code for d2 d3  -->

																</c:forEach>
																
																<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${leftImportedDataScore1 div maxPossibleScore1 *10}"
																			type="number" var="leftNumbnessSum" />
																<fmt:formatNumber
																			maxFractionDigits="1"
																			value="${rightImportedDataScore1 div maxPossibleScore1 *10}"
																			type="number" var="rightNumbnessSum" />

									
																<c:set var="leftNumbnessDataSum"
																	value="${leftNumbnessSum}" />
																<c:set var="rightNumbnessDataSum"
																	value="${rightNumbnessSum}" />

																<!--  end table d2-->



																<!-- Dermotome table -->
																
																<!-- End dermotome table -->

															
																<!--End Dermotome table  -->


												<tr>
												
												
												
													<td style="width: 123px; height: 420px" valign="top">
														<div>
															<c:set var="count" value="0" scope="page" />
															<table cellspacing="0" cellpadding="4" rules="rows"
																border="1"
																style="color: #333333; height: 95px; width: 768px; border-collapse: collapse;">
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<!-- <th scope="col" style="width: 75px;">Min. Score</th> -->

																	<th scope="col" style="width: 75px;border: 1px solid black;border-bottom: 0px"></th>

																	
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" colspan="2">Imported Data Score</th>
																	<th scope="col" style="width: 100px;border: 1px solid black;" colspan="9">Imported Data Subtotal</th>
																	
																	
																	</th>
																	
																	

																</tr>
																<!-- <tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 75px;">Min. Score</th>

																	<th scope="col" style="width: 75px;border: 1px solid black;border-bottom: 0px"></th>

																	
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" colspan="2">Imported Data Score</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="8">Imported Data Subtotal</th>
																	
																	
																	</th>
																	
																	

																</tr> -->
																<!-- <tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-top-color:#990000">Site</th>
																	<th scope="col" style="border: 1px solid black;border-top-color:#990000">Pain Type</th>
																	

																	<th scope="col" style="width: 75px;border: 1px solid black;border-top-color:#990000">Score</th>
																	
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Min possible
																		score</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Max possible
																		score</th>

																	<th scope="col" style="width: 75px;border: 1px solid black;">Left Imported
																		Data Score</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;">Right
																		Imported Data Score</th>

																	
																		
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Left Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Right Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Adjusted Left Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Adjusted Right Side
																	</th>
																	
																	

																</tr> -->
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-top-color:#990000">Site</th>
																	<th scope="col" style="border: 1px solid black;border-top-color:#990000">Pain Type</th>
																	

																	<th scope="col" style="width: 75px;border: 1px solid black;border-top-color:#990000">Score</th>
																	
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Min possible
																		score</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Max possible
																		score</th>

																	<th scope="col" style="width: 75px;border: 1px solid black;">Left Imported
																		Data Score</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;">Right
																		Imported Data Score</th>

																	
																		
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Left Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Right Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Adjusted Left Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="3">Adjusted Right Side
																	</th>
																
																	

																</tr>
																
																
														

																<tr>
																	<td colspan="16" class="tbl_red"><span
																		style="display: inline-block; width: 50%">
																		<font><b>MUSCLE WEAKNESS</b></font></span></td>

																</tr>

																<c:set var="maxPossibleScore" value="0" />
																<c:set var="minPossibleScore" value="0" />
																<c:set var="leftImportedDataScore" value="0" />
																<c:set var="rightImportedDataScore" value="0" />
																<!-- Index 1 to 4 -->
																<c:set var="SumScore" value="0" />
																<c:set var="SumScore1" value="0" />
																<c:set var="SumScoreVal1" value="13" />
																<!-- Index 5-->
																<c:set var="SumScoreValq5" value="13" />
																<c:set var="SumScoreq5" value="0" />
																<c:set var="SumScore1q5" value="0" />
																
																<!--index 6 Tiptoe -->
																<c:set var="SumScoreValqT5" value="13" />
																<c:set var="SumScoreqT5" value="0" />
																<c:set var="SumScore1qT5" value="0" />
																
																<!--index 6 Heel -->
																<c:set var="SumScoreValqH5" value="13" />
																<c:set var="SumScoreqH5" value="0" />
																<c:set var="SumScore1qH5" value="0" />
																
																<!-- Index 8 -->
																<c:set var="SumScoreValq8" value="13" />
																<c:set var="SumScoreq8" value="0" />
																<c:set var="SumScore1q8" value="0" />
																
																
																
																
									

                                                                <!-- Startnew Structure for RAD TABLE -->
																<c:forEach items="${report1.questionGroups}"
																	var="questionGroup" varStatus="counter" begin="1" end="6">
																	
																	
																	
																	<!--For setting the rowspan value in the Imported Data Subtotal -->
																	<c:if test="${counter.index eq 1}">
																	<c:set var="rowSpan" value="6" />
																	</c:if>	
																	
																	<c:if test="${counter.index eq 1 || counter.index eq 2 || counter.index eq 3 }">
																	 <c:set var="SumScoreVal1" value="${SumScoreVal1 - 1}"/>
																	</c:if>	
																	
																	<!-- Increse counter index when Tiptoe,Heel site will confirm -->
																	<c:if test="${counter.index eq 4}">
																	 <c:set var="SumScoreValq5" value="${SumScoreValq5 - 1}"/>
																	</c:if>
																	
																	<c:if test="${counter.index eq 4}">
																	<c:set var="rowSpan1" value="2" />
																	</c:if>	
																	
																	<!--Tiptoe  -->
																	<c:if test="${counter.index eq 5}">
																	 <c:set var="SumScoreValqT5" value="${SumScoreValqT5 - 1}"/>
																	</c:if>
																	
																	<c:if test="${counter.index eq 5}">
																	<c:set var="rowSpan2" value="2" />
																	</c:if>	
																	
																	<!--Heel  -->
																	<c:if test="${counter.index eq 6}">
																	 <c:set var="SumScoreValqH5" value="${SumScoreValqH5 - 1}"/>
																	</c:if>
																	
																	<c:if test="${counter.index eq 6}">
																	<c:set var="rowSpan3" value="2" />
																	</c:if>	
																	
																	<!--For SLR -->
																	
																	<c:if test="${counter.index eq 7}">
																	<c:set var="SumScoreValq8" value="${SumScoreValq8 - 1}"/>
																	</c:if>
																	
																	<c:if test="${counter.index eq 7}">
																	<c:set var="rowSpan2" value="5" />
																	</c:if>	

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
																				var="list" varStatus="minValue" begin="1" end="1">



																				<c:set var="maxValue" value="${list.maxScore}" />
																				<c:set var="minValue" value="${list.maxScore}" />
																				<c:set var="counting" value="0" />
																				<c:set var="countingCompare" value="0" />


																				<c:forEach items="${questionGroup.questions}"
																					var="minimumVal" varStatus="counter">

																					<c:forEach var="clientScore1" items="${clientScore1}">



																						<c:if
																							test="${minimumVal.questionId == clientScore1.key}">

																							<c:set var="scoreVal"
																								value="${clientScore1.value}" />
																							<c:set var="scoreVal1"
																								value="${clientScore1.value}" />

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
																				
																				<c:set var="minimumValue" value="${minValue}" />
																				<c:set var="maximumValue" value="${maxValue}" />


																				<c:set var="maxValue" value="${list.maxScore}" />
																			</c:forEach>
																		</c:if>

																		<!-- For Pain report1 -->
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

																		<c:forEach var="clientScore1" items="${clientScore1}">



																			<c:if
																				test="${question.questionId == clientScore1.key}">

																				<%--  key-> ${clientScore1} --%>

																				<c:choose>
																					<c:when test="${flag eq true}">
																						<c:set var="scoreVal" value="${clientScore1.value}" />
																						<c:set var="flag" value="false" />
																					</c:when>
																					<c:otherwise>
																						<c:set var="scoreVal1"
																							value="${clientScore1.value}" />
																						<c:set var="flag" value="true" />
																					</c:otherwise>
																				</c:choose>


																			</c:if>

																		</c:forEach>
																		
																		 <c:forEach var="clientAnswer1" items="${clientAnswer1}">
                                                                              
																			<c:if test="${question.questionId == clientAnswer1.value}">

																				 <c:set var="qId" value="${clientAnswer1.value}" />
																			</c:if>
																		   </c:forEach>
																		
																		


																		<c:if test="${question.parentEntityId ne null}">





																			<tr
																				style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border: 1px solid black;">

																				<c:if test="${counting eq countingCompare}">
																					<td style="border: 1px solid black;"
																						bgcolor="#990000" rowspan="${counting}">
																						<div class='rotate'><font color="white">${questionGroup.description}</font></div></td>
																				</c:if>


																				<td>
																					${question.questionText}</td>
																				
																				
																						

																				 <c:choose>
                                                                            
                                                                                <c:when test="${question.questionId eq qId && question.maxScore eq scoreVal}">
                                                                                 
                                                                                   <td style="width: 75px; border: 1px solid black;"><u style="color:green">${question.maxScore}</u></td>
                                                                                </c:when>
                                                                                <c:when test="${question.questionId eq qId && question.maxScore eq scoreVal1}">
                                                                                 
                                                                                   <td style="width: 75px; border: 1px solid black;"><u style="color:red">${question.maxScore}</u></td>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                 <td style="width: 75px; border: 1px solid black;">${question.maxScore}</td>
                                                                                </c:otherwise>
                                                                              </c:choose> 


																				<c:if test="${counting eq countingCompare}">
																				
																				<!--Adjusted code for question Hip/Thigh,knee,Ankel,Whole leg  -->
																				<c:if test="${SumScoreVal1 eq 12 ||SumScoreVal1 eq 10 ||SumScoreVal1 eq 8}">
																					
																				     <c:set var="SumScore" value="${scoreVal + SumScore}"/>
																				     <c:set var="SumScore1" value="${scoreVal1 + SumScore1}"/>
																				      <c:set var="SumScoreVal1" value="${SumScoreVal1-1}"/>
																				    
																				</c:if>	
																				
																																	
																				 
																				
																					<c:if test="${SumScoreVal1 eq 7}">
																					 <input type="hidden" id="SumOfScore" name="SumOfScore" value="${SumScore}"/>
																					 <input type="hidden" id="SumOfScore1" name="SumOfScore1" value="${SumScore1}"/>
																				     <input type="hidden" id="count1" name="count1" value="${SumScoreVal1}"/>
																				    <script>
																				    $(document).ready(function () {
																				    	
																				    	var val= document.getElementById('count1').value;
																				    	var leftSideScore= document.getElementById('SumOfScore').value;
																				    	var rightSideScore= document.getElementById('SumOfScore1').value;
																				    	
																				    	
																				    	if(val==7){
																				    			document.getElementById('LeftSide1').innerHTML = leftSideScore;
																				    			document.getElementById('RightSide1').innerHTML = rightSideScore;
																				    			
																				    			if(leftSideScore>10){
																					    			document.getElementById('LeftSideAdjusted').innerHTML = "10";
																					    			document.getElementById('leftTd').style.backgroundColor='#FFFF00';
																					    		}else{
																					    			document.getElementById('LeftSideAdjusted').innerHTML = leftSideScore;
																					    			
																					    		}
																					    		
																					    		if(rightSideScore>10){
																					    			document.getElementById('RightSideAdjusted').innerHTML = "10";
																					    			document.getElementById('rightTd').style.backgroundColor='#FFFF00';
																					    		}else{
																					    			document.getElementById('RightSideAdjusted').innerHTML = rightSideScore;
																					    		}
																				    	}
																				    });
																				    </script>
																					</c:if>
																					<!--End Adjusted code for question Hip/Thigh,knee,Ankel,Whole leg  -->
																					
																					<!--Adjusted code for question Stairs,Tiptoe,Heel(Currently working only Stairs)-->
																				<c:if test="${SumScoreValq5 eq 12}">
																					
																				     <c:set var="SumScoreq5" value="${scoreVal + SumScoreq5}"/>
																				     <c:set var="SumScore1q5" value="${scoreVal1 + SumScore1q5}"/>
																				     <c:set var="SumScoreValq5" value="${SumScoreValq5-1}"/>
																				     
																				    
																				</c:if>	
																				
																					<c:if test="${SumScoreValq5 eq 11}">
																					 <input type="hidden" id="SumOfScoreq5" name="SumOfScoreq5" value="${SumScoreq5}"/>
																					 <input type="hidden" id="SumOfScore1q5" name="SumOfScore1q5" value="${SumScore1q5}"/>
																				     <input type="hidden" id="count1q5" name="count1q5" value="${SumScoreValq5}"/>
																				    <script>
																				    $(document).ready(function () {
																				    	
																				    	var valq5= document.getElementById('count1q5').value;
																				    	var leftSideScoreq5= document.getElementById('SumOfScoreq5').value;
																				    	var rightSideScoreq5= document.getElementById('SumOfScore1q5').value;
																				    	
																				    	
																				    	if(valq5==11){
																				    			document.getElementById('LeftSide1q5').innerHTML = leftSideScoreq5;
																				    			document.getElementById('RightSide1q5').innerHTML = rightSideScoreq5;
																				    			
																					    			document.getElementById('LeftSideAdjustedq5').innerHTML = leftSideScoreq5;
																					    	
																					    			document.getElementById('RightSideAdjustedq5').innerHTML = rightSideScoreq5;
																					    			
																					    			
																					   
																					    		
																				    	}
																				    });
																				    </script>
																					</c:if>
																					
																					
																					<!-- question tiptoe -->
																					
																					
																					<c:if test="${SumScoreValqT5 eq 12}">
																					
																				     <c:set var="SumScoreqT5" value="${scoreVal + SumScoreqT5}"/>
																				     <c:set var="SumScore1qT5" value="${scoreVal1 + SumScore1qT5}"/>
																				     <c:set var="SumScoreValqT5" value="${SumScoreValqT5-1}"/>
																				     
																				    
																				   </c:if>	
																					<c:if test="${SumScoreValqT5 eq 11}">
																					 <input type="hidden" id="SumOfScoreqT5" name="SumOfScoreqT5" value="${SumScoreqT5}"/>
																					 <input type="hidden" id="SumOfScore1qT5" name="SumOfScore1qT5" value="${SumScore1qT5}"/>
																				     <input type="hidden" id="count1qT5" name="count1qT5" value="${SumScoreValqT5}"/>
																				    <script>
																				    $(document).ready(function () {
																				    	
																				    	var valq5= document.getElementById('count1qT5').value;
																				    	var leftSideScoreq5= document.getElementById('SumOfScoreqT5').value;
																				    	var rightSideScoreq5= document.getElementById('SumOfScore1qT5').value;
																				    	
																				    	
																				    	if(valq5==11){
																				    			document.getElementById('LeftSide1qT5').innerHTML = leftSideScoreq5;
																				    			document.getElementById('RightSide1qT5').innerHTML = rightSideScoreq5;
																				    			
																					    			document.getElementById('LeftSideAdjustedqT5').innerHTML = leftSideScoreq5;
																					    	
																					    			document.getElementById('RightSideAdjustedqT5').innerHTML = rightSideScoreq5;
																					    		
																				    	}
																				    });
																				    </script>
																					</c:if>
																					
																					
																					<!-- Heel -->
																					
																					
																					
																					<c:if test="${SumScoreValqH5 eq 12}">
																					
																				     <c:set var="SumScoreqH5" value="${scoreVal + SumScoreqH5}"/>
																				     <c:set var="SumScore1qH5" value="${scoreVal1 + SumScore1qH5}"/>
																				     <c:set var="SumScoreValqH5" value="${SumScoreValqH5-1}"/>
																				     
																				    
																				   </c:if>	
																			
																					<c:if test="${SumScoreValqH5 eq 11}">
																					 <input type="hidden" id="SumOfScoreqH5" name="SumOfScoreqH5" value="${SumScoreqH5}"/>
																					 <input type="hidden" id="SumOfScore1qH5" name="SumOfScore1qH5" value="${SumScore1qH5}"/>
																				     <input type="hidden" id="count1qH5" name="count1qH5" value="${SumScoreValqH5}"/>
																				    <script>
																				    $(document).ready(function () {
																				    	
																				    	var valq5= document.getElementById('count1qH5').value;
																				    	var leftSideScoreq5= document.getElementById('SumOfScoreqH5').value;
																				    	var rightSideScoreq5= document.getElementById('SumOfScore1qH5').value;
																				    	
																				    	
																				    	if(valq5==11){
																				    			document.getElementById('LeftSide1qH5').innerHTML = leftSideScoreq5;
																				    			document.getElementById('RightSide1qH5').innerHTML = rightSideScoreq5;
																				    			
																					    			document.getElementById('LeftSideAdjustedqH5').innerHTML = leftSideScoreq5;
																					    	
																					    			document.getElementById('RightSideAdjustedqH5').innerHTML = rightSideScoreq5;
																					    		
																				    	}
																				    	
																				    	
																				    	var LeftSide1= document.getElementById('LeftSide1').innerHTML;
																				    	var LeftSide1q5= document.getElementById('LeftSide1q5').innerHTML;
																				    	var LeftSide1qT5= document.getElementById('LeftSide1qT5').innerHTML;
																				    	var LeftSide1qH5= document.getElementById('LeftSide1qH5').innerHTML;
																				    	
																				    	
																				    	
																				    	var sumLeftImpDataScore=parseFloat(LeftSide1)+parseFloat(LeftSide1q5)+parseFloat(LeftSide1qT5)+parseFloat(LeftSide1qH5);
																				    	document.getElementById('leftSideSum').innerHTML = sumLeftImpDataScore;
																				    
																				    	
																				    	var RightSide1= document.getElementById('RightSide1').innerHTML;
																				    	var RightSide1q5= document.getElementById('RightSide1q5').innerHTML;
																				    	var RightSide1qT5= document.getElementById('RightSide1qT5').innerHTML;
																				    	var RightSide1qH5= document.getElementById('RightSide1qH5').innerHTML;
																				    	
																				    	var sumRightImpDataScore=parseFloat(RightSide1)+parseFloat(RightSide1q5)+parseFloat(RightSide1qH5)+parseFloat(RightSide1qT5);
																				    	document.getElementById('rightSideSum').innerHTML = sumRightImpDataScore;
																				    	
																				    	
																				    	
																				    	var LeftSideAdjusted= document.getElementById('LeftSideAdjusted').innerHTML;
																				    	var LeftSideAdjustedq5= document.getElementById('LeftSideAdjustedq5').innerHTML;
																				    	var LeftSideAdjustedqT5= document.getElementById('LeftSideAdjustedqT5').innerHTML;
																				    	var LeftSideAdjustedqH5= document.getElementById('LeftSideAdjustedqH5').innerHTML;
																				    	
																				    	
																				    	var sumLeftAdjDataScore=parseFloat(LeftSideAdjusted)+parseFloat(LeftSideAdjustedq5)+parseFloat(LeftSideAdjustedqT5)+parseFloat(LeftSideAdjustedqH5);
																				    	
																				    	document.getElementById('adjLeftSideSum').innerHTML = sumLeftAdjDataScore;
																				    	
																				    	
																				    	var RightSideAdjusted= document.getElementById('RightSideAdjusted').innerHTML;
																				    	var RightSideAdjustedq5= document.getElementById('RightSideAdjustedq5').innerHTML;
																				    	var RightSideAdjustedqT5= document.getElementById('RightSideAdjustedqT5').innerHTML;
																				    	var RightSideAdjustedqH5= document.getElementById('RightSideAdjustedqH5').innerHTML;
																				    	
																				    	var sumRightAdjDataScore=parseFloat(RightSideAdjusted)+parseFloat(RightSideAdjustedq5)+parseFloat(RightSideAdjustedqT5)+parseFloat(RightSideAdjustedqH5);
																				    	document.getElementById('adjRightSideSum').innerHTML = sumRightAdjDataScore;
																				    	
																				    	var maxScore=document.getElementById('maxPossibleScore').innerHTML;
																				    	var maxPossibleScore=parseFloat(maxScore);
																				    	
																				    	
																				    	var leftSumOfScore=(sumLeftAdjDataScore/maxPossibleScore)*10;
																				    	
																				    	
																				    	document.getElementById('hiddenNormalLeftSum').value = sumLeftAdjDataScore;
																				    	document.getElementById('hiddenMaxPossibleScore').value = maxPossibleScore;
																				    	
																				    	var leftSumOfScoreFinal=leftSumOfScore.toFixed(1);
																				    	document.getElementById('normaliseLeftSum').innerHTML = leftSumOfScoreFinal;
																				    	
																				    	var rightSumOfScore=(sumRightAdjDataScore/maxPossibleScore)*10;
																				    	
																				    	document.getElementById('hiddenNormalRightSum').value = sumRightAdjDataScore;
																				    	var rightSumOfScoreFinal=rightSumOfScore.toFixed(1);
																				    	document.getElementById('normaliseRightSum').innerHTML = rightSumOfScoreFinal;
																				    	
																				    	if(leftSumOfScoreFinal>rightSumOfScoreFinal){
																				    		document.getElementById('maxAdjustedScore').innerHTML = leftSumOfScoreFinal;
																				    	}else{
																				    		document.getElementById('maxAdjustedScore').innerHTML = rightSumOfScoreFinal;
																				    	}
																				    	
																				    	
																				    
																				    	
																				    });
																				    </script>
																					</c:if>
																					
																					
																					<!--End Adjusted code for question Hip/Thigh,knee,Ankel,Whole leg  -->
																					
																				<!--Adjusted code for question SLR)-->
																				    <c:if test="${SumScoreValq8 eq 12}">
																					
																				     <c:set var="SumScoreq8" value="${scoreVal + SumScoreq8}"/>
																				     <c:set var="SumScore1q8" value="${scoreVal1 + SumScore1q8}"/>
																				     <c:set var="SumScoreValq8" value="${SumScoreValq8-1}"/>
																				     
																				    
																				    </c:if>	
																				
																					<c:if test="${SumScoreValq8 eq 11}">
																					 <input type="hidden" id="SumOfScoreq8" name="SumOfScoreq8" value="${SumScoreq8}"/>
																					 <input type="hidden" id="SumOfScore1q8" name="SumOfScore1q8" value="${SumScore1q8}"/>
																				     <input type="hidden" id="count1q8" name="count1q8" value="${SumScoreValq8}"/>
																				    <script>
																				    $(document).ready(function () {
																				    	
																				    	var valq8= document.getElementById('count1q8').value;
																				    	var leftSideScoreq8= document.getElementById('SumOfScoreq8').value;
																				    	var rightSideScoreq8= document.getElementById('SumOfScore1q8').value;
																				    	
																				    	
																				    	if(valq8==11){
																				    			document.getElementById('LeftSide1q8').innerHTML = leftSideScoreq8;
																				    			document.getElementById('RightSide1q8').innerHTML = rightSideScoreq8;
																				    		
																					    		document.getElementById('LeftSideAdjustedq8').innerHTML = leftSideScoreq8;
																					    		document.getElementById('RightSideAdjustedq8').innerHTML = rightSideScoreq8;
																					    		
																				    	}
																				    	
																				    	var cell1left= document.getElementById('cell1left').innerHTML;
																				    	var LeftSide1= document.getElementById('LeftSide1').innerHTML;
																				    	var LeftSide1q5= document.getElementById('LeftSide1q5').innerHTML;
																				    	var LeftSide1qT5= document.getElementById('LeftSide1qT5').innerHTML;
																				    	var LeftSide1qH5= document.getElementById('LeftSide1qH5').innerHTML;
																				    	var LeftSide1q8= document.getElementById('LeftSide1q8').innerHTML;
																				    	
																				    	var sumLeftImpDataScore=parseFloat(cell1left)+parseFloat(LeftSide1)+parseFloat(LeftSide1q5)+parseFloat(LeftSide1qT5)+parseFloat(LeftSide1qH5)+parseFloat(LeftSide1q8);
																				    	document.getElementById('leftSideSum').innerHTML = sumLeftImpDataScore;
																				    
																				    	
																				    	var cell1Right= document.getElementById('cell1Right').innerHTML;
																				    	var RightSide1= document.getElementById('RightSide1').innerHTML;
																				    	var RightSide1q5= document.getElementById('RightSide1q5').innerHTML;
																				    	var RightSide1qT5= document.getElementById('RightSide1qT5').innerHTML;
																				    	var RightSide1qH5= document.getElementById('RightSide1qH5').innerHTML;
																				    	var RightSide1q8= document.getElementById('RightSide1q8').innerHTML;
																				    	
																				    	var sumRightImpDataScore=parseFloat(cell1Right)+parseFloat(RightSide1)+parseFloat(RightSide1q5)+parseFloat(RightSide1qH5)+parseFloat(RightSide1qT5)+parseFloat(RightSide1q8);
																				    	document.getElementById('rightSideSum').innerHTML = sumRightImpDataScore;
																				    	
																				    	
																				    	
																				    	var cell1leftAdjusted= document.getElementById('cell1leftAdjusted').innerHTML;
																				    	var LeftSideAdjusted= document.getElementById('LeftSideAdjusted').innerHTML;
																				    	var LeftSideAdjustedq5= document.getElementById('LeftSideAdjustedq5').innerHTML;
																				    	var LeftSideAdjustedqT5= document.getElementById('LeftSideAdjustedqT5').innerHTML;
																				    	var LeftSideAdjustedqH5= document.getElementById('LeftSideAdjustedqH5').innerHTML;
																				    	var LeftSideAdjustedq8= document.getElementById('LeftSideAdjustedq8').innerHTML;
																				    	
																				    	
																				    	var sumLeftAdjDataScore=parseFloat(cell1leftAdjusted)+parseFloat(LeftSideAdjusted)+parseFloat(LeftSideAdjustedq5)+parseFloat(LeftSideAdjustedqT5)+parseFloat(LeftSideAdjustedqH5)+parseFloat(LeftSideAdjustedq8);
																				    	
																				    	document.getElementById('adjLeftSideSum').innerHTML = sumLeftAdjDataScore;
																				    	
																				    	
																				    	var cell1RightAdjusted= document.getElementById('cell1RightAdjusted').innerHTML;
																				    	var RightSideAdjusted= document.getElementById('RightSideAdjusted').innerHTML;
																				    	var RightSideAdjustedq5= document.getElementById('RightSideAdjustedq5').innerHTML;
																				    	var RightSideAdjustedqT5= document.getElementById('RightSideAdjustedqT5').innerHTML;
																				    	var RightSideAdjustedqH5= document.getElementById('RightSideAdjustedqH5').innerHTML;
																				    	var RightSideAdjustedq8 = document.getElementById('RightSideAdjustedq8').innerHTML;
																				    	
																				    	var sumRightAdjDataScore=parseFloat(cell1RightAdjusted)+parseFloat(RightSideAdjusted)+parseFloat(RightSideAdjustedq5)+parseFloat(RightSideAdjustedqT5)+parseFloat(RightSideAdjustedqH5)+parseFloat(RightSideAdjustedq8);
																				    	document.getElementById('adjRightSideSum').innerHTML = sumRightAdjDataScore;
																				    	
																				    	var maxScore=document.getElementById('maxPossibleScore').innerHTML;
																				    	var maxPossibleScore=parseFloat(maxScore);
																				    	
																				    	
																				    	var leftSumOfScore=(sumLeftAdjDataScore/maxPossibleScore)*10;
																				    	
																				    	var leftSumOfScoreFinal=leftSumOfScore.toFixed(1);
																				    	document.getElementById('normaliseLeftSum').innerHTML = leftSumOfScoreFinal;
																				    	
																				    	 
																				    	
																				    	
																				    	var rightSumOfScore=(sumRightAdjDataScore/maxPossibleScore)*10;
																				    	document.getElementById('hiddenNormalRightSum').innerHTML = rightSumOfScore;
																				    	var rightSumOfScoreFinal=rightSumOfScore.toFixed(1);
																				    	document.getElementById('normaliseRightSum').innerHTML = rightSumOfScoreFinal;
																				    	
																				    	if(leftSumOfScoreFinal>rightSumOfScoreFinal){
																				    		document.getElementById('maxAdjustedScore').innerHTML = leftSumOfScoreFinal;
																				    	}else{
																				    		document.getElementById('maxAdjustedScore').innerHTML = rightSumOfScoreFinal;
																				    	}
																				    	
																				    	
																				    });
																				    </script>
																					</c:if>
																					<!--End Adjusted code for question SLR  -->
																					
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${minimumValue}</td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}">${maximumValue}</td>
																					
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color:green">${scoreVal}</u></td>
																					<td style="border: 1px solid black;"
																						rowspan="${counting}"><u style="color:red">${scoreVal1}</u></td>
																						
																						
																					<!-- Index 1,2,3,4 -->	
																					<c:if test="${rowSpan eq 6}">
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan}"><div id="LeftSide1"></div></td>
																					<td style="width: 50px;border: 1px solid black;"  colspan="2" rowspan="${rowSpan}"><div id="RightSide1"></div></td>
																						
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan}" id="leftTd"><div id="LeftSideAdjusted"></div></td>
																						
																					<td style="border: 1px solid black;"
																						rowspan="${rowSpan}" id="rightTd"><div id="RightSideAdjusted"></div></td>
																						<c:set var="rowSpan" value="${rowSpan - 1}" />
																						
																					</c:if>
																					
																					<!--Index 5  -->
																					<c:if test="${rowSpan1 eq 2}">
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan1}"><div id="LeftSide1q5"></div></td>
																					<td style="width: 50px;border: 1px solid black;"  colspan="2" rowspan="${rowSpan1}"><div id="RightSide1q5"></div></td>
																						
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan1}" id="leftTdq5"><div id="LeftSideAdjustedq5"></div></td>
																						
																					<td style="border: 1px solid black;"
																						rowspan="${rowSpan1}" id="rightTdq5"><div id="RightSideAdjustedq5"></div></td>
																						<c:set var="rowSpan1" value="${rowSpan1 - 1}" />
																					</c:if>
																					
																					<!--Index Tiptoe  -->
																					<c:if test="${rowSpan2 eq 2}">
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan2}"><div id="LeftSide1qT5"></div></td>
																					<td style="width: 50px;border: 1px solid black;"  colspan="2" rowspan="${rowSpan2}"><div id="RightSide1qT5"></div></td>
																						
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan2}" id="leftTdq5"><div id="LeftSideAdjustedqT5"></div></td>
																						
																					<td style="border: 1px solid black;"
																						rowspan="${rowSpan2}" id="rightTdq5"><div id="RightSideAdjustedqT5"></div></td>
																						<c:set var="rowSpan2" value="${rowSpan2 - 1}" />
																					</c:if>
																					
																					<!--Index Heel  -->
																					<c:if test="${rowSpan3 eq 2}">
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan3}"><div id="LeftSide1qH5"></div></td>
																					<td style="width: 50px;border: 1px solid black;"  colspan="2" rowspan="${rowSpan3}"><div id="RightSide1qH5"></div></td>
																						
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan3}" id="leftTdq5"><div id="LeftSideAdjustedqH5"></div></td>
																						
																					<td style="border: 1px solid black;"
																						rowspan="${rowSpan3}" id="rightTdq5"><div id="RightSideAdjustedqH5"></div></td>
																						<c:set var="rowSpan3" value="${rowSpan3 - 1}" />
																					</c:if>
																					
																					<!--Index 6  -->
																					<c:if test="${rowSpan2 eq 5}">
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan2}"><div id="LeftSide1q8"></div></td>
																					<td style="width: 50px;border: 1px solid black;"  colspan="2" rowspan="${rowSpan2}"><div id="RightSide1q8"></div></td>
																						
																					<td style="width: 50px;border: 1px solid black;" colspan="2"
																						rowspan="${rowSpan2}" id="leftTdq8"><div id="LeftSideAdjustedq8"></div></td>
																						
																					<td style="border: 1px solid black;"
																						rowspan="${rowSpan2}" id="rightTdq8"><div id="RightSideAdjustedq8"></div></td>
																						<c:set var="rowSpan1" value="${rowSpan2 - 1}" />
																					</c:if>
																				  
																					
																					
																					
																						
																					
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

																</c:forEach>
																<!--End Startnew Structure for RAD TABLE -->
																
																<input type="hidden" id="hiddenNormalLeftSum"/>
																<input type="hidden" id="hiddenNormalRightSum"/>
																<input type="hidden" id="hiddenMaxPossibleScore"/>
																
																
																
																<tr>
																	<td style="border: 1px solid black;">Sum
																	</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;">${minPossibleScore}</td>
																	<td style="border: 1px solid black;"><div id="maxPossibleScore">${maxPossibleScore}</div></td>
																	
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;" colspan="2"><div id="leftSideSum"></div></td>
																	<td style="border: 1px solid black;" colspan="2"><div id="rightSideSum"></div></td>
																	<td style="border: 1px solid black;" colspan="2"><div id="adjLeftSideSum"></div></td>
																	<td style="border: 1px solid black;" colspan="3"><div id="adjRightSideSum"></div></td>
																	
																</tr>

																<tr>
																	<td style="border: 1px solid black;">Normalised
																		Score</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																	
																	
																	<td style="border: 1px solid black;"></td>
																    <td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;" colspan="2"></td>
																	<td style="border: 1px solid black;" colspan="2"></td>
																	<td style="border: 1px solid black;" colspan="2"><div id="normaliseLeftSum"></div></td>
																	<td style="border: 1px solid black;" colspan="2"><div id="normaliseRightSum"></div></td>
																	
																</tr>

															</table>
															&nbsp;&nbsp;&nbsp;
															
															
															<!--according to the new strucutre  -->
															<table cellspacing="0" cellpadding="4" rules="rows"
																border="1"
																style="color: #333333; height: 95px; width: 742px; border-collapse: collapse;">
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<!-- <th scope="col" style="width: 75px;">Min. Score</th> -->

																	<th scope="col" style="width: 75px;border: 1px solid black;border-bottom: 0px"></th>

																	
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" colspan="2">Imported Data Score</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="8">Imported Data Subtotal</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px"></th>
																	
																	</th>
																	
																	

																</tr>
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-top-color:#990000">Site</th>
																	<th scope="col" style="border: 1px solid black;border-top-color:#990000">Pain Type</th>
																	

																	<th scope="col" style="width: 75px;border: 1px solid black;border-top-color:#990000">Score</th>
																	
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Min possible
																		score</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Max possible
																		score</th>

																	<th scope="col" style="width: 75px;border: 1px solid black;">Left Imported
																		Data Score</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;">Right
																		Imported Data Score</th>

																	
																		
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Left Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Right Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Adjusted Left Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" colspan="2">Adjusted Right Side
																	</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;border-top-color:#990000">Max Adjusted Score<br>Left/Right</th>
																	

																</tr>
																
																
														

																<tr>
																	<td colspan="16" class="tbl_red"><span
																		style="display: inline-block; width: 50%">
																		<font><b>TOTAL RADICULAR</b></font></span></td>

																</tr><tr>
															
																<!-- New Strucutre L3-S1 -->
															          <%@ include file="CalculationReportPage.jsp" %>
																
																<!--New end new strucutre  -->
																</tr>
															</table>
															
															<!-- End New strucuture L3-S1  -->

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