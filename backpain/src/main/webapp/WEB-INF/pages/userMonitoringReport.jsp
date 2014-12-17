<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->

	<jsp:include page="header.jsp" /> 
<body>

	<table width="980" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>

			 <jsp:include page="banner.jsp" />
        
             <jsp:include page="userInfo.jsp" />

			<tr>
			
				<td align="center" valign="top">
					<table width="980" border="0" cellspacing="0" cellpadding="0">
					
					
						<tbody>
							<tr>
								<td width="238" align="left" valign="top"><jsp:include
										page="left.jsp" /></td>
								<td width="15">&nbsp;</td>
								
								
								
								
								
								
								
								<td width="727" align="left" valign="top">
								
								<!-- Start -->
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
															
															</tbody>
														</table> 
								<!-- End -->
								
								
								
								
								
								
								
									<table width="727" border="0" cellpadding="0" cellspacing="0" class="data-table" id="table1">
										
								
    
										<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    															
																<c:set var="otherSiteColspan" value="11"/>
																
										</tr>
																<thead>
															
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px"></th>
																	<th scope="col" style="border: 1px solid black;" colspan="12" id="painTH">Pain</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" colspan="11" rowspan="2" id="numbness">Numb</th>

																	
																	<th scope="col" style="width: 50px;border: 1px solid black;" rowspan="2" colspan="6" id="muscle">weak</th>
																	<th scope="col" style="width: 50px;border: 1px solid black;" rowspan="2" colspan="2" id="legRaising">Leg Raise</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" rowspan="2" colspan="2" id="worstpain">Worst<br> pain</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" rowspan="3" colspan="2" id="tablet">Tabl</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" rowspan="3" colspan="2" id="yoga">Yoga<br>(min)</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" rowspan="3" colspan="2" id="comments">Comment</th>
																	
																	

																</tr>
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="width: 50px;border: 1px solid black;border-bottom: 0px;border-top: 0px">Date</th>
																	<th scope="col" style="border: 1px solid black;" class="lowerBack">LB</th>
																	<th scope="col" style="width: 75px;border: 1px solid black;" colspan="11" id="otherSite">Other sites</th>
																
																</tr>
																<tr
																	style="color: White; background-color: #990000; font-weight: bold;">
																	<th scope="col" style="border: 1px solid black;border-bottom: 0px;border-top: 0px"></th>
																	<th scope="col" style="border: 1px solid black;" class="lowerBack"></th>
																	
																	<th scope="col" style="border: 1px solid black;" class="Groin1">Gr</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftButtock1">Left<br> Bt</th>
																	<th scope="col" style="border: 1px solid black;" class="Leftthighfront1">Left<br> Th-Fr</th>
																	<th scope="col" style="border: 1px solid black;" class="Leftthighback1">Left<br> Th-Bk</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftShincalf1">Left<br> Sh</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftFootankle1">Left<br> Ft</th>
																	
																	<th scope="col" style="border: 1px solid black;" class="RightButtock1">Right<br> Bt</th>
																	<th scope="col" style="border: 1px solid black;" class="Rightthighfront1">Right<br> Th-Fr</th>
																	<th scope="col" style="border: 1px solid black;" class="Rightthighback1">Right<br> Th-Bk</th>
																	<th scope="col" style="border: 1px solid black;" class="RightShincalf1">Right<br> Sh</th>
																	<th scope="col" style="border: 1px solid black;" class="RightFootankle1">Right<br> Ft</th>
																	
																	
																	<th scope="col" style="border: 1px solid black;" class="Groin2">Gr</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftButtock2">Left<br> Bt</th>
																	<th scope="col" style="border: 1px solid black;" class="Leftthighfront2">Left<br> Th-Fr</th>
																	<th scope="col" style="border: 1px solid black;" class="Leftthighback2">Left<br> Th-Bk</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftShincalf2">Left<br> Sh</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftFootankle2">Left<br> Ft</th>
																	
																	<th scope="col" style="border: 1px solid black;" class="RightButtock2">Right<br> Bt</th>
																	<th scope="col" style="border: 1px solid black;" class="Rightthighfront2">Right<br> Th-Fr</th>
																	<th scope="col" style="border: 1px solid black;" class="Rightthighback2">Right<br> Th-Bk</th>
																	<th scope="col" style="border: 1px solid black;" class="RightShincalf2">Right<br> Sh</th>
																	<th scope="col" style="border: 1px solid black;" class="RightFootankle2">Right<br> Ft</th>
																	
																	
																	<th scope="col" style="border: 1px solid black;" class="Leftthighback3">Left<br> Th-Bk</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftShincalf3">Left<br> Sh</th>
																	<th scope="col" style="border: 1px solid black;" class="LeftFootankle3">Left<br> Ft</th>
																	
																	<th scope="col" style="border: 1px solid black;" class="Rightthighback3">Right<br> Th-Bk</th>
																	<th scope="col" style="border: 1px solid black;" class="RightShincalf3">Right<br> Sh</th>
																	<th scope="col" style="border: 1px solid black;" class="RightFootankle3">Right<br> Ft</th>	
																	
																	<th scope="col" style="border: 1px solid black;" class="Leftleg4">Left<br> Lg</th>
																	<th scope="col" style="border: 1px solid black;" class="Rightleg4">Right<br> Lg</th>
																	
																	<th scope="col" style="border: 1px solid black;" class="legOrFootWorst">Lg/Ft</th>
																	<th scope="col" style="border: 1px solid black;" class="LowerBackWorst">LB</th>																
																</tr>
																
																</thead>
																<tbody>
																
										
										<c:set var="mydate" value="${listMoniter[0].formsubmitdate}"/>
										<c:set var="mydate1" value="${listMoniter[0].formsubmitdate}"/>
										
										<c:set var="tableCounter" value="0" />
										<c:forEach var="list" items="${listMoniter}" varStatus="a">
										
										<c:set var="totalLength" value="${fn:length(listMoniter)}"/>
										
										<c:if test="${a.count == 1}">
																<c:set var="lowerBack" value="N"/>
																<c:set var="questionOneCBone" value="N"/>
																<c:set var="questionOneCBtwo" value="N"/>
																<c:set var="questionOneCBfour" value="N"/>
																<c:set var="questionOneCBsix" value="N"/>
																<c:set var="questionOneCBeight" value="N"/>
																<c:set var="questionOneCBten" value="N"/>
																<c:set var="questionOneCBthree" value="N"/>
																<c:set var="questionOneCBfive" value="N"/>
																<c:set var="questionOneCBseven" value="N"/>
																<c:set var="questionOneCBnine" value="N"/>
																<c:set var="questionOneCeleven" value="N"/>
																<c:set var="questionTwoCBone" value="N"/>
																<c:set var="questionTwoCBtwo" value="N"/>
																<c:set var="questionTwoCBfour" value="N"/>
																<c:set var="questionTwoCBeight" value="N"/>
																<c:set var="questionTwoCBten" value="N"/>
																<c:set var="questionTwoCBthree" value="N"/>
																<c:set var="questionTwoCBfive" value="N"/>
																<c:set var="questionTwoCBseven" value="N"/>
																<c:set var="questionTwoCBnine" value="N"/>
																<c:set var="questionTwoCeleven" value="N"/>
																<c:set var="questionTwoCBsix" value="N"/>
																
																<c:set var="questionThreeCBone" value="N"/>
																<c:set var="questionThreeCBthree" value="N"/>
																<c:set var="questionThreeCBfive" value="N"/>
																<c:set var="questionThreeCBtwo" value="N"/>
																<c:set var="questionThreeCBfour" value="N"/>
																<c:set var="questionThreeCBsix" value="N"/>
																<c:set var="answerFourthOne" value="N"/>
																<c:set var="answerFourthTwo" value="N"/>
																<c:set var="answerFourthFifth" value="N"/>
																
																<c:set var="answerWorst1" value="N"/>
																<c:set var="answerWorst2" value="N"/>
																<c:set var="answerTablet" value="N"/>
																<c:set var="answerComment" value="N"/>
																
										</c:if>
										
										
										<c:if test="${mydate1 ne list.formsubmitdate}">	
																	
																	<c:set var="tableCounter" value="${tableCounter+1}" />
																	<c:set var="datColumn" value="${fn:split(mydate1,' ')}" />
																	<c:forEach var="datColumn1" items="${datColumn}"  varStatus="status" begin="0" end="0">
																	
																	 <c:set var="datColumn" value="${datColumn1}" /> 
																
																	</c:forEach>
																										
																	<tr style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border: 1px solid black;">
																	<td style=" border: 1px solid black;" title="${fn:substring(mydate1,0,16)}" id="date">${fn:substring(mydate1,0,5)}</td>
																<%-- <td style=" border: 1px solid black;" id="date">${mydate1}</td> --%>
																	<td style=" border: 1px solid black;" id="lowerBack${tableCounter}" class="lowerBack">${lowerBack}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBone${tableCounter}" class="Groin1">${questionOneCBone}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBtwo${tableCounter}" class="LeftButtock1">${questionOneCBtwo}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBfour${tableCounter}" class="Leftthighfront1">${questionOneCBfour}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBsix${tableCounter}" class="Leftthighback1">${questionOneCBsix}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBeight${tableCounter}" class="LeftShincalf1">${questionOneCBeight}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBten${tableCounter}" class="LeftFootankle1">${questionOneCBten}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBthree${tableCounter}" class="RightButtock1">${questionOneCBthree}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBfive${tableCounter}" class="Rightthighfront1">${questionOneCBfive}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBseven${tableCounter}" class="Rightthighback1">${questionOneCBseven}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBnine${tableCounter}" class="RightShincalf1">${questionOneCBnine}</td>
																	<td style=" border: 1px solid black;" id="questionOneCeleven${tableCounter}" class="RightFootankle1">${questionOneCeleven}</td>
																	
																	<td style=" border: 1px solid black;" id="questionTwoCBone${tableCounter}" class="Groin2">${questionTwoCBone}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBtwo${tableCounter}" class="LeftButtock2">${questionTwoCBtwo}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBfour${tableCounter}" class="Leftthighfront2">${questionTwoCBfour}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBsix${tableCounter}" class="Leftthighback2">${questionTwoCBsix}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBeight${tableCounter}" class="LeftShincalf2">${questionTwoCBeight}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBten${tableCounter}" class="LeftFootankle2">${questionTwoCBten}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBthree${tableCounter}" class="RightButtock2">${questionTwoCBthree}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBfive${tableCounter}" class="Rightthighfront2">${questionTwoCBfive}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBseven${tableCounter}" class="Rightthighback2">${questionTwoCBseven}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBnine${tableCounter}" class="RightShincalf2">${questionTwoCBnine}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCeleven${tableCounter}" class="RightFootankle2">${questionTwoCeleven}</td>
																	
																	<td style=" border: 1px solid black;" id="questionThreeCBone${tableCounter}" class="Leftthighback3">${questionThreeCBone}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBthree${tableCounter}" class="LeftShincalf3">${questionThreeCBthree}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBfive${tableCounter}" class="LeftFootankle3">${questionThreeCBfive}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBtwo${tableCounter}" class="Rightthighback3">${questionThreeCBtwo}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBfour${tableCounter}" class="RightShincalf3">${questionThreeCBfour}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBsix${tableCounter}" class="RightFootankle3">${questionThreeCBsix}</td>
																	
																	<td style=" border: 1px solid black;" id="answerFourthOne${tableCounter}" class="Leftleg4">${answerFourthOne}</td>
																	<td style=" border: 1px solid black;" id="answerFourthTwo${tableCounter}" class="Rightleg4">${answerFourthTwo}</td>
																	
																	<td style=" border: 1px solid black;" colspan="1" id="answerWorstOne${tableCounter}" class="legOrFootWorst">${answerWorst1}</td>
																	<td style=" border: 1px solid black;" colspan="1" id="answerWorstTwo${tableCounter}" class="LowerBackWorst">${answerWorst2}</td>
																	
																	<td style=" border: 1px solid black;" colspan="2" id="answerTablet${tableCounter}" class="answerTablet">${answerTablet}</td>
																	<td style=" border: 1px solid black;" id="answerFourthFifth${tableCounter}" class="answerFifth" colspan="2">${answerFourthFifth}</td>
																	<td style=" border: 1px solid black;" colspan="2" id="answerComment${tableCounter}" class="answerComment" title="${answerComment}"><c:if test="${fn:length(answerComment) > 8}">${fn:substring(answerComment, 0, 8)}..
																	</c:if>
																	<c:if test="${fn:length(answerComment) <= 8}">
																	${answerComment}
																	</c:if>
																	</td>
																	<c:set var="mydate1" value="${list.formsubmitdate}"/>
																	
																<c:set var="lowerBack" value="N"/>
																<c:set var="questionOneCBone" value="N"/>
																<c:set var="questionOneCBtwo" value="N"/>
																<c:set var="questionOneCBfour" value="N"/>
																<c:set var="questionOneCBsix" value="N"/>
																<c:set var="questionOneCBeight" value="N"/>
																<c:set var="questionOneCBten" value="N"/>
																<c:set var="questionOneCBthree" value="N"/>
																<c:set var="questionOneCBfive" value="N"/>
																<c:set var="questionOneCBseven" value="N"/>
																<c:set var="questionOneCBnine" value="N"/>
																<c:set var="questionOneCeleven" value="N"/>
																<c:set var="questionTwoCBone" value="N"/>
																<c:set var="questionTwoCBtwo" value="N"/>
																<c:set var="questionTwoCBfour" value="N"/>
																<c:set var="questionTwoCBeight" value="N"/>
																<c:set var="questionTwoCBten" value="N"/>
																<c:set var="questionTwoCBthree" value="N"/>
																<c:set var="questionTwoCBfive" value="N"/>
																<c:set var="questionTwoCBseven" value="N"/>
																<c:set var="questionTwoCBnine" value="N"/>
																<c:set var="questionTwoCeleven" value="N"/>
																<c:set var="questionTwoCBsix" value="N"/>
																
																
																<c:set var="questionThreeCBone" value="N"/>
																<c:set var="questionThreeCBthree" value="N"/>
																<c:set var="questionThreeCBfive" value="N"/>
																<c:set var="questionThreeCBtwo" value="N"/>
																<c:set var="questionThreeCBfour" value="N"/>
																<c:set var="questionThreeCBsix" value="N"/>
																
																<c:set var="answerFourthOne" value="N"/>
																<c:set var="answerFourthTwo" value="N"/>
																
																<c:set var="answerWorst1" value="N"/>
																<c:set var="answerWorst2" value="N"/>
																<c:set var="answerTablet" value="N"/>
																<c:set var="answerComment" value="N"/>
																
																
																<c:set var="answerFourthFifth" value="N"/>
																</tr>
																</c:if>
											
																<c:if test="${mydate1 eq list.formsubmitdate}">
																
																<c:set var="flagValues" value="false"/>
                                                                </c:if>
										 <c:set var="setId" value="${list.setid}"/>
										 											 	
										 	
											<c:if test="${mydate ne list.formsubmitdate}">	
												<c:set var="mydate" value="${list.formsubmitdate}"/>
												<c:set var="FlagVal" value="false"/>	
												 										
												
											</c:if>
											
											<c:if test="${mydate eq list.formsubmitdate}">
											
											<%--  matched: <c:out value="${list.questionid}"></c:out> --%>
											    
												
												<c:set var="questionId" value="${list.questionid}"/>
												<c:set var="FlagVal" value="true"/>
												
											 <c:if test="${setId eq 1}">
											
											   <c:if test="${questionId == 466}">
											    <c:set var="lowerBack" value="Y"/>
											   </c:if>
											   
											   <c:if test="${questionId eq 439}">
											   
											   <c:set var="answerFirst" value="${list.answertext}"/>
											   
											  
											   <c:set var="string1" value="${fn:split(answerFirst,', ')}" />
											   
											   
											   <c:forEach var="stringList" items="${string1}"  varStatus="status">
											    
											   
                       										
											     <%-- -<c:out value="${stringList}"></c:out> --%>
											     
											     
											    <c:if test="${stringList == '1'}">
											   
											      <c:set var="questionOneCBone" value="Y"/>
											    </c:if>
											     
											    <c:if test="${stringList == '2'}">
											   
											      <c:set var="questionOneCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '3'}">
											 
											      <c:set var="questionOneCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList == '4'}">
											      <c:set var="questionOneCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '5'}">
											      <c:set var="questionOneCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '6'}">
											      <c:set var="questionOneCBsix" value="Y"/>
											     </c:if>  
											     
											     <c:if test="${stringList == '7'}">
											      <c:set var="questionOneCBseven" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '8'}">
											      <c:set var="questionOneCBeight" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '9'}">
											      <c:set var="questionOneCBnine" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '10'}">
											      <c:set var="questionOneCBten" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '11'}">
											      <c:set var="questionOneCeleven" value="Y"/>
											     </c:if> 
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   <c:if test="${questionId eq 440}">
											   
											   <c:set var="answerSecond" value="${list.answertext}"/>
											   <c:set var="string2" value="${fn:split(answerSecond, ', ')}" />
											   
											   
											     <c:forEach var="stringList2" items="${string2}">
											    
											     <%-- -<c:out value="${stringList2}"></c:out> --%>
											     
											     
											     <c:if test="${stringList2 == '1'}">
											      
											      <c:set var="questionTwoCBone" value="Y"/>
											     </c:if>
											     
											    <c:if test="${stringList2 == '2'}">
											      
											      <c:set var="questionTwoCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '3'}">
											   
											      <c:set var="questionTwoCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList2 == '4'}">
											    
											      <c:set var="questionTwoCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '5'}">
											    
											      <c:set var="questionTwoCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '6'}">
											     
											      <c:set var="questionTwoCBsix" value="Y"/>
											     </c:if>  
											     
											     <c:if test="${stringList2 == '7'}">
											     
											      <c:set var="questionTwoCBseven" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '8'}">
											     
											      <c:set var="questionTwoCBeight" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '9'}">
											    
											      <c:set var="questionTwoCBnine" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '10'}">
											     
											     
											      <c:set var="questionTwoCBten" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '11'}">
											    
											      <c:set var="questionTwoCeleven" value="Y"/>
											     </c:if> 
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   
											   <c:if test="${questionId eq 441}">
											   
											   <c:set var="answerThird" value="${list.answertext}"/>
											   <c:set var="string3" value="${fn:split(answerThird, ', ')}" />
											   
											   
											     <c:forEach var="stringList3" items="${string3}">
											      
											    
											     
											     
											     <c:if test="${stringList3 == '1'}">
											       
											      <c:set var="questionThreeCBone" value="Y"/>
											     </c:if>
											     
											    <c:if test="${stringList3 == '2'}">
											     
											      <c:set var="questionThreeCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '3'}">
											   
											      <c:set var="questionThreeCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList3 == '4'}">
											   
											      <c:set var="questionThreeCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '5'}">
											     
											      <c:set var="questionThreeCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '6'}">
											     
											      <c:set var="questionThreeCBsix" value="Y"/>
											     </c:if>  
											     
											    
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   <c:if test="${questionId eq 442}">
											      <c:if test="${list.answertext eq 'Less than a quarter of the way up'}">
											      <c:set var="answerFourthOne" value="<1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About a quarter of the way up'}">
											      <c:set var="answerFourthOne" value="1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About half way up'}">
											      <c:set var="answerFourthOne" value="1/2"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'More than half way up'}">
											      <c:set var="answerFourthOne" value=">1/2"/>
											      </c:if>
											   
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 446}">
											    
											      <c:if test="${list.answertext eq 'Less than a quarter of the way up'}">
											      <c:set var="answerFourthTwo" value="<1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About a quarter of the way up'}">
											      <c:set var="answerFourthTwo" value="1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About half way up'}">
											      <c:set var="answerFourthTwo" value="1/2"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'More than half way up'}">
											      <c:set var="answerFourthTwo" value=">1/2"/>
											      </c:if>
											   
											    
											   </c:if>
											   
											   <c:if test="${questionId eq 494}">
											     
											     <c:set var="answerWorst1" value="${list.answertext}"/>
											     
											   </c:if>
											   
											   
											   <c:if test="${questionId eq 443}">
											   
											     <c:if test="${list.answertext eq '2'}">
											     <c:set var="answerWorst2" value="Y"/>
											     </c:if>
											   
											     
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 447}">
											      
											      <c:if test="${list.answertext eq '1'}">
											      <c:set var="answerTablet" value="N"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '2'}">
											      <c:set var="answerTablet" value="Less than 4"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '3'}">
											      <c:set var="answerTablet" value="4-8"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '4'}">
											      <c:set var="answerTablet" value="8-12"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '5'}">
											      <c:set var="answerTablet" value=">12"/>
											      </c:if>
											   
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 445}">
											   
											     <c:set var="answerComment" value="${list.answertext}"/>
											     
											   </c:if>
											  
											   <c:if test="${questionId eq 491}">
											   
											     <c:set var="answerFourthFifth" value="${list.answertext}"/>
											     
											   </c:if>
											  
											   
											  
											 </c:if>
											 
											 <c:if test="${setId eq 2}">
											    
											 
											 <c:if test="${questionId == 475}">
											    <c:set var="lowerBack" value="Y"/>
											 </c:if>
											   
											   
											   
											   <c:if test="${questionId eq 449}">
											   
											   <c:set var="answerSecond" value="${list.answertext}"/>
											   
											
											   
											  
											   <c:set var="string1" value="${fn:split(answerSecond,', ')}" />
											   
											   
											   <c:forEach var="stringList" items="${string1}"  varStatus="status">
											  
											     <%-- -<c:out value="${stringList}"></c:out> --%>
											     
											     
											    <c:if test="${stringList == '1'}">
											   
											      <c:set var="questionOneCBone" value="Y"/>
											    </c:if>
											     
											    <c:if test="${stringList == '2'}">
											   
											      <c:set var="questionOneCBtwo" value="Y"/>
											     </c:if>
											    
											     
											     <c:if test="${stringList == '3'}">
											 
											      <c:set var="questionOneCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList == '4'}">
											      <c:set var="questionOneCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '5'}">
											      <c:set var="questionOneCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '6'}">
											      <c:set var="questionOneCBsix" value="Y"/>
											     </c:if>  
											     
											     <c:if test="${stringList == '7'}">
											      <c:set var="questionOneCBseven" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '8'}">
											      <c:set var="questionOneCBeight" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '9'}">
											      <c:set var="questionOneCBnine" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '10'}">
											      <c:set var="questionOneCBten" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '11'}">
											      <c:set var="questionOneCeleven" value="Y"/>
											     </c:if> 
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   <c:if test="${questionId eq 450}">
											   
											   <c:set var="answerSecond" value="${list.answertext}"/>
											   <c:set var="string2" value="${fn:split(answerSecond, ', ')}" />
											   
											   
											     <c:forEach var="stringList2" items="${string2}">
											    
											     <%-- -<c:out value="${stringList2}"></c:out> --%>
											     
											     
											     <c:if test="${stringList2 == '1'}">
											      
											      <c:set var="questionTwoCBone" value="Y"/>
											     </c:if>
											     
											    <c:if test="${stringList2 == '2'}">
											      
											      <c:set var="questionTwoCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '3'}">
											   
											      <c:set var="questionTwoCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList2 == '4'}">
											    
											      <c:set var="questionTwoCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '5'}">
											    
											      <c:set var="questionTwoCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '6'}">
											     
											      <c:set var="questionTwoCBsix" value="Y"/>
											     </c:if>  
											     
											     <c:if test="${stringList2 == '7'}">
											     
											      <c:set var="questionTwoCBseven" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '8'}">
											     
											      <c:set var="questionTwoCBeight" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '9'}">
											    
											      <c:set var="questionTwoCBnine" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '10'}">
											     
											     
											      <c:set var="questionTwoCBten" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '11'}">
											    
											      <c:set var="questionTwoCeleven" value="Y"/>
											     </c:if> 
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   
											   <c:if test="${questionId eq 451}">
											   
											   <c:set var="answerThird" value="${list.answertext}"/>
											   <c:set var="string3" value="${fn:split(answerThird, ', ')}" />
											   
											   
											     <c:forEach var="stringList3" items="${string3}">
											      
											   
											     
											     
											     <c:if test="${stringList3 == '1'}">
											       
											      <c:set var="questionThreeCBone" value="Y"/>
											     </c:if>
											     
											    <c:if test="${stringList3 == '2'}">
											     
											      <c:set var="questionThreeCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '3'}">
											   
											      <c:set var="questionThreeCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList3 == '4'}">
											   
											      <c:set var="questionThreeCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '5'}">
											     
											      <c:set var="questionThreeCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '6'}">
											     
											      <c:set var="questionThreeCBsix" value="Y"/>
											     </c:if>  
											     
											    
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   <c:if test="${questionId eq 452}">
											      <c:if test="${list.answertext eq 'Less than a quarter of the way up'}">
											      <c:set var="answerFourthOne" value="<1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About a quarter of the way up'}">
											      <c:set var="answerFourthOne" value="1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About half way up'}">
											      <c:set var="answerFourthOne" value="1/2"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'More than half way up'}">
											      <c:set var="answerFourthOne" value=">1/2"/>
											      </c:if>
											   
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 453}">
											     
											      <c:if test="${list.answertext eq 'Less than a quarter of the way up'}">
											      <c:set var="answerFourthTwo" value="<1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About a quarter of the way up'}">
											      <c:set var="answerFourthTwo" value="1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About half way up'}">
											      <c:set var="answerFourthTwo" value="1/2"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'More than half way up'}">
											      <c:set var="answerFourthTwo" value=">1/2"/>
											      </c:if>
											    
											   </c:if>
											   
											   
											   <c:if test="${questionId eq 495}">
											   
											     <c:set var="answerWorst1" value="${list.answertext}"/>
											     
											   </c:if>
											   
											    <c:if test="${questionId eq 448}">
											   
											     
											     <c:if test="${list.answertext eq '2'}">
											     <c:set var="answerWorst2" value="Y"/>
											     </c:if>
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 454}">
											   
											      <c:if test="${list.answertext eq '1'}">
											      <c:set var="answerTablet" value="N"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '2'}">
											      <c:set var="answerTablet" value="Less than 4"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '3'}">
											      <c:set var="answerTablet" value="4-8"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '4'}">
											      <c:set var="answerTablet" value="8-12"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '5'}">
											      <c:set var="answerTablet" value=">12"/>
											      </c:if>
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 456}">
											   
											     <c:set var="answerComment" value="${list.answertext}"/>
											     
											   </c:if>
											   
											  
											   <c:if test="${questionId eq 492}">
											    
											     <c:set var="answerFourthFifth" value="${list.answertext}"/>
											     
											   </c:if>
											  
											   
											 

											 </c:if>
											 
											 <c:if test="${setId eq 3}">
											 
											 
											      
											 
											 <c:if test="${questionId == 483}">
											    <c:set var="lowerBack" value="Y"/>
											   </c:if>
											   
											   
											   
											   <c:if test="${questionId eq 458}">
											   
											   <c:set var="answerSecond" value="${list.answertext}"/>
											   
											  
											   <c:set var="string1" value="${fn:split(answerSecond,', ')}" />
											   
											   
											   <c:forEach var="stringList" items="${string1}"  varStatus="status">
											  
											   
                       										
											     <%-- -<c:out value="${stringList}"></c:out> --%>
											     
											     
											    <c:if test="${stringList == '1'}">
											   
											      <c:set var="questionOneCBone" value="Y"/>
											    </c:if>
											     
											    <c:if test="${stringList == '2'}">
											   
											      <c:set var="questionOneCBtwo" value="Y"/>
											     </c:if>
											    
											     
											     <c:if test="${stringList == '3'}">
											 
											      <c:set var="questionOneCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList == '4'}">
											      <c:set var="questionOneCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '5'}">
											      <c:set var="questionOneCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '6'}">
											      <c:set var="questionOneCBsix" value="Y"/>
											     </c:if>  
											     
											     <c:if test="${stringList == '7'}">
											      <c:set var="questionOneCBseven" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '8'}">
											      <c:set var="questionOneCBeight" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '9'}">
											      <c:set var="questionOneCBnine" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '10'}">
											      <c:set var="questionOneCBten" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList == '11'}">
											      <c:set var="questionOneCeleven" value="Y"/>
											     </c:if> 
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   <c:if test="${questionId eq 459}">
											   
											   <c:set var="answerSecond" value="${list.answertext}"/>
											   <c:set var="string2" value="${fn:split(answerSecond, ', ')}" />
											   
											   
											     <c:forEach var="stringList2" items="${string2}">
											    
											   <%--   <c:out value="${stringList2}"></c:out> --%>
											     
											     
											     <c:if test="${stringList2 == '1'}">
											      
											      <c:set var="questionTwoCBone" value="Y"/>
											     </c:if>
											     
											    <c:if test="${stringList2 == '2'}">
											      
											      <c:set var="questionTwoCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '3'}">
											   
											      <c:set var="questionTwoCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList2 == '4'}">
											    
											      <c:set var="questionTwoCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '5'}">
											    
											      <c:set var="questionTwoCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '6'}">
											     
											      <c:set var="questionTwoCBsix" value="Y"/>
											     </c:if>  
											     
											     <c:if test="${stringList2 == '7'}">
											     
											      <c:set var="questionTwoCBseven" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '8'}">
											     
											      <c:set var="questionTwoCBeight" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '9'}">
											    
											      <c:set var="questionTwoCBnine" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '10'}">
											     
											     
											      <c:set var="questionTwoCBten" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList2 == '11'}">
											    
											      <c:set var="questionTwoCeleven" value="Y"/>
											     </c:if> 
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   
											   <c:if test="${questionId eq 460}">
											   
											   <c:set var="answerThird" value="${list.answertext}"/>
											   <c:set var="string3" value="${fn:split(answerThird, ', ')}" />
											   
											   
											     <c:forEach var="stringList3" items="${string3}">
											      
											     
											     
											     
											     <c:if test="${stringList3 == '1'}">
											       
											      <c:set var="questionThreeCBone" value="Y"/>
											     </c:if>
											     
											    <c:if test="${stringList3 == '2'}">
											     
											      <c:set var="questionThreeCBtwo" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '3'}">
											   
											      <c:set var="questionThreeCBthree" value="Y"/>
											     </c:if> 
											     
											     <c:if test="${stringList3 == '4'}">
											   
											      <c:set var="questionThreeCBfour" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '5'}">
											     
											      <c:set var="questionThreeCBfive" value="Y"/>
											     </c:if>
											     
											     <c:if test="${stringList3 == '6'}">
											     
											      <c:set var="questionThreeCBsix" value="Y"/>
											     </c:if>  
											     
											    
											     
											    
											     </c:forEach>
											  
											  
											   </c:if>
											   
											   <c:if test="${questionId eq 461}">
											      <c:if test="${list.answertext eq 'Less than a quarter of the way up'}">
											      <c:set var="answerFourthOne" value="<1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About a quarter of the way up'}">
											      <c:set var="answerFourthOne" value="1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About half way up'}">
											      <c:set var="answerFourthOne" value="1/2"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'More than half way up'}">
											      <c:set var="answerFourthOne" value=">1/2"/>
											      </c:if>
											     
											   
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 462}">
											    
											      <c:if test="${list.answertext eq 'Less than a quarter of the way up'}">
											      <c:set var="answerFourthTwo" value="<1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About a quarter of the way up'}">
											      <c:set var="answerFourthTwo" value="1/4"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'About half way up'}">
											      <c:set var="answerFourthTwo" value="1/2"/>
											      </c:if>
											      <c:if test="${list.answertext eq 'More than half way up'}">
											      <c:set var="answerFourthTwo" value=">1/2"/>
											      </c:if>
											    
											   </c:if>
									
									           
											   <c:if test="${questionId eq 496}">
											   
											     <c:set var="answerWorst1" value="${list.answertext}"/>
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 457}">
											   
											     
											     <c:if test="${list.answertext eq '2'}">
											     <c:set var="answerWorst2" value="Y"/>
											     </c:if>
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 463}">
											   
											      <c:if test="${list.answertext eq '1'}">
											      <c:set var="answerTablet" value="N"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '2'}">
											      <c:set var="answerTablet" value="Less than 4"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '3'}">
											      <c:set var="answerTablet" value="4-8"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '4'}">
											      <c:set var="answerTablet" value="8-12"/>
											      </c:if>
											      
											      <c:if test="${list.answertext eq '5'}">
											      <c:set var="answerTablet" value=">12"/>
											      </c:if>
											     
											   </c:if>
											   
											   <c:if test="${questionId eq 465}">
											   
											     <c:set var="answerComment" value="${list.answertext}"/>
											     
											   </c:if>
											  
											  
											   <c:if test="${questionId eq 493}">
											    
											     <c:set var="answerFourthFifth" value="${list.answertext}"/>
											     
											   </c:if>
											  
											

											 </c:if>
											 
											 
											 
											 
											</c:if>	
										<c:if test="${a.count == totalLength}">	
																	
																		<c:set var="datColumn" value="${fn:split(mydate1,' ')}" />
																	<c:forEach var="datColumn1" items="${datColumn}"  varStatus="status" begin="0" end="0">
																	
																	<c:set var="datColumn" value="${datColumn1}" />
																	</c:forEach>
																										
																	<tr style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border: 1px solid black;">
																	<td style=" border: 1px solid black;" title="${fn:substring(mydate1,0,16)}" id="date">${fn:substring(mydate1,0,5)}</td>
																<%-- <td style=" border: 1px solid black;" id="date">${mydate1}</td> --%>
																	<td style=" border: 1px solid black;" id="lowerBack${tableCounter+1}" class="lowerBack">${lowerBack}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBone${tableCounter+1}" class="Groin1">${questionOneCBone}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBtwo${tableCounter+1}" class="LeftButtock1">${questionOneCBtwo}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBfour${tableCounter+1}" class="Leftthighfront1">${questionOneCBfour}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBsix${tableCounter+1}" class="Leftthighback1">${questionOneCBsix}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBeight${tableCounter+1}" class="LeftShincalf1">${questionOneCBeight}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBten${tableCounter+1}" class="LeftFootankle1">${questionOneCBten}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBthree${tableCounter+1}" class="RightButtock1">${questionOneCBthree}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBfive${tableCounter+1}" class="Rightthighfront1">${questionOneCBfive}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBseven${tableCounter+1}" class="Rightthighback1">${questionOneCBseven}</td>
																	<td style=" border: 1px solid black;" id="questionOneCBnine${tableCounter+1}" class="RightShincalf1">${questionOneCBnine}</td>
																	<td style=" border: 1px solid black;" id="questionOneCeleven${tableCounter+1}" class="RightFootankle1">${questionOneCeleven}</td>
																	
																	<td style=" border: 1px solid black;" id="questionTwoCBone${tableCounter+1}" class="Groin2">${questionTwoCBone}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBtwo${tableCounter+1}" class="LeftButtock2">${questionTwoCBtwo}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBfour${tableCounter+1}" class="Leftthighfront2">${questionTwoCBfour}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBsix${tableCounter+1}" class="Leftthighback2">${questionTwoCBsix}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBeight${tableCounter+1}" class="LeftShincalf2">${questionTwoCBeight}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBten${tableCounter+1}" class="LeftFootankle2">${questionTwoCBten}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBthree${tableCounter+1}" class="RightButtock2">${questionTwoCBthree}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBfive${tableCounter+1}" class="Rightthighfront2">${questionTwoCBfive}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBseven${tableCounter+1}" class="Rightthighback2">${questionTwoCBseven}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCBnine${tableCounter+1}" class="RightShincalf2">${questionTwoCBnine}</td>
																	<td style=" border: 1px solid black;" id="questionTwoCeleven${tableCounter+1}" class="RightFootankle2">${questionTwoCeleven}</td>
																	
																	<td style=" border: 1px solid black;" id="questionThreeCBone${tableCounter+1}" class="Leftthighback3">${questionThreeCBone}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBthree${tableCounter+1}" class="LeftShincalf3">${questionThreeCBthree}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBfive${tableCounter+1}" class="LeftFootankle3">${questionThreeCBfive}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBtwo${tableCounter+1}" class="Rightthighback3">${questionThreeCBtwo}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBfour${tableCounter+1}" class="RightShincalf3">${questionThreeCBfour}</td>
																	<td style=" border: 1px solid black;" id="questionThreeCBsix${tableCounter+1}" class="RightFootankle3">${questionThreeCBsix}</td>
																	
																	<td style=" border: 1px solid black;" id="answerFourthOne${tableCounter+1}" class="Leftleg4">${answerFourthOne}</td>
																	<td style=" border: 1px solid black;" id="answerFourthTwo${tableCounter+1}" class="Rightleg4">${answerFourthTwo}</td>
																	
																	<td style=" border: 1px solid black;" colspan="1" id="answerWorstOne${tableCounter+1}" class="legOrFootWorst">${answerWorst1}</td>
																	<td style=" border: 1px solid black;" colspan="1" id="answerWorstTwo${tableCounter+1}" class="LowerBackWorst">${answerWorst2}</td>
																	
																	<td style=" border: 1px solid black;" colspan="2" id="answerTablet${tableCounter+1}" class="answerTablet">${answerTablet}</td>
																	<td style=" border: 1px solid black;" id="answerFourthFifth${tableCounter+1}" class="answerFifth" colspan="2">${answerFourthFifth}</td>
																	<td style=" border: 1px solid black;" colspan="2" id="answerComment${tableCounter+1}" class="answerComment" title="${answerComment}"><c:if test="${fn:length(answerComment) > 8}">${fn:substring(answerComment, 0, 8)}..
																	</c:if>
																	<c:if test="${fn:length(answerComment) <= 8}">
																	${answerComment}
																	</c:if></td>
																	
																	<c:set var="mydate1" value="${list.formsubmitdate}"/>
																	
																<c:set var="lowerBack" value="N"/>
																<c:set var="questionOneCBone" value="N"/>
																<c:set var="questionOneCBtwo" value="N"/>
																<c:set var="questionOneCBfour" value="N"/>
																<c:set var="questionOneCBsix" value="N"/>
																<c:set var="questionOneCBeight" value="N"/>
																<c:set var="questionOneCBten" value="N"/>
																<c:set var="questionOneCBthree" value="N"/>
																<c:set var="questionOneCBfive" value="N"/>
																<c:set var="questionOneCBseven" value="N"/>
																<c:set var="questionOneCBnine" value="N"/>
																<c:set var="questionOneCeleven" value="N"/>
																<c:set var="questionTwoCBone" value="N"/>
																<c:set var="questionTwoCBtwo" value="N"/>
																<c:set var="questionTwoCBfour" value="N"/>
																<c:set var="questionTwoCBeight" value="N"/>
																<c:set var="questionTwoCBten" value="N"/>
																<c:set var="questionTwoCBthree" value="N"/>
																<c:set var="questionTwoCBfive" value="N"/>
																<c:set var="questionTwoCBseven" value="N"/>
																<c:set var="questionTwoCBnine" value="N"/>
																<c:set var="questionTwoCeleven" value="N"/>
																
																
																<c:set var="questionThreeCBone" value="N"/>
																<c:set var="questionThreeCBthree" value="N"/>
																<c:set var="questionThreeCBfive" value="N"/>
																<c:set var="questionThreeCBtwo" value="N"/>
																<c:set var="questionThreeCBfour" value="N"/>
																<c:set var="questionThreeCBsix" value="N"/>
																<c:set var="answerFourthOne" value="N"/>
																<c:set var="answerFourthTwo" value="N"/>
																
																<c:set var="answerWorst1" value="N"/>
																<c:set var="answerWorst2" value="N"/>
																<c:set var="answerTablet" value="N"/>
																<c:set var="answerComment" value="N"/>
																
																<c:set var="answerFourthFifth" value="N"/>
																</tr>
																</c:if>
									
										  
										

					                                            
                                                              
                                                                </c:forEach>
                                                                
																</tbody>
																
																
																
									</table>
									
									<script>
   
							$(document).ready(function() {
						
								var length=${tableCounter+1};
								
								
								
								var flagc1="false";
								var flagc2="false";
								var flagc3="false";
								var flagc4="false";
								var flagc5="false";
								var flagc6="false";
								var flagc7="false";
								var flagc8="false";
								var flagc9="false";
								var flagc10="false";
								var flagc11="false";
								var flagc12="false";
								var flagc13="false";
								var flagc14="false";
								var flagc15="false";
								var flagc16="false";
								var flagc17="false";
								var flagc18="false";
								var flagc19="false";
								var flagc20="false";
								var flagc21="false";
								var flagc22="false";
								var flagc23="false";
								var flagc24="false";
								var flagc25="false";
								var flagc26="false";
								var flagc27="false";
								var flagc28="false";
								var flagc29="false";
								var flagc30="false";
								var flagc31="false";
								var flagc32="false";
								
								var flagWorstPain1="false";
								var flagWorstPain2="false";
								var flagTablet="false";
								var flagComment="false";
								
								
								for(var i=1;i<=length;i++){
									
									var c1 = $("#lowerBack"+i).text();
									var c2 = $("#questionOneCBone"+i).text();
									var c3 = $("#questionOneCBtwo"+i).text();
									var c4 = $("#questionOneCBfour"+i).text();
									var c5 = $("#questionOneCBsix"+i).text();
									var c6 = $("#questionOneCBeight"+i).text();
									var c7 = $("#questionOneCBten"+i).text();
									var c8 = $("#questionOneCBthree"+i).text();
									var c9 = $("#questionOneCBfive"+i).text();
									var c10 = $("#questionOneCBseven"+i).text();
									var c11 = $("#questionOneCBnine"+i).text();
									var c12 = $("#questionOneCeleven"+i).text();
									var c13 = $("#questionTwoCBone"+i).text();
									var c14 = $("#questionTwoCBtwo"+i).text();
									var c15 = $("#questionTwoCBfour"+i).text();
									var c16 = $("#questionTwoCBsix"+i).text();
									var c17 = $("#questionTwoCBeight"+i).text();
									var c18 = $("#questionTwoCBten"+i).text();
									var c19 = $("#questionTwoCBthree"+i).text();
									var c20 = $("#questionTwoCBfive"+i).text();
									var c21 = $("#questionTwoCBseven"+i).text();
									var c22 = $("#questionTwoCBnine"+i).text();
									var c23 = $("#questionTwoCeleven"+i).text();
									var c24 = $("#questionThreeCBone"+i).text();
									var c25 = $("#questionThreeCBthree"+i).text();
									var c26 = $("#questionThreeCBfive"+i).text();
									var c27 = $("#questionThreeCBtwo"+i).text();
									var c28 = $("#questionThreeCBfour"+i).text();
									var c29 = $("#questionThreeCBsix"+i).text();
									var c30 = $("#answerFourthOne"+i).text();
									var c31 = $("#answerFourthTwo"+i).text();
									var c32 = $("#answerFourthFifth"+i).text();
									
									var worst1=$("#answerWorstOne"+i).text();
									var worst2=$("#answerWorstTwo"+i).text();
									var tablet=$("#answerTablet"+i).text();
									var comment=$("#answerComment"+i).text();
									
									
									if(c1 == 'Y'){
										
										flagc1="true";
									}if(c2 == 'Y'){
										
										flagc2="true";
									}if(c3 == 'Y'){
										
										flagc3="true";
									}if(c4 == 'Y'){
										
										flagc4="true";
									}if(c5 == 'Y'){
										
										flagc5="true";
									}if(c6 == 'Y'){
										
										flagc6="true";
									}if(c7 == 'Y'){
										
										flagc7="true";
									}if(c8 == 'Y'){
										
										flagc8="true";
									}if(c9 == 'Y'){
										
										flagc9="true";
									}if(c10 == 'Y'){
										
										flagc10="true";
									}if(c11 == 'Y'){
										
										flagc11="true";
									}if(c12 == 'Y'){
										
										flagc12="true";
									}if(c13 == 'Y'){
										
										flagc13="true";
									}if(c14 == 'Y'){
										
										flagc14="true";
									}if(c15 == 'Y'){
										
										flagc15="true";
									}if(c16 == 'Y'){
										
										flagc16="true";
									}if(c17 == 'Y'){
										
										flagc17="true";
									}if(c18 == 'Y'){
										
										flagc18="true";
									}if(c19 == 'Y'){
										
										flagc19="true";
									}if(c20 == 'Y'){
										
										flagc20="true";
									}if(c21 == 'Y'){
										
										flagc21="true";
									}if(c22 == 'Y'){
										
										flagc22="true";
									}if(c23 == 'Y'){
										
										flagc23="true";
									}if(c24 == 'Y'){
										
										flagc24="true";
									}if(c25 == 'Y'){
										
										flagc25="true";
									}if(c26 == 'Y'){
										
										flagc26="true";
									}if(c27 == 'Y'){
										
										flagc27="true";
									}if(c28 == 'Y'){
										
										flagc28="true";
									}if(c29 == 'Y'){
										
										flagc29="true";
									}if(c30 == '<1/4' || c30 == '1/4' ||c30 == '1/2' ||c30 == '>1/2' ){
										
										flagc30="true";
									}if(c31 ==  '<1/4'||c31 ==  '1/4'||c31 ==  '1/2'||c31 ==  '>1/2'){
										
										flagc31="true";
									}if(c32 != 'N'){
										
										flagc32="true";
									}
									
									
									if(worst1 == 'Y'){
										
										flagWorstPain1="true";
									}
									if(worst2 == 'Y'){
										
										flagWorstPain2="true";
									}
									if(tablet != 'N'){
										
										flagTablet="true";
									}if(comment != 'N'){
										
										flagComment="true";
									}
									
								}
								
								
								
								var pain= 12;
								var otherPain= 11;
								var numbness=11;
								var muscle=6;
								var legRaising=2;
								var yoga=2;
								
								var worstPain=2;
								var worstLegPain=1;
								var worstLowerBack=1;
								var tablet=2;
								var comment=2;
								
								
							
								if(flagc1 == "false"){
									pain= pain- 1;
									
									$('#painTH').attr('colspan',pain);
								    $("table .lowerBack").hide();

								}
								if(flagc2 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .Groin1").hide();

								}if(flagc3 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .LeftButtock1").hide();

								}if(flagc4 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .Leftthighfront1").hide();

								}if(flagc5 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .Leftthighback1").hide();

								}if(flagc6 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .LeftShincalf1").hide();

								}if(flagc7 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .LeftFootankle1").hide();

								}if(flagc8 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .RightButtock1").hide();

								}if(flagc9 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .Rightthighfront1").hide();

								}if(flagc10 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .Rightthighback1").hide();

								}if(flagc11 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .RightShincalf1").hide();

								}if(flagc12 == "false"){
									pain= pain- 1;
									otherPain= otherPain- 1;
									
									$('#otherSite').attr('colspan',otherPain);
									$('#painTH').attr('colspan',pain);
								    $("table .RightFootankle1").hide();

								}
								//2nd question
								
								if(flagc13 == "false"){
									numbness= numbness- 1;
								
									
									$('#numbness').attr('colspan',numbness);
									
								    $("table .Groin2").hide();

								}if(flagc14 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .LeftButtock2").hide();

								}if(flagc15 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .Leftthighfront2").hide();


								}if(flagc16 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .Leftthighback2").hide();


								}if(flagc17 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .LeftShincalf2").hide();

								}if(flagc18 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .LeftFootankle2").hide();

								}if(flagc19 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .RightButtock2").hide();

								}if(flagc20 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .Rightthighfront2").hide();

								}if(flagc21 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .Rightthighback2").hide();

								}if(flagc22 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .RightShincalf2").hide();

								}if(flagc23 == "false"){
									numbness= numbness- 1;
									$('#numbness').attr('colspan',numbness);
								    $("table .RightFootankle2").hide();
								}
								
								//question 3
								if(flagc24 == "false"){
									muscle= muscle- 1;
									$('#muscle').attr('colspan',muscle);
								    $("table .Leftthighback3").hide();
								}if(flagc25 == "false"){
									muscle= muscle- 1;
									$('#muscle').attr('colspan',muscle);
								    $("table .LeftShincalf3").hide();
								}if(flagc26 == "false"){
									muscle= muscle- 1;
									$('#muscle').attr('colspan',muscle);
								    $("table .LeftFootankle3").hide();
								}if(flagc27 == "false"){
									muscle= muscle- 1;
									$('#muscle').attr('colspan',muscle);
								    $("table .Rightthighback3").hide();
								}if(flagc28 == "false"){
									muscle= muscle- 1;
									$('#muscle').attr('colspan',muscle);
								    $("table .RightShincalf3").hide();
								}if(flagc29 == "false"){
									muscle= muscle- 1;
									$('#muscle').attr('colspan',muscle);
								    $("table .RightFootankle3").hide();
								}
								// column 4rthh
								if(flagc30 == "false"){
									legRaising= legRaising- 1;
									$('#legRaising').attr('colspan',legRaising);
								    $("table .Leftleg4").hide();
								}if(flagc31 == "false"){
									legRaising= legRaising- 1;
									$('#legRaising').attr('colspan',legRaising);
								    $("table .Rightleg4").hide();
								}
								//column fifth
								if(flagc32 == "false"){
									yoga= yoga- 2;
									$('#yoga').attr('colspan',yoga);
								    $("table .answerFifth").hide();
								}
								
								//extra questions later added
								
								if(flagWorstPain1 == "false"){
									worstPain= worstPain- 1;
									
									$('#worstpain').attr('colspan',worstPain);
									
								    $("table .legOrFootWorst").hide();

								}
								
								
								if(flagWorstPain2 == "false"){
									worstPain= worstPain- 1;
									
									$('#worstpain').attr('colspan',worstPain);
									
								    $("table .LowerBackWorst").hide();

								}if(flagTablet == "false"){
									tablet= tablet- 2;
									$('#tablet').attr('colspan',tablet);
								    $("table .answerTablet").hide();
								}
								if(flagComment == "false"){
									comment= comment- 2;
									$('#comments').attr('colspan',comment);
								    $("table .answerComment").hide();
								}
								
								
								
								if(worstPain == 0){
									$("#worstpain").hide();
								}if(tablet == 0){
									$("#tablet").hide();
								}if(comment == 0){
									$("#comments").hide();
								}
								
								
								
								
								if(legRaising == 0){
									$("#legRaising").hide();
								}
								
								if(yoga == 0){
									$("#yoga").hide();
								}if(muscle == 0){
									$("#muscle").hide();
								}if(numbness == 0){
									
								$("#numbness").hide();
								}if(pain == 0){
									
								$("#painTH").hide();
								}if(otherPain == 0){
									
								$("#otherSite").hide();
								}
								
								if(yoga == 0 && muscle == 0 && numbness ==0 && pain==0 && otherPain == 0 && worstPain==0 && tablet==0 && comment==0){
									$("#table1").hide();
								}
								
								
								

							
								
							});
							

							$(document).ready(function(){
								$("#table1").freezeHeader({ top: true, left: false });
							});
									</script>
								   
											
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<jsp:include page="footer.jsp" />
		</tbody>
	</table></table>

</body>
</html>