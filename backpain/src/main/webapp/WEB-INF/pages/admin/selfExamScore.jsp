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
									<table width="727" border="0" cellpadding="0" cellspacing="0"
										class="tbl_Grid">
										<tbody>
											<tr>
												<td class="tbl_red" align="left" height="25" valign="middle">
													<strong style="margin-left: 10px;">Record List</strong>
												</td>
											</tr>
											<tr>
												<td style="height: 496px" valign="top"><br />
													<table width="100%">
														<tbody>
															<tr>
																<td>
																	<fieldset>
																		<table>
																			<tbody>
																				<tr>
																					<td width="100px"><b>Full Name :</b></td>																					
																					<td><span>${client.foreName}  ${client.surName}</span></td>
																				</tr>
																				<tr>
																					<td><b>User Name :</b></td>																					
																					<td><span>${client.userId}</span>
																					</td>
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
								                                <td>
								                                    <br/>
								                                    <fieldset>
								                                        <table width="100%">
								                                            <tbody><tr>
								                                                <td align="right">
								                                                  <input type="button" onclick="window.location='${contextPath}/admin/${client.clientId}/reportList.html';"  style="width:157px;" id="reportList" value="Go to Report Listing" />
								                                                </td>
								                                            </tr>
								                                        </tbody></table>
								                                    </fieldset>
								                                </td>
								                            </tr>
														</tbody>
													</table> <br />
													<fieldset>
														<table style=" width: 114%;">
                            <tbody><tr>
                                <td colspan="3">
                                                                
                                   <c:forEach items="${report.questionGroups}"	var="questionGroup" >
                                
                                                                
                                    <span style="display:inline-block;width:250px;">User Selection for ${questionGroup.description}</span>                                    
                                    <span style="display:inline-block;width:150px;">Score is 0</span>
                                                                        
                                                                      
										<table cellspacing="0" cellpadding="4" style="color:#333333;border-color:Maroon;border-style:Solid;width:750px;border-collapse:collapse;">
											<tbody><tr style="color:White;background-color:#990000;font-weight:bold;">
												<th scope="col">${questionGroup.description}</th><th scope="col">Score</th>
											</tr>
									<c:forEach items="${questionGroup.questions}" var="question" varStatus="counter">		
											<tr style="color:#333333;background-color:${counter.count % 2 == 0 ? '#FFFBD6;' : 'White;' }">
												<td style="width:300px;">${question.questionText}</td><td style="width:30px;"><span>${question.maxScore}</span></td>	
											</tr>
									</c:forEach>		
										</tbody></table>
										
									<br/>
                                    <br/>
                                    
                               </c:forEach>    
                                
                                  
                                                                      
                                    
                              </td>
                            </tr>
                        </tbody></table>
					</fieldset></td>
					
					
											</tr>
										</tbody>


									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table>

</body>
</html>