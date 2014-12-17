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
														Pain History (Question Listing) </strong></td>
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
																	<th scope="col" style="width: 50px;">Most recent Pain (wk. Ago)</th>
																	<th scope="col" style="width: 50px;">Pain 1st appeared (yr ago)</th>
																	<th scope="col" style="width: 50px;">Current episode started (wk.ago)</th>

																</tr>
																<c:set var="newTableCounter" value="1" />
																<tr>
																	<td colspan="10" class="tbl_red"><span
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
																		
																		<c:forEach var="recentColumn" items="${recentColumn}">
																			<c:if test="${question.questionId == recentColumn.key}">
																			<c:set var="recentPain" value="${recentColumn.value}" />
																			</c:if>
																		</c:forEach>
																																				
																		<c:forEach var="newColumn" items="${newColumn}">
																			<c:if test="${question.questionId == newColumn.key}">
																			<c:set var="firstPain" value="${newColumn.value}" />
																			</c:if>
																		</c:forEach>
																		
																		<c:forEach var="currentColumn" items="${currentColumn}">
																			<c:if test="${question.questionId == currentColumn.key}">
																			<c:set var="currentPain" value="${currentColumn.value}" />
																			</c:if>
																		</c:forEach>
																		
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
																						
																					<td style="border: 1px solid black;" id="recent${newTableCounter}"
																						rowspan="${counting}">${recentPain}</td>
																					<td style="border: 1px solid black;" id="first${newTableCounter}"
																						rowspan="${counting}">${firstPain}</td>
																					<td style="border: 1px solid black;" id="current${newTableCounter}"
																						rowspan="${counting}">${currentPain}</td>
																					<!-- Initialize value of firstPain -->
																					<c:set var="firstPain" value="" />
																					<c:set var="recentPain" value="" />
																					<c:set var="currentPain" value="" />
																					<c:set var="newTableCounter" value="${newTableCounter + 1}" />
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
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	
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
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																</tr>
																<c:set var="leftPainDataSum" value="${leftPainSum}" />
																<c:set var="rightPainDataSum" value="${rightPainSum}" />
																<!-- End table d1  -->



																<!-- Start table d2 other table-->
																
																<!-- Start new repoer implemnetation-->
																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="7"
																		bgcolor="#990000" colspan="7"><font color="white">Most recent leg or foot pain (minimum)</font></td>
																	<td style="border: 1px solid black;" id="finalRecent">a</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																</tr>
																
																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="7"
																		bgcolor="#990000" colspan="7"><font color="white">Leg or Foot Pain first appeared (Max)</font></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;" id="finalFirst">a</td>
																	<td style="border: 1px solid black;"></td>
																</tr>
																
																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="7"
																		bgcolor="#990000" colspan="7"><font color="white">Current episode of Leg or Foot Pain started (Max)</font></td>
																	<td style="border: 1px solid black;" ></td>
																	<td style="border: 1px solid black;" ></td>
																	<td style="border: 1px solid black;" id="finalCurrent">a</td>
																</tr>
																
																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" colspan="7"
																		bgcolor="#990000" colspan="7"><font color="white">Low back pain first started</font></td>
																	<td style="border: 1px solid black;" ></td>
																	<td style="border: 1px solid black;" id="finalLast">a</td>
																	<td style="border: 1px solid black;" ></td>
																</tr>
																
																<!-- end new repoer implemnetation-->

																<!-- Dermotome table -->
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td colspan="10" class="tbl_red"><span
																		style="display: inline-block; width: 50%"><font><b>DERMATOME
																				REPORT</b></font></span></td>
																</tr>


																<tr bgcolor="#990000">
																	<td style="border: 1px solid black;" colspan="3"></td>
																	<td style="border: 1px solid black;" colspan="2"><font
																		color="white">*Scores (L3-S1 )</font></td>
																	<td style="border: 1px solid black;" colspan="2"><font
																		color="white">Limits</font></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
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
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																</tr>

																<tr
																	style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border:1px solid black;">
																	<td style="border: 1px solid black;" bgcolor="#990000"
																		colspan="3"><font color="white">Pain</font></td>
																	<td style="border: 1px solid black;">${rightPainDataSum}</td>
																	<td style="border: 1px solid black;">${leftPainDataSum}</td>
																	<td style="border: 1px solid black;">0</td>
																	<td style="border: 1px solid black;">10</td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
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
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
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
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
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
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																	<td style="border: 1px solid black;"></td>
																</tr>
																<!-- End dermotome table -->
                                                            <input type="hidden" value="${contextPath}/admin/${client.clientId}/hnpPhases.html" id="URL"/>
                                                            <input type="hidden" value="${redirectVal}" id="redirect"/>
                                                            <input type="hidden" value="${val293}" id="val293"/>
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

	$( document ).ready(function() {
	   
	  
	   var mostRecent3= document.getElementById('recent3').innerHTML;
	   var mostRecent4= document.getElementById('recent4').innerHTML;
	   var mostRecent5= document.getElementById('recent5').innerHTML;
	   
	   var recentArr = [mostRecent3,mostRecent4,mostRecent5];
       var recentMin = Math.min.apply(null, recentArr);
	   document.getElementById('finalRecent').innerHTML=recentMin;
	  
	
	   var current3= document.getElementById('current3').innerHTML;
	   var current4= document.getElementById('current4').innerHTML;
	   var current5= document.getElementById('current5').innerHTML;
	   
	   var arr = [current3,current4,current5];
	   var max = Math.max.apply(null, arr);
	   
	   document.getElementById('finalCurrent').innerHTML=max;
	   
	   
	   var first3= document.getElementById('first3').innerText;
	   var first4= document.getElementById('first4').innerText;
	   var first5= document.getElementById('first5').innerText;
	   
	 
	   if(first3==">5"){
		   first3=6;
		   
	   }
	   if(first4==">5"){
		   first4=6;
		   
	   }
	   if(first5==">5"){
		   first5=6;
		   
	   }
	   
	  

	   
	   var firstArr = [first3,first4,first5];
	   var minFirst = Math.max.apply(null, firstArr);
	   if(minFirst==6){
		   minFirst=">5"; 
	   }
	   document.getElementById('finalFirst').innerHTML=minFirst;
	   var finalLast=document.getElementById('first1').innerText;
	   document.getElementById('finalLast').innerHTML=finalLast;
	   
	   var redirectVal= document.getElementById("redirect").value;
	   
	   var URL=document.getElementById("URL").value;
	   
	   var val293=document.getElementById("val293").value;
	   
	   var footCurrent=document.getElementById("current5").innerText;
	   
	   var footCurrentPain=document.getElementById("recent5").innerText;
	   
	   
	   
	   var parameterURL=URL+"?recent="+recentMin+"&firstPain="+minFirst+"&current="+max+"&lowBack="+finalLast+"&val293="+val293+"&currentFoot="+footCurrent+"&footCurrentPain="+footCurrentPain;
	   
	   
	});

function showPage(pageId) {
	$("#pageId").val(pageId);
	$('#criteria').submit();	
}



</script>


</body>
</html>