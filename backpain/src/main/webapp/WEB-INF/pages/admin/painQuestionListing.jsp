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
				<td align="center" valign="top"><form:form method="post" action="${contextPath}/admin/painQuestionListing.html" id="criteria">
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
													<strong style="margin-left: 10px; font-size:15px;font-weight:bold;"> ${report.name} (Question Listing) </strong>
												</td>
											</tr>

											<tr>
												<td style="width: 123px; height: 420px" valign="top">
													<div>
														<c:set var="count" value="0" scope="page" />
														<table cellspacing="0" cellpadding="4" rules="rows"
															border="1"
															style="color: #333333; height: 95px; width: 718px; border-collapse: collapse;">
															<tr	style="color: White; background-color: #990000; font-weight: bold;">
																<th scope="col">Options</th>
																<!-- <th scope="col" style="width: 75px;">Min. Score</th> -->
																<th scope="col" style="width: 75px;">Score Setting (editable)</th>
																<th scope="col" style="width: 50px;">Min possible score</th>
																<th scope="col" style="width: 50px;">Max possible score</th>
																<th scope="col" style="width: 50px;">Master Update</th>
																
															</tr>
															
															<c:forEach items="${report.questionGroups}"
																var="questionGroup" varStatus="counter">
																
																<c:set var="maximumValue" value=""/>
																<c:set var="minimumValue" value=""/>
																
																<!-- Test -->
																
																
																<c:forEach items="${questionGroup.description}"
																	var="forMin" varStatus="counter">
																	
																	
																	
																	<c:forEach items="${questionGroup.questions}" var="list" varStatus="minValue" begin="2" end="2">
																		
																		<c:set var="maxValue" value="${list.maxScore}"/>
																		<c:set var="minValue" value="${list.maxScore}"/>
																		<c:set var="counting" value="0"/>
																		<c:set var="countingCompare" value="0"/>
																	
																	
																	<c:forEach items="${questionGroup.questions}"
																	var="minimumVal" varStatus="counter">
																	
																	
																	<c:if test="${minimumVal.parentEntityId ne null}"> 
																	
																	<c:set var="counting" value="${counting + 1}"/>
																	<c:set var="countingCompare" value="${countingCompare + 1}"/>	
																	
																	<%--  min--${minValue}  max--${minimumVal.maxScore}  --%>
																    <c:if test="${maxValue < minimumVal.maxScore}">
																		
																		<c:set var="smaxValue" value="${minimumVal.maxScore}"/>																		
																		<c:set var="maxValue" value="${minimumVal.maxScore}"/>																		
																	</c:if>
																	
																	 <c:if test="${minValue > minimumVal.maxScore}">
																		
																		<c:set var="smaxValue" value="${minimumVal.maxScore}"/>																		
																		<c:set var="minValue" value="${minimumVal.maxScore}"/>																		
																	</c:if>
																	
																	</c:if>
																		
																	</c:forEach>
																	  <%-- maxValue--${maxValue} 
																	  minValue--${minValue} --%>
																	<c:set var="minimumValue" value="${minValue}"/>	
																	<c:set var="maximumValue" value="${maxValue}"/>	  
																	  
																	<c:set var="maxValue" value="${list.maxScore}"/>	
																	</c:forEach>
																	
																	
																</c:forEach>
																<!--End test  -->
																 
															     <%-- ${counting} --%>
																 
																<tr>
																	<td colspan="5" class="tbl_red"><span
																		style="display: inline-block; width: 50%"> ${questionGroup.description}</span></td>
																		
																</tr>
																
															
																<c:forEach items="${questionGroup.questions}"
																	var="question" varStatus="counter">
																																		
																	<c:if test="${question.parentEntityId ne null}"> 
																	
																	<tr
																		style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' }">
																		<td>${question.questionText}</td>
																		<%-- <td style="width: 50px;">${question.minScore}</td> --%>
																		
																	<%-- 	<c:set var="minValue" value="0"/>
																		<c:set var="score" value="${question.maxScore}"></c:set> --%>
																		
																		
																		<%-- <c:if test="${score > minValue}">
																			
																		<c:set var="mnValue" value="${score}"/>
																		
																		</c:if>
																		
																		<c:out value="${mnValue}"></c:out> --%>
																									
																		
																		<td style="width: 75px;border:1px solid black;">${question.maxScore}</td>
																		
																		<c:if test="${counting eq countingCompare}">
																		
																		<td style="border:1px solid black;" rowspan="${counting}">${minimumValue}</td>
																		<td style="border:1px solid black;" rowspan="${counting}">${maximumValue}</td>
																		<c:set var="counting" value="${counting - 1}"/>
																		</c:if>
																		
																		<td style="width: 50px;"><a
																			href="${contextPath}/admin/${question.questionId}/question.html"
																			style="display: inline-block; width: 50px;">Edit</a></td>
																	</tr></c:if>
																</c:forEach>
																
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