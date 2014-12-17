<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<c:set var="url" value="${contextPath}/backPain.html" />
<c:if test="${loggedClient.roleId == 2}">
	<c:set var="url" value="${contextPath}/admin/backPain.html" />
</c:if>
<body>
	<form:form method="post" action="${url}" commandName="form">
		<form:hidden path="clientFormId" />
		<form:hidden path="clientId" />

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
									<td width="238" align="left" valign="top"><c:if
											test="${loggedClient.roleId == 1}">
											<jsp:include page="left.jsp" />
										</c:if> <c:if test="${loggedClient.roleId == 2}">
											<jsp:include page="admin/adminLeft.jsp" />
										</c:if></td>
									<td width="15">&nbsp;</td>
									<td width="727" align="left" valign="top">

										<table width="727" border="0" cellpadding="3" cellspacing="0"
											class="tbl_Grid">
											<tbody>
												<tr>
													<td height="25" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;"><center style="margin-top: -13px;font-size:13px;">3. About
															Back Pain(1)</center></strong></td>
												</tr>
												<tr>
													<td>


														<table width="100%">
															<tbody>
																<tr>
																	<td colspan="2"></td>
																</tr>
																<c:if test="${not empty message}">
																	<tr>
																		<td height="25" colspan="2"
																			style="font-family: Calibri;">
																			<div style="color: #4F8A10; font-weight: bold;">
																				<font size="4">${message}</font></div>
																		</td>
																	</tr>
																</c:if>
																<tr>
																		<td height="25" colspan="2"
																			style="font-family: Calibri;">
																			<div id="errorVal" style="color: red; font-weight: bold;" class="mh_hide">
																				Please provide required data.</div>
																		</td>
																	</tr>
																<c:if test="${not empty error}">
																	<tr>
																		<td height="25" colspan="2"
																			style="font-family: Calibri;">
																			<div style="color: red; font-weight: bold;">
																				${error}</div>
																			<div id="errorVal" style="color: red; font-weight: bold;" class="mh_hide">
																				Please provide required data.</div>
																		</td>
																	</tr>
																</c:if>
																<c:if test="${loggedClient.roleId == 2}">
																	<jsp:include page="admin/clientInfo.jsp" />
																	<tr>
																		<td colspan="2"><br /></td>
																	</tr>
																</c:if>
																<tr>
																	<td colspan="2">1. <fmt:message key="question15" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td><form:select path="question15"
																			cssStyle="width:250px;">
																			<form:option value="" />
																			<form:option value="None at all" />
																			<form:option value="Between 1 and 5 days" />
																			<form:option value="Between 6 and 10 days" />
																			<form:option value="More than 10 days" />
																		</form:select></td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question15"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question15_error" class="mh_hide">
																		<span class="errors">Please provide answer.</span>
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		2. <fmt:message key="question16" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td><form:select path="question16"
																			cssStyle="width:250px;">
																			<form:option value="" />
																			<form:option value="0" label="None" />
																			<form:option value="25" label="Mild" />
																			<form:option value="50" label="Moderate" />
																			<form:option value="75" label="Severe" />
																			<form:option value="95" label="Intolerable" />
																		</form:select></td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question16"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question16_error" class="mh_hide">
																		<span class="errors">Please provide answer.</span>
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		3. <fmt:message key="question17" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td><form:select path="question17"
																			cssStyle="width:250px;">
																			<form:option value="" />
																			<form:option value="None" />
																			<form:option value="Less than 4" />
																			<form:option value="Between 4 & 8" />
																			<form:option value="Between 9 & 12" />
																			<form:option value="More than 12" />
																		</form:select></td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question17"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question17_error" class="mh_hide">
																		<span class="errors">Please provide answer.</span>
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		4. <fmt:message key="question18" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question18"
																											value="335" /><label for="question18">Yes</label></td>
																									<td><form:radiobutton path="question18"
																											value="334" /><label for="question18">No</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td>&nbsp;</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question18"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question18_error" class="mh_hide">
																		<span class="errors">Please select at least one</span>
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		5. <fmt:message key="question19" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td colspan="1">
																						<table>
																							<tbody>
																							 <tr>
																									<td colspan="1"><label>Lying Down</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question164" value="2" /><label>Yes</label>
																										<form:radiobutton path="question164" value="1" /><label>No</label>
																									</td>
																									<td id="question164_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>	
																							    <tr>
																									<td><label>Sitting</label></td>		
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question165" value="Yes" /><label>Yes</label>
																										<form:radiobutton path="question165" value="No" /><label>No</label>
																									</td>
																									<td id="question165_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																							
																								</tr>																								
																								<tr>																									
																									<td colspan="1"><label>Standing</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question166" value="Yes" /><label>Yes</label>
																										<form:radiobutton path="question166" value="No" /><label>No</label>
																									</td>
																									<td id="question166_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>	
																							    <tr>
																									<td><label for="question167">Walking</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question167" value="Yes" /><label >Yes</label>
																										<form:radiobutton path="question167" value="No" /><label >No</label>
																									</td>
																									<td id="question167_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>
																								
																								
																								<%--  <tr>
																									<td colspan="1"><form:checkbox
																											path="question19" value="Lying Down" /><label
																										for="question19">Lying Down</label></td>
																									<td><form:checkbox path="question19"
																											value="Sitting" /><label for="question19">Sitting</label>
																									</td>
																									<td><form:checkbox path="question19"
																											value="Standing" /><label for="question19">Standing</label>
																									</td>
																									<td><form:checkbox path="question19"
																											value="Walking" /><label for="question19">Walking</label>
																									</td>
																									<td><form:checkbox path="question19"
																											value="None of these" /><label
																										for="question19">None of these</label></td>
																								</tr> --%>
																								
																								
																							</tbody>
																						</table>
																					</td>
																				</tr>

																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																<!-- <tr>
																	<td colspan="2"><form:errors path="question19"
																			cssClass="errors" /></td>
																</tr> 
																<tr>
																	<td colspan="2" id="question19_error" class="mh_hide">
																		<span class="errors">Please select at least one</span>
																	</td>
																</tr>-->
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
															</tbody>
														</table>

														<table width="100%">
															<tbody>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		6.</td>
																</tr>
																
																


																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		[A] <fmt:message key="question20" />
																	</td>
																</tr>
																
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>

																		<table border="0" style="height: 22px;">
																			<tbody>
																				<tr>
																					<td><form:radiobutton path="question20"
																							value="Yes I have" /> <label for="question20">Yes I currently have it</label></td>
																					<td><form:radiobutton path="question20"
																							value="Yes I had" /> <label for="question20">Yes I had it in the past</label></td>
																					<td><form:radiobutton path="question20"
																							value="No" /> <label for="question20">No I have never had any</label></td>
																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																<tr>
																	<td colspan="2" id="question20_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																
																<c:set var="parentId" value="question20" scope="request"/> 
																<c:set var="lastTime" value="question37" scope="request"/> 
																<c:set var="currentEpisode" value="question285" scope="request"/>
																<c:set var="firstTime" value="question38" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																<tr>
																	<td colspan="2"><span>[B] <fmt:message
																				key="question32" /></span></td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3">&nbsp;</td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0" style="height: 22px;">
																							<tbody>
																							<tr>
																							    <input type="hidden" id="question438" name="question438" value=""/>
																								<td><form:radiobutton path="question32"
																										value="Yes I have" onclick="lowerBack();"/> <label for="question32">Yes I currently have it</label></td>
																								<td><form:radiobutton path="question32"
																										value="Yes I had" onclick="lowerBack1();"/> <label for="question32">Yes I had it in the past</label></td>
																								<td><form:radiobutton path="question32"
																										value="No" onclick="lowerBack2();"/> <label for="question32">No I have never had any</label></td>
																								
																							</tr>
																							</tbody>
																						</table>
																					</td>																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																<tr>
																	<td id="question32_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																<c:set var="parentId" value="question32" scope="request"/> 
																<c:set var="lastTime" value="question39" scope="request"/> 
																<c:set var="firstTime" value="question40" scope="request"/>	
																<c:set var="currentEpisode" value="question286" scope="request"/>															
																<jsp:include page="backPainQ6.jsp" />
														
														
															<!-- testing statrt -->
																<tr>
																	<td colspan="2" style="border-top: dotted 0px black;">
																	 [C]<fmt:message key="question273"/></td>
																</tr>
																
																
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question273"
																											value="Yes" /><label for="question273">Yes</label></td>
																									<td><form:radiobutton path="question273"
																											value="No"/><label for="question273">No</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<!-- <td>&nbsp;</td> -->
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																
																	<tr>
																	<td id="question273_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																
																<!-- testing End-->
																
																
																
																<tr id="question273_a" class="mh_hide">
																
																	<td colspan="2" ><span id="">[D] <fmt:message key="question33" /> </span></td>
																</tr>
																
																<tr id="question273_a">
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question33"
																											value="Yes I have" /> <label for="question33">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question33"
																											value="Yes I had"/> <label for="question33">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question33"
																											value="No"/> <label for="question33">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>																				

																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
															
																<tr>
																	<td id="question33_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																<c:set var="parentId" value="question33" scope="request"/> 
																<c:set var="lastTime" value="question41" scope="request"/> 
																<c:set var="firstTime" value="question42" scope="request"/>	
																<c:set var="have" value="question274" scope="request"/> 
																<c:set var="had" value="question275" scope="request"/>
																<c:set var="currentEpisode" value="question287" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																
																
																<!-- Testing of question start-->
																
																
																
																<!-- end testing of question -->
																
																
																<tr>
																	<td colspan="2"  class="mh_hide" id="question273_a"><span id="">[E] <fmt:message key="question34" /> </span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td  class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question34"
																											value="Yes I have" /> <label for="question34">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question34"
																											value="Yes I had" /> <label for="question34">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question34"
																											value="No" /> <label for="question34">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					

																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																<tr>
																	<td id="question34_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																<c:set var="parentId" value="question34" scope="request"/> 
																<c:set var="lastTime" value="question43" scope="request"/> 
																<c:set var="firstTime" value="question44" scope="request"/>		
																<c:set var="have" value="question276" scope="request"/> 
																<c:set var="had" value="question277" scope="request"/>
																<c:set var="currentEpisode" value="question288" scope="request"/>															
																<jsp:include page="backPainQ6.jsp" />

																
																<tr>
																	<td colspan="2"  class="mh_hide" id="question273_a"><span id="">[F] <fmt:message key="question35" /> </span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question35"
																											value="Yes I have" /> <label for="question35">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question35"
																											value="Yes I had" /> <label for="question35">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question35"
																											value="No" /> <label for="question35">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																<tr>
																	<td id="question35_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																<c:set var="parentId" value="question35" scope="request"/> 
																<c:set var="lastTime" value="question45" scope="request"/> 
																<c:set var="firstTime" value="question46" scope="request"/>
																<c:set var="have" value="question278" scope="request"/> 
																<c:set var="had" value="question279" scope="request"/>
																<c:set var="currentEpisode" value="question289" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																
																
																<tr>
																	<td colspan="2"  class="mh_hide" id="question273_a"><span id="">[G] <fmt:message key="question36" /> </span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td  class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question36"
																											value="Yes I have" /> <label for="question36">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question36"
																											value="Yes I had" /> <label for="question36">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question36"
																											value="No" /> <label for="question36">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																
																<tr>
																	<td id="question36_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																
																
																<c:set var="parentId" value="question36" scope="request"/> 
																<c:set var="lastTime" value="question189" scope="request"/> 
																<c:set var="firstTime" value="question260" scope="request"/>	
																<c:set var="have" value="question280" scope="request"/> 
																<c:set var="had" value="question281" scope="request"/>
																<c:set var="currentEpisode" value="question290" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																
																<!--Start Adding 6[H],6[I],6[J] -->
																<!-- Q6[H] -->
																<tr>
																	<td colspan="2"  class="mh_hide" id="question273_a"><span id="">[H] <fmt:message key="question291" /> </span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td  class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question291"
																											value="Yes I have" /> <label for="question291">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question291"
																											value="Yes I had" /> <label for="question291">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question291"
																											value="No" /> <label for="question291">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																
																<tr>
																	<td id="question291_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																
																
																<c:set var="parentId" value="question291" scope="request"/> 
																<c:set var="lastTime" value="question309" scope="request"/> 
																<c:set var="firstTime" value="question297" scope="request"/>	
																<c:set var="have" value="question300" scope="request"/> 
																<c:set var="had" value="question303" scope="request"/>
																<c:set var="currentEpisode" value="question294" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																<!-- Q6[I] -->
																
																<tr>
																	<td colspan="2"  class="mh_hide" id="question273_a"><span id="">[I] <fmt:message key="question292" /> </span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td  class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question292"
																											value="Yes I have" /> <label for="question292">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question292"
																											value="Yes I had" /> <label for="question292">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question292"
																											value="No" /> <label for="question292">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																
																<tr>
																	<td id="question292_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																
																
																<c:set var="parentId" value="question292" scope="request"/> 
																<c:set var="lastTime" value="question310" scope="request"/> 
																<c:set var="firstTime" value="question298" scope="request"/>	
																<c:set var="have" value="question301" scope="request"/> 
																<c:set var="had" value="question304" scope="request"/>
																<c:set var="currentEpisode" value="question295" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																<!-- Q6[J] -->
																
																	<tr>
																	<td colspan="2"  class="mh_hide" id="question273_a"><span id="">[J] <fmt:message key="question293" /> </span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question273_a" class="mh_hide"></td>
																	<td  class="mh_hide" id="question273_a">
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table>
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question293"
																											value="Yes I have" /> <label for="question293">Yes I currently have it</label></td>
																									<td><form:radiobutton path="question293"
																											value="Yes I had" /> <label for="question293">Yes I had it in the past</label></td>
																									<td><form:radiobutton path="question293"
																											value="No" /> <label for="question293">No I have never had any</label></td>
																									
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
																
																<tr>
																	<td id="question293_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
																</tr>
																
																
																<c:set var="parentId" value="question293" scope="request"/> 
																<c:set var="lastTime" value="question311" scope="request"/> 
																<c:set var="firstTime" value="question299" scope="request"/>	
																<c:set var="have" value="question302" scope="request"/> 
																<c:set var="had" value="question305" scope="request"/>
																<c:set var="currentEpisode" value="question296" scope="request"/>																
																<jsp:include page="backPainQ6.jsp" />
																
																<!--End Adding 6[H],6[I],6[J] -->
																																
															</tbody>
														</table>



														<table>
															<tbody>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		7. <fmt:message key="question21" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question21"
																											value="Yes" /><label for="question21">Yes</label></td>
																									<td><form:radiobutton path="question21"
																											value="No" /><label for="question21">No</label></td>
																												<td id="label21" class="mh_hide"><span class="errors">You must either Tick “Yes” to one of these options or change your answer to Question 7 (above) from “Yes” to “No”.</span></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td>&nbsp;</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question21" cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question21_error" class="mh_hide">
																		<span class="errors">Please provide answer</span>
																	</td>
																</tr>

																<tr id="question21_BP" class="mh_hide">
																	<td colspan="2"><span>[A]. <fmt:message
																				key="question120" /></span> &nbsp;</td>
																</tr>
																<tr id="question21_BP2" class="mh_hide">
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td colspan="1">
																						<table>
																							<tbody>
																								<tr>
																									<td colspan="1"><label>Buttock</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question191" value="345" /><label>Yes</label>
																										<form:radiobutton path="question191" value="346" /><label>No</label>
																									</td>
																									<td id="question191_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>	
																							    <tr>
																									<td><label>Groin</label></td>		
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question192" value="Yes" /><label>Yes</label>
																										<form:radiobutton path="question192" value="No" /><label>No</label>
																									</td>
																									<td id="question192_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																							
																								</tr>																								
																								<tr>																									
																									<td colspan="1"><label>Front of thigh</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question193" value="Yes" /><label>Yes</label>
																										<form:radiobutton path="question193" value="No" /><label>No</label>
																									</td>
																									<td id="question193_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>	
																							    <tr>
																									<td><label for="question120">Back of thigh</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question194" value="347" /><label for="question21">Yes</label>
																										<form:radiobutton path="question194" value="348" /><label for="question21">No</label>
																									</td>
																									<td id="question194_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>
																								<tr>
																									<td colspan="1"><label>Shin or Calf</label></td>
																										
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question195" value="349" /><label>Yes</label>
																										<form:radiobutton path="question195" value="350" /><label>No</label>
																									</td>
																									<td id="question195_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>	
																							    <tr>	
																									<td> <label>Foot or Ankle</label></td>																										
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question196" value="351" /><label>Yes</label>
																										<form:radiobutton path="question196" value="352" /><label>No</label>
																									</td>
																									<td id="question196_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>
																							</tbody>
																						</table>

																					</td>
																					<td>&nbsp;</td>
																				</tr>
																				<tr>
																					<td id="question120_error" class="mh_hide"><span
																						class="errors">Please select at least one</span></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr id="question21_BP3" class="mh_hide">
																	<td colspan="2"><span>[B]. <fmt:message
																				key="question121" /></span> &nbsp;</td>
																</tr>
																<tr id="question21_BP4" class="mh_hide">
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td colspan="1">
																						<table>
																							<tbody>
																								<tr>
																									<td colspan="1"><label>Buttock</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question199" value="345" /><label>Yes</label>
																										<form:radiobutton path="question199" value="346" /><label>No</label>
																									</td>
																									<td id="question199_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								 </tr>	
																							    <tr>	
																									<td><label>Groin</label></td>		
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question200" value="Yes" /><label>Yes</label>
																										<form:radiobutton path="question200" value="No" /><label>No</label>
																									</td>
																									<td id="question200_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																							
																								</tr>																								
																								<tr>																									
																									<td colspan="1"><label>Front of thigh</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question201" value="Yes" /><label>Yes</label>
																										<form:radiobutton path="question201" value="No" /><label>No</label>
																									</td>
																									<td id="question201_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																							  </tr>	
																							  <tr>	
																									<td><label>Back of thigh</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question202" value="347" /><label for="question21">Yes</label>
																										<form:radiobutton path="question202" value="348" /><label for="question21">No</label>
																									</td>
																								
																									<td id="question202_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>
																								<tr>
																									<td colspan="1"><label>Shin or Calf</label></td>																										
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question203" value="349" /><label>Yes</label>
																										<form:radiobutton path="question203" value="350" /><label>No</label>
																									</td>	
																									<td id="question203_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								 </tr>	
																							     <tr>	
																									<td> <label>Foot or Ankle</label></td>																										
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question204" value="351" /><label>Yes</label>
																										<form:radiobutton path="question204" value="352" /><label>No</label>
																									</td>
																									<td id="question204_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																								
																								</tr>
																							</tbody>
																						</table>

																					</td>
																				</tr>
																				
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr id="question21_BP5" class="mh_hide">
																	<td class="bp_style1" colspan="2"><span>[C].
																			<fmt:message key="question122" />
																	</span> &nbsp;</td>
																</tr>
																<tr id="question21_BP6" class="mh_hide">
																	<td class="bp_style3" colspan="1">&nbsp;</td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td colspan="1">
																						<table id="question122">
																							<tbody>
																								<tr>
																									<td colspan="1"><label>Back Passage</label></td>																									
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question206" value="502" /><label>Yes</label>
																										<form:radiobutton path="question206" value="501" /><label>No</label>
																									</td>	
																									<td id="question206_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																							  </tr>	
																							  <tr>	
																									<td> <label>Genitals</label></td>	
																									<td width="50px"><span></span></td>																										
																									<td width="100px">
																										<form:radiobutton path="question207" value="504" /><label>Yes</label>
																										<form:radiobutton path="question207" value="503" /><label>No</label>
																									</td>		
																									<td id="question207_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																							
																								</tr>																								
																							</tbody>
																						</table>

																					</td>
																				</tr>
																				
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="2">&nbsp;</td>
																</tr>

																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		8. <fmt:message key="question22" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question22"
																											value="Yes" /><label for="question22">Yes</label></td>
																									<td><form:radiobutton path="question22"
																											value="No" /><label for="question22">No</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td>&nbsp;</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question22"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question22_error" class="mh_hide">
																		<span class="errors">Please provide answer</span>
																	</td>
																</tr>
																<tr id="question22_BP" class="mh_hide">
																	<td colspan="2"><span>[A]. <fmt:message
																				key="question123" /></span></td>
																</tr>
																<tr id="question22_BP" class="mh_hide">
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td colspan="1">
																						<table id="">
																							<tbody>
																								<tr>
																									<td colspan="1"><label>Thigh</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question209" value="399" /><label>Yes</label>
																										<form:radiobutton path="question209" value="398" /><label>No</label>
																									</td>
																									<td id="question209_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								 </tr>	
																							    <tr>	
																									<td><label>Lower Leg</label></td>		
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question210" value="401" /><label>Yes</label>
																										<form:radiobutton path="question210" value="400" /><label>No</label>
																									</td>
																									<td id="question210_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																							
																								</tr>																								
																								<tr>																									
																									<td colspan="1"><label>Ankle or Foot</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question211" value="403" /><label>Yes</label>
																										<form:radiobutton path="question211" value="402" /><label>No</label>
																									</td>
																									<td id="question211_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																							  </tr>	
																							  <tr>	
																									<td><label>Whole Leg</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question212" value="405" /><label >Yes</label>
																										<form:radiobutton path="question212" value="404" /><label >No</label>
																									</td>
																									<td id="question212_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>
																								
																							</tbody>
																						</table>

																					</td>
																				</tr>
																			
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr id="question22_BP" class="mh_hide">
																	<td colspan="2"><span>[B]. <fmt:message
																				key="question124" /></span></td>
																</tr>
																<tr id="question22_BP" class="mh_hide">
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table id="question124_BP">
																			<tbody>
																				<tr>
																					<td colspan="1">
																						<table>
																							<tbody>
																							
																							
																							<tr>
																									<td colspan="1"><label>Thigh</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question214" value="399" /><label>Yes</label>
																										<form:radiobutton path="question214" value="398" /><label>No</label>
																									</td>
																									<td id="question214_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								 </tr>	
																							    <tr>	
																									<td><label>Lower Leg</label></td>		
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question215" value="401" /><label>Yes</label>
																										<form:radiobutton path="question215" value="400" /><label>No</label>
																									</td>
																									<td id="question215_error" class="mh_hide"><span class="errors">Please provide answer</span></td>																							
																								</tr>																								
																								<tr>																									
																									<td colspan="1"><label>Ankle or Foot</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question216" value="403" /><label>Yes</label>
																										<form:radiobutton path="question216" value="402" /><label>No</label>
																									</td>
																									<td id="question216_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																							  </tr>	
																							  <tr>	
																									<td><label>Whole Leg</label></td>
																									<td width="50px"><span></span></td>																											
																									<td width="100px">
																										<form:radiobutton path="question217" value="405" /><label >Yes</label>
																										<form:radiobutton path="question217" value="404" /><label >No</label>
																									</td>
																									<td id="question217_error" class="mh_hide"><span class="errors">Please provide answer</span></td>
																								</tr>
																								
																								<!-- <tr>
																									<td colspan="1"><form:checkbox
																											path="question124" value="Thigh" /> <label
																										for="question124">Thigh</label></td>
																									<td><form:checkbox path="question124"
																											value="Lower Leg" /> <label
																										for="question124">Lower Leg</label></td>
																									<td><form:checkbox path="question124"
																											value="Ankle or Foot" /> <label
																										for="question124">Ankle or Foot</label></td>
																									<td><form:checkbox path="question124"
																											value="Whole Leg" /> <label
																										for="question124">Whole Leg</label></td>
																									<td><form:checkbox path="question124"
																											value="None of these" /> <label
																										for="question124">None of these</label></td>
																								</tr>-->
																							</tbody>
																						</table>
																					</td>
																				</tr>
																				<!-- <tr>
																					<td id="question124_error" class="mh_hide"><span
																						class="errors">Please select at least one</span></td>
																				</tr> -->
																			</tbody>
																		</table>

																	</td>
																</tr>
																<tr>
																	<td colspan="2">&nbsp;</td>
																</tr>

																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																
																<tr>
																	<td colspan="2">&nbsp;</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																	</td>
																</tr>
																
																
																
															
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		<c:if
																			test="${loggedClient.roleId == 1 && loggedClient.clientStateId  == 4}">
																			<input type="submit" name="submit"
																				value="Update Details" disabled="disabled" />
																			<input type="submit" name="submit" value="proceed"/>
																               <input type="hidden" id="sendMessage" name="sendMessage" value="Yes"></input>
													                        <%--  <a href="#"> <fmt:message key="form.admin.link" /> </a> --%>        
																			</a>
																		</c:if> <c:if
																			test="${loggedClient.roleId == 2 || loggedClient.clientStateId  != 4}">
																			Click ‘Update’ to continue: <input type="submit" name="submit"
																				value="Update" />
																		</c:if> <br />

																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		&nbsp;</td>
																</tr>
															</tbody>
														</table>


													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<jsp:include page="footer.jsp" />

			</tbody>
		</table>

	</form:form>
	<script>
	
	
	    function lowerBack(){
	    	document.getElementById('question438').value = '438';
	    }
	    function lowerBack1(){
	    	document.getElementById('question438').value = '438';
	    } 
	    
	    function lowerBack2(){
	    	document.getElementById('question438').value = '437';
	    }
	    
	   
	    
		var yes = "Yes"
		var no = "No"
		var flag = false;
		
		$(function() {

			
			$('input[name^="question"][type=radio]:checked').each(
					function(index) {
						
						var id = $(this).attr("name");
					
						var num = id.match(/\d+/);
						//alert(num);
						//flag = false;
						
						
						if (num == 21) {
							if($(this).val() == yes) {
								$("[id^='question21_BP']").removeClass('mh_hide');
							}
						}
						else if (num == 22) {
							if($(this).val() == yes) {
								$("[id^='question22_BP']").removeClass('mh_hide');
							}
						}
						
						else 	if (num == 20 || num < 37 || num == 291 || num == 292 || num == 293|| num== 290 || num==260 ||num==189 ||num== 291||num==309||num==294||num==310||num==296||num==311 || num ==280 ||num==300||num==297||num==298||num==301||num==299||num==302 || num==276 ||num ==44||num==278||num==46) {
							
							if(num == 20){
								if($(this).val() == "Yes I have") {
									$("[id^='question285_current']").removeClass('mh_hide');
									$("[id^='question20_past']").addClass('mh_hide');
									
								}
								if($(this).val() == "Yes I had") {
									$("[id^='question285_current']").addClass('mh_hide');
									$("[id^='question20_past']").removeClass('mh_hide');	
								}
							}
							
							if(num == 32){
								if($(this).val() == "Yes I have") {
									$("[id^='question286_current']").removeClass('mh_hide');
									$("[id^='question32_past']").addClass('mh_hide');
									document.getElementById('question438').value = '438';

									
								}
								if($(this).val() == "Yes I had") {
									$("[id^='question286_current']").addClass('mh_hide');
									$("[id^='question32_past']").removeClass('mh_hide');
									document.getElementById('question438').value = '438';

								}
								
								if($(this).val() == "No") {
									
									document.getElementById('question438').value = '437';

								}
								
							}
							
							if(num == 33) {
								
								if($(this).val() == "Yes I have") {
									
									$("[id^='question287_current']").removeClass('mh_hide');
									$("[id^='question33_past']").addClass('mh_hide');
									
									$("[id^='question33_qc6']").addClass('mh_hide');
									$("[id^='question33_qc7']").addClass('mh_hide');
									$("[id^='question33_qc4']").removeClass('mh_hide');
									$("[id^='question33_qc5']").removeClass('mh_hide');
									
									
								}
								if($(this).val() == "Yes I had") {
								
									$("[id^='question287_current']").addClass('mh_hide');
									$("[id^='question33_past']").removeClass('mh_hide');
									
									$("[id^='question33_qc4']").addClass('mh_hide');
									$("[id^='question33_qc5']").addClass('mh_hide');
									$("[id^='question33_qc6']").removeClass('mh_hide');
									$("[id^='question33_qc7']").removeClass('mh_hide');
								}
								
								
							}
							
							if(num == 34) {
								if($(this).val() == "Yes I have") {
									$("[id^='question288_current']").removeClass('mh_hide');
									$("[id^='question34_past']").addClass('mh_hide');
									
									$("[id^='question34_qc6']").addClass('mh_hide');
									$("[id^='question34_qc7']").addClass('mh_hide');
									$("[id^='question34_qc4']").removeClass('mh_hide');
									$("[id^='question34_qc5']").removeClass('mh_hide');
									
									
								}
							if($(this).val() == "Yes I had") {
									$("[id^='question288_current']").addClass('mh_hide');
									$("[id^='question34_past']").removeClass('mh_hide');
								
									$("[id^='question34_qc4']").addClass('mh_hide');
									$("[id^='question34_qc5']").addClass('mh_hide');
									$("[id^='question34_qc6']").removeClass('mh_hide');
									$("[id^='question34_qc7']").removeClass('mh_hide');

								}
							}
								
							if(num == 35) {
								
									if($(this).val() == "Yes I have") {
										$("[id^='question289_current']").removeClass('mh_hide');
										$("[id^='question35_past']").addClass('mh_hide');
										
										$("[id^='question35_qc6']").addClass('mh_hide');
										$("[id^='question35_qc7']").addClass('mh_hide');
										$("[id^='question35_qc4']").removeClass('mh_hide');
										$("[id^='question35_qc5']").removeClass('mh_hide');
										
										
									}
									else if($(this).val() == "Yes I had") {
										$("[id^='question289_current']").addClass('mh_hide');
										$("[id^='question35_past']").removeClass('mh_hide');
										
										$("[id^='question35_qc4']").addClass('mh_hide');
										$("[id^='question35_qc5']").addClass('mh_hide');
										$("[id^='question35_qc6']").removeClass('mh_hide');
										$("[id^='question35_qc7']").removeClass('mh_hide');

									}
									else{
										
										
										$("[id^='question289_current']").addClass('mh_hide');
										$("[id^='question35_past']").addClass('mh_hide');
										
										$("[id^='question35_qc4']").addClass('mh_hide');
										$("[id^='question35_qc5']").addClass('mh_hide');
										$("[id^='question35_qc6']").addClass('mh_hide');
										$("[id^='question35_S2']").addClass('mh_hide');
										$("[id^='question35_S1']").addClass('mh_hide');
                      
									}
								
							}
							
							if(num == 36) {
								if($(this).val() == "Yes I have") {
									$("[id^='question290_current']").removeClass('mh_hide');
									$("[id^='question36_past']").addClass('mh_hide');
									
									$("[id^='question36_qc6']").addClass('mh_hide');
									$("[id^='question36_qc7']").addClass('mh_hide');
									$("[id^='question36_qc4']").removeClass('mh_hide');
									$("[id^='question36_qc5']").removeClass('mh_hide');
									
									
								}
								if($(this).val() == "Yes I had") {
									$("[id^='question290_current']").addClass('mh_hide');
									$("[id^='question36_past']").removeClass('mh_hide');
									
									$("[id^='question36_qc4']").addClass('mh_hide');
									$("[id^='question36_qc5']").addClass('mh_hide');
									$("[id^='question36_qc6']").removeClass('mh_hide');
									$("[id^='question36_qc7']").removeClass('mh_hide');

								}
							
						}
							if(num == 291){
								if ($(this).val() == "Yes I have") {
									
									$("[id^='question294_current']").removeClass('mh_hide');
									$("[id^='question291_past']").addClass('mh_hide');
									
									$("[id^='question291_qc6']").addClass('mh_hide');
									$("[id^='question291_qc7']").addClass('mh_hide');
									$("[id^='question291_qc4']").removeClass('mh_hide');
									$("[id^='question291_qc5']").removeClass('mh_hide');
								}
								if ($(this).val() == "Yes I had"){
									$("[id^='question294_current']").addClass('mh_hide');
									$("[id^='question291_past']").removeClass('mh_hide');
									
									$("[id^='question291_qc4']").addClass('mh_hide');
									$("[id^='question291_qc5']").addClass('mh_hide');
									$("[id^='question291_qc6']").removeClass('mh_hide');
									$("[id^='question291_qc7']").removeClass('mh_hide');
									
								}
								
							}
							if(num == 292){
								if ($(this).val() == "Yes I have") {
									$("[id^='question295_current']").removeClass('mh_hide');
									$("[id^='question292_past']").addClass('mh_hide');
									
									$("[id^='question292_qc6']").addClass('mh_hide');
									$("[id^='question292_qc7']").addClass('mh_hide');
									$("[id^='question292_qc4']").removeClass('mh_hide');
									$("[id^='question292_qc5']").removeClass('mh_hide');
								}
								if ($(this).val() == "Yes I had"){
									$("[id^='question295_current']").addClass('mh_hide');
									$("[id^='question292_past']").removeClass('mh_hide');
									
									$("[id^='question292_qc4']").addClass('mh_hide');
									$("[id^='question292_qc5']").addClass('mh_hide');
									$("[id^='question292_qc6']").removeClass('mh_hide');
									$("[id^='question292_qc7']").removeClass('mh_hide');
									
								}
							}
							if(num == 293){
								
								if ($(this).val() == "Yes I have") {
									$("[id^='question296_current']").removeClass('mh_hide');
									$("[id^='question293_past']").addClass('mh_hide');
									
									$("[id^='question293_qc6']").addClass('mh_hide');
									$("[id^='question293_qc7']").addClass('mh_hide');
									$("[id^='question293_qc4']").removeClass('mh_hide');
									$("[id^='question293_qc5']").removeClass('mh_hide');
								}
								if ($(this).val() == "Yes I had"){
									$("[id^='question296_current']").addClass('mh_hide');
									$("[id^='question293_past']").removeClass('mh_hide');
									
									$("[id^='question293_qc4']").addClass('mh_hide');
									$("[id^='question293_qc5']").addClass('mh_hide');
									$("[id^='question293_qc6']").removeClass('mh_hide');
									$("[id^='question293_qc7']").removeClass('mh_hide');
									
								}
							}
							
							
					 		/* if(num == 290 || num == 260){
								alert('hiii');
								
								if ($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {
									flag = true;
									alert("flagtrue");
								}else if (($(this).val() != "More than a year ago" || $(this).val() != "Cannot remember") && num == 290 ) {
																		
									$("[id^='question36_S']").addClass('mh_hide');
								} 
								
								if(flag == true)
									{
									   if ($(this).val() == "Past year") {
										   alert("hello sir");
										   
										   $("[id^='question36_S']").removeClass('mh_hide');
										   flag = false;
									}else{
										$("[id^='question36_S']").addClass('mh_hide');
									}
									   
									   
									}
								
							} */
							
							/*Code for E-f  */
							
							/*Q34  */
							if(num == 276){
								if ($(this).val() == "Right side" || $(this).val() == "Left side" || $(this).val() == "Both side") {
								$("[id^='question34_S']").removeClass('mh_hide');
								if ($(this).val() == "Left side") {
									   $("[id^='bothSidePain01']").removeClass('mh_hide');
									   $("[id^='bothSidePain02']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $("[id^='bothSidePain01']").addClass('mh_hide');
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain01']").removeClass('mh_hide');
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
								   }
								}else{$("[id^='question34_S']").addClass('mh_hide');}
							}
							
							
							if(num == 44 && ($('input[id=question342]').attr('checked') == "checked")){
								if($('input[id=question441]').attr('checked') == "checked" || $('input[id=question442]').attr('checked') == "checked" || $('input[id=question443]').attr('checked') == "checked" || $('input[id=question444]').attr('checked') == "checked" || $('input[id=question445]').attr('checked') == "checked"){
									if($('input[id=question2771]').attr('checked') || $('input[id=question2772]').attr('checked') ||$('input[id=question2773]').attr('checked')){
										 $("[id^='question34_S']").removeClass('mh_hide');
										 
										 if ($('input[id=question2771]').attr('checked')) {
											   $("[id^='bothSidePain01']").removeClass('mh_hide');
											   $("[id^='bothSidePain02']").addClass('mh_hide');
										   }else if ($('input[id=question2772]').attr('checked')) {
											   $("[id^='bothSidePain01']").addClass('mh_hide');
											   $("[id^='bothSidePain02']").removeClass('mh_hide');
										   }
										   else{
											   
											   $("[id^='bothSidePain01']").removeClass('mh_hide');
											   $("[id^='bothSidePain02']").removeClass('mh_hide');
										   }
									}
								}else{
									$("[id^='question34_S']").addClass('mh_hide');
								}	
							}
							
							/*Q35  */
							if(num == 278){
								
								if ($(this).val() == "Right side" || $(this).val() == "Left side" || $(this).val() == "Both side") {
								$("[id^='question35_S']").removeClass('mh_hide');
						
								if ($(this).val() == "Left side") {
								
									   $("[id^='bothSidePain03']").removeClass('mh_hide');
									   $("[id^='bothSidePain04']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									  
									   $("[id^='bothSidePain03']").addClass('mh_hide');
									   $("[id^='bothSidePain04']").removeClass('mh_hide');
								   }
								   else{
									 
									   $("[id^='bothSidePain03']").removeClass('mh_hide');
									   $("[id^='bothSidePain04']").removeClass('mh_hide');
								   }
								}else{$("[id^='question35_S']").addClass('mh_hide');}
							}
							
							
							if(num == 46 && ($('input[id=question352]').attr('checked') == "checked")){
								
								if($('input[id=question461]').attr('checked') == "checked" || $('input[id=question462]').attr('checked') == "checked" || $('input[id=question463]').attr('checked') == "checked" || $('input[id=question464]').attr('checked') == "checked" || $('input[id=question465]').attr('checked') == "checked"){
									if($('input[id=question2791]').attr('checked') || $('input[id=question2792]').attr('checked') ||$('input[id=question2793]').attr('checked')){
										 $("[id^='question35_S']").removeClass('mh_hide');
										 
										 if ($('input[id=question2791]').attr('checked')) {
											   $("[id^='bothSidePain03']").removeClass('mh_hide');
											   $("[id^='bothSidePain04']").addClass('mh_hide');
										   }else if ($('input[id=question2792]').attr('checked')) {
											   $("[id^='bothSidePain03']").addClass('mh_hide');
											   $("[id^='bothSidePain04']").removeClass('mh_hide');
										   }
										   else{
											   
											   $("[id^='bothSidePain03']").removeClass('mh_hide');
											   $("[id^='bothSidePain04']").removeClass('mh_hide');
										   }
									}
								}else{
									$("[id^='question35_S']").addClass('mh_hide');
								}	
							}
							/*End code for E-f  */
							
							
							
							/*280,260  */
							if(num == 280){
								if ($(this).val() == "Right side" || $(this).val() == "Left side" || $(this).val() == "Both side") {
								$("[id^='question36_S']").removeClass('mh_hide');
								if ($(this).val() == "Left side") {
									   $("[id^='bothSidePain1']").removeClass('mh_hide');
									   $("[id^='bothSidePain2']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $("[id^='bothSidePain1']").addClass('mh_hide');
									   $("[id^='bothSidePain2']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain1']").removeClass('mh_hide');
									   $("[id^='bothSidePain2']").removeClass('mh_hide');
								   }
								}else{$("[id^='question36_S']").addClass('mh_hide');}
							}
							
							
							if(num == 260 && ($('input[id=question362]').attr('checked') == "checked")){
								if($('input[id=question2601]').attr('checked') == "checked" || $('input[id=question2602]').attr('checked') == "checked" || $('input[id=question2603]').attr('checked') == "checked" || $('input[id=question2604]').attr('checked') == "checked" || $('input[id=question2605]').attr('checked') == "checked"){
									if($('input[id=question2811]').attr('checked') || $('input[id=question2812]').attr('checked') ||$('input[id=question2813]').attr('checked')){
										 $("[id^='question36_S']").removeClass('mh_hide');
										 
										 if ($('input[id=question2811]').attr('checked') || $('input[id=question2812]').attr('checked')) {
											   $("[id^='bothSidePain1']").removeClass('mh_hide');
											   $("[id^='bothSidePain2']").addClass('mh_hide');
										   }else if ($('input[id=question2811]').attr('checked') || $('input[id=question2812]').attr('checked')) {
											   $("[id^='bothSidePain1']").addClass('mh_hide');
											   $("[id^='bothSidePain2']").removeClass('mh_hide');
										   }
										   else{
											   
											   $("[id^='bothSidePain1']").removeClass('mh_hide');
											   $("[id^='bothSidePain2']").removeClass('mh_hide');
										   }
									}
								}else{
									$("[id^='question36_S']").addClass('mh_hide');
								}	
							}
							/* 300,297 */
							if(num == 300){
								if ($(this).val() == "Right side" || $(this).val() == "Left side" || $(this).val() == "Both side") {
								$("[id^='question291_S']").removeClass('mh_hide');
								
								if ($(this).val() == "Left side") {
									   $("[id^='bothSidePain3']").removeClass('mh_hide');
									   $("[id^='bothSidePain4']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $("[id^='bothSidePain3']").addClass('mh_hide');
									   $("[id^='bothSidePain4']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain3']").removeClass('mh_hide');
									   $("[id^='bothSidePain4']").removeClass('mh_hide');
								   }
								
								}else{$("[id^='question291_S']").addClass('mh_hide');}
							}
							
							
							if(num == 297 && ($('input[id=question2912]').attr('checked') == "checked")){
								
								if($('input[id=question2971]').attr('checked') == "checked" || $('input[id=question2972]').attr('checked') == "checked" || $('input[id=question2973]').attr('checked') == "checked" || $('input[id=question2974]').attr('checked') == "checked" || $('input[id=question2975]').attr('checked') == "checked"){
									
									if($('input[id=question3031]').attr('checked') || $('input[id=question3032]').attr('checked') ||$('input[id=question3033]').attr('checked')){
										 $("[id^='question291_S']").removeClass('mh_hide');
										 
										 if ($('input[id=question3031]').attr('checked')) {
											
											   $("[id^='bothSidePain3']").removeClass('mh_hide');
											   $("[id^='bothSidePain4']").addClass('mh_hide');
										   }else if ($('input[id=question3032]').attr('checked')) {
											
											   $("[id^='bothSidePain3']").addClass('mh_hide');
											   $("[id^='bothSidePain4']").removeClass('mh_hide');
										   }
										   else{
											  
											   $("[id^='bothSidePain3']").removeClass('mh_hide');
											   $("[id^='bothSidePain4']").removeClass('mh_hide');
										   }
									}
								}else{
									$("[id^='question291_S']").addClass('mh_hide');
								}	
							}
							
							/* 301,298 */
							if(num == 301){
								if ($(this).val() == "Right side" || $(this).val() == "Left side" || $(this).val() == "Both side") {
								$("[id^='question292_S']").removeClass('mh_hide');
								 if ($(this).val() == "Left side") {
									   $("[id^='bothSidePain5']").removeClass('mh_hide');
									   $("[id^='bothSidePain6']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $("[id^='bothSidePain5']").addClass('mh_hide');
									   $("[id^='bothSidePain6']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain5']").removeClass('mh_hide');
									   $("[id^='bothSidePain6']").removeClass('mh_hide');
								   }
								
								}else{$("[id^='question292_S']").addClass('mh_hide');}
							}
							
							
							if(num == 298 && ($('input[id=question2922]').attr('checked') == "checked")){
								if($('input[id=question2981]').attr('checked') == "checked" || $('input[id=question2982]').attr('checked') == "checked" || $('input[id=question2983]').attr('checked') == "checked" || $('input[id=question2984]').attr('checked') == "checked" || $('input[id=question2985]').attr('checked') == "checked"){
									if($('input[id=question3041]').attr('checked') || $('input[id=question3042]').attr('checked') ||$('input[id=question3043]').attr('checked')){
										 $("[id^='question292_S']").removeClass('mh_hide');
										 
										 if ($('input[id=question3041]').attr('checked')) {
											
											   $("[id^='bothSidePain5']").removeClass('mh_hide');
											   $("[id^='bothSidePain6']").addClass('mh_hide');
										   }else if ($('input[id=question3042]').attr('checked')) {
											
											   $("[id^='bothSidePain5']").addClass('mh_hide');
											   $("[id^='bothSidePain6']").removeClass('mh_hide');
										   }
										   else{
											   
											   $("[id^='bothSidePain5']").removeClass('mh_hide');
											   $("[id^='bothSidePain6']").removeClass('mh_hide');
										   }
									}
								}else{
									$("[id^='question292_S']").addClass('mh_hide');
								}	
							}
							
							/* 302,299 */
							if(num == 302){
								if ($(this).val() == "Right side" || $(this).val() == "Left side" || $(this).val() == "Both side") {
								$("[id^='question293_S']").removeClass('mh_hide');
								
								if ($(this).val() == "Left side") {
									   $("[id^='bothSidePain7']").removeClass('mh_hide');
									   $("[id^='bothSidePain8']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $("[id^='bothSidePain7']").addClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain7']").removeClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
								
								}else{$("[id^='question293_S']").addClass('mh_hide');}
							}
							
							
							if(num == 299 && ($('input[id=question2932]').attr('checked') == "checked")){
								if($('input[id=question2991]').attr('checked') == "checked" || $('input[id=question2992]').attr('checked') == "checked" || $('input[id=question2993]').attr('checked') == "checked" || $('input[id=question2994]').attr('checked') == "checked" || $('input[id=question2995]').attr('checked') == "checked"){
									if($('input[id=question3051]').attr('checked') || $('input[id=question3052]').attr('checked') ||$('input[id=question3053]').attr('checked')){
										 $("[id^='question293_S']").removeClass('mh_hide');
										 
										 if ($('input[id=question3051]').attr('checked')) {
											
											   $("[id^='bothSidePain7']").removeClass('mh_hide');
											   $("[id^='bothSidePain8']").addClass('mh_hide');
										   }else if ($('input[id=question3052]').attr('checked')) {
											
											   $("[id^='bothSidePain7']").addClass('mh_hide');
											   $("[id^='bothSidePain8']").removeClass('mh_hide');
										   }
										   else{
											  
											   $("[id^='bothSidePain7']").removeClass('mh_hide');
											   $("[id^='bothSidePain8']").removeClass('mh_hide');
										   }
									}
								}else{
									$("[id^='question293_S']").addClass('mh_hide');
								}	
							}
							
						/* 	
							if(num == 290  ){
								
							if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {
							if($('input[id=question2601]').attr('checked') == "checked"){
								if($('input[id=question2801]').attr('checked') || $('input[id=question2802]').attr('checked') ||$('input[id=question2803]').attr('checked')){
									 $("[id^='question36_S']").removeClass('mh_hide');
								}
							}else{
								$("[id^='question36_S']").addClass('mh_hide');
							}	
							}}
							
							if(num == 189){
								
							if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {
							if($('input[id=question2601]').attr('checked') == "checked"){
								if($('input[id=question2811]').attr('checked') || $('input[id=question2812]').attr('checked') ||$('input[id=question2813]').attr('checked')){
									 $("[id^='question36_S']").removeClass('mh_hide');
								}
							}else{
								$("[id^='question36_S']").addClass('mh_hide');
							}	
							}}
							
							if(num == 294){
							if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {
							if($('input[id=question2971]').attr('checked') == "checked"){
								if($('input[id=question3001]').attr('checked') || $('input[id=question3002]').attr('checked') ||$('input[id=question3003]').attr('checked')){
									 $("[id^='question291_S']").removeClass('mh_hide');
								}
							}else{
								$("[id^='question291_S']").addClass('mh_hide');
							}	
							}}
							
							if(num == 309){
							if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {
							if($('input[id=question2971]').attr('checked') == "checked"){
								if($('input[id=question3031]').attr('checked') || $('input[id=question3032]').attr('checked') ||$('input[id=question3033]').attr('checked')){
									 $("[id^='question291_S']").removeClass('mh_hide');
								}
							}else{
								$("[id^='question291_S']").addClass('mh_hide');
							}	
							}}
							
							if(num == 295){
							if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {

							if($('input[id=question2981]').attr('checked') == "checked"){
								if($('input[id=question3011]').attr('checked') || $('input[id=question3012]').attr('checked') ||$('input[id=question3013]').attr('checked')){
									 $("[id^='question292_S']").removeClass('mh_hide');
								}
							}else{
								$("[id^='question292_S']").addClass('mh_hide');
							}	
							}}
							
							if(num == 310){
								if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {

								if($('input[id=question2981]').attr('checked') == "checked"){
									if($('input[id=question3041]').attr('checked') || $('input[id=question3042]').attr('checked') ||$('input[id=question3043]').attr('checked')){
										 $("[id^='question292_S']").removeClass('mh_hide');
									}
								}else{
									$("[id^='question292_S']").addClass('mh_hide');
								}	
								}}
							
							if(num == 296){
								if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {

								if($('input[id=question2991]').attr('checked') == "checked"){
									if($('input[id=question3021]').attr('checked') || $('input[id=question3022]').attr('checked') ||$('input[id=question3023]').attr('checked')){
										 $("[id^='question293_S']").removeClass('mh_hide');
									}
								}else{
									$("[id^='question293_S']").addClass('mh_hide');
								}	
								}}
								
								if(num == 311){
									if($(this).val() == "More than a year ago" || $(this).val() == "Cannot remember") {

									if($('input[id=question2991]').attr('checked') == "checked"){
										if($('input[id=question3051]').attr('checked') || $('input[id=question3052]').attr('checked') ||$('input[id=question3053]').attr('checked')){
											 $("[id^='question293_S']").removeClass('mh_hide');
										}
									}else{
										$("[id^='question293_S']").addClass('mh_hide');
									}	
									}} */
							
							
							if ($(this).val() == no) {
								
								$("[id^='" + id + "_c'] > input[name^='question'][type=radio]").attr('checked', false);					
							} else {
								$("[id^='" + id + "_c']").removeClass('mh_hide');
								$("[id^='" + id + "_c']").removeClass('mh_hide');	
							}
						} 					
							
						
						else if (num == 273) {
							
							if($(this).val() == yes) {
								$("[id^='question273_a']").removeClass('mh_hide');
								$("[id^='table_data_row']").removeClass('mh_hide');
							}
							else if($(this).val() == "No") {
								$("[id^='question22_BP']").addClass('mh_hide');
								
								$("[id^='question273_a']").addClass('mh_hide');
								
								$("[id^='question273_a1']").addClass('mh_hide');
								$("[id^='question273_a2']").addClass('mh_hide');
								$("[id^='question273_a3']").addClass('mh_hide');
								$("[id^='question273_a4']").addClass('mh_hide');
								
								$("[id^='question33_c']").addClass('mh_hide');
								$("[id^='question33_qc7']").addClass('mh_hide');
								
								$("[id^='question34_c']").addClass('mh_hide');
								$("[id^='question34_c1']").addClass('mh_hide');
								$("[id^='question34_qc7']").addClass('mh_hide');
								$("[id^='question34_S1']").addClass('mh_hide');
								$("[id^='question34_S2']").addClass('mh_hide'); 
								
								
								$("[id^='question35_c']").addClass('mh_hide');
								$("[id^='question35_qc7']").addClass('mh_hide');
								$("[id^='question35_S1']").addClass('mh_hide');
								$("[id^='question35_S2']").addClass('mh_hide');
								
								$("[id^='question291_c']").addClass('mh_hide');
								$("[id^='question291_c1']").addClass('mh_hide');
								$("[id^='question291_qc7']").addClass('mh_hide');
								$("[id^='question291_S1']").addClass('mh_hide');
								$("[id^='question291_S2']").addClass('mh_hide');
								
								$("[id^='question292_c']").addClass('mh_hide');
								$("[id^='question292_qc7']").addClass('mh_hide');
								$("[id^='question292_S1']").addClass('mh_hide');
								$("[id^='question292_S2']").addClass('mh_hide');
								
								$("[id^='question293_c']").addClass('mh_hide');
								$("[id^='question293_qc7']").addClass('mh_hide');
								$("[id^='question293_S1']").addClass('mh_hide');
								$("[id^='question293_S2']").addClass('mh_hide');
								
								$("[id^='question36_c']").addClass('mh_hide');
								$("[id^='question36_qc7']").addClass('mh_hide');
								$("[id^='question36_S1']").addClass('mh_hide');
								$("[id^='question36_S2']").addClass('mh_hide');
								$("[id^='table_data_row']").addClass('mh_hide');
								

								
								$('input[name=question33]').attr('checked', false);
								$('input[name=question41]').attr('checked', false);
								$('input[name=question42]').attr('checked', false);
								$('input[name=question274]').attr('checked', false);
								$('input[name=question275]').attr('checked', false);
								$('input[name=question34]').attr('checked', false);
								$('input[name=question43]').attr('checked', false);
								$('input[name=question44]').attr('checked', false);
								$('input[name=question276]').attr('checked', false);
								$('input[name=question277]').attr('checked', false);
								$('input[name=question282]').attr('checked', false);
								$('input[name=question189]').attr('checked', false);
								$('input[name=question260]').attr('checked', false);
								
								$('input[name=question35]').attr('checked', false);
								$('input[name=question45]').attr('checked', false);
								$('input[name=question46]').attr('checked', false);
								$('input[name=question278]').attr('checked', false);
								$('input[name=question279]').attr('checked', false);
								$('input[name=question283]').attr('checked', false);
								
								$('input[name=question36]').attr('checked', false);
								$('input[name=question47]').attr('checked', false);
								$('input[name=question48]').attr('checked', false);
								$('input[name=question280]').attr('checked', false);
								$('input[name=question281]').attr('checked', false);
								$('input[name=question284]').attr('checked', false);
								$('input[name=question283]').attr('checked', false);
								
								$('input[name=question291]').attr('checked', false);
								$('input[name=question292]').attr('checked', false);
								$('input[name=question293]').attr('checked', false);
								$('input[name=question294]').attr('checked', false);
								$('input[name=question295]').attr('checked', false);
								$('input[name=question296]').attr('checked', false);
								$('input[name=question297]').attr('checked', false);
								$('input[name=question298]').attr('checked', false);
								$('input[name=question299]').attr('checked', false);
								$('input[name=question300]').attr('checked', false);
								$('input[name=question301]').attr('checked', false);
								$('input[name=question302]').attr('checked', false);
								$('input[name=question303]').attr('checked', false);
								$('input[name=question304]').attr('checked', false);
								$('input[name=question305]').attr('checked', false);
								$('input[name=question306]').attr('checked', false);
								$('input[name=question307]').attr('checked', false);
								$('input[name=question308]').attr('checked', false);
								$('input[name=question309]').attr('checked', false);
								$('input[name=question310]').attr('checked', false);
								$('input[name=question311]').attr('checked', false);
								
							}
							
							
						}
						
						
						
			});

			
			$('input:checkbox[name^="question"]').click(
					function() {
						var name = $(this).attr("name");
						var val = $(this).val();
						var none = $("input[value='None of these'][name=" + name + "]")
						if ($(this).is(':checked')) {

							if (val == "None of these") {
								$("input:checkbox[name=" + name + "]")
										.not(none).attr('checked', false);
							} else {
								none.attr('checked', false);
							}

						}

					});

			$("input[name=question21]").change(
					function() {
						if ($(this).val() == yes) {
							$("[id^='question21_BP']").removeClass('mh_hide');
						} else {
							$("[id^='question21_BP']").addClass('mh_hide');
							$('input[name=question191]').attr('checked', false);
							$('input[name=question192]').attr('checked', false);
							$('input[name=question193]').attr('checked', false);
							$('input[name=question194]').attr('checked', false);
							$('input[name=question195]').attr('checked', false);
							$('input[name=question196]').attr('checked', false);
							$('input[name=question199]').attr('checked', false);
							$('input[name=question200]').attr('checked', false);
							$('input[name=question201]').attr('checked', false);
							$('input[name=question202]').attr('checked', false);
							$('input[name=question203]').attr('checked', false);
							$('input[name=question204]').attr('checked', false);
							$('input[name=question206]').attr('checked', false);
							$('input[name=question207]').attr('checked', false);						

						}

					});
			
			$("input[name=question20]").change(
					function() {
					
						if ($(this).val() == "Yes I have") {
							$('input[name=question37]').attr('checked', false);
							
							$("[id^='question285_current']").removeClass('mh_hide');
							$("[id^='question20_past']").addClass('mh_hide');
							
						}
						else if ($(this).val() == "Yes I had"){
							$('input[name=question285]').attr('checked', false);
							
							$("[id^='question285_current']").addClass('mh_hide');
							$("[id^='question20_past']").removeClass('mh_hide');
						}
					}); 
			
			$("input[name=question32]").change(
					function() {
					
						if ($(this).val() == "Yes I have") {
							$('input[name=question39]').attr('checked', false);
							
							$("[id^='question286_current']").removeClass('mh_hide');
							$("[id^='question32_past']").addClass('mh_hide');
							
						}
						else if ($(this).val() == "Yes I had"){
							$('input[name=question286]').attr('checked', false);
							
							$("[id^='question286_current']").addClass('mh_hide');
							$("[id^='question32_past']").removeClass('mh_hide');
						}
					}); 
			
				
			$("input[name=question33]").change(
					function() {
					
						if ($(this).val() == "Yes I have") {
							
							$('input[name=question41]').attr('checked', false);
							$('input[name=question275]').attr('checked', false);
							$("[id^='question33_c1']").removeClass('mh_hide');
							$("[id^='question33_c5']").removeClass('mh_hide');
							$("[id^='question33_c']").removeClass('mh_hide');
							
							$("[id^='question287_current']").removeClass('mh_hide');
							$("[id^='question33_past']").addClass('mh_hide');
							
							$("[id^='question33_qc6']").addClass('mh_hide');
							$("[id^='question33_qc7']").addClass('mh_hide');
							$("[id^='question33_qc4']").removeClass('mh_hide');
							$("[id^='question33_qc5']").removeClass('mh_hide');
							
							
						
						}
						else if ($(this).val() == "Yes I had"){
							
							$('input[name=question287]').attr('checked', false);
							$('input[name=question274]').attr('checked', false);
							
							$("[id^='question33_c1']").removeClass('mh_hide');
							$("[id^='question33_c5']").removeClass('mh_hide');
							$("[id^='question33_c']").removeClass('mh_hide');
							
							$("[id^='question287_current']").addClass('mh_hide');
							$("[id^='question33_past']").removeClass('mh_hide');
							
							$("[id^='question33_qc4']").addClass('mh_hide');
							$("[id^='question33_qc5']").addClass('mh_hide');
							$("[id^='question33_qc6']").removeClass('mh_hide');
							$("[id^='question33_qc7']").removeClass('mh_hide');
						}
						else if ($(this).val() == "No"){
							$("[id^='question33_c1']").addClass('mh_hide');
							$("[id^='question33_c5']").addClass('mh_hide');
							$("[id^='question33_c']").addClass('mh_hide');
						}
					}); 
			
			$("input[name=question34]").change(
					function() {
					
						if ($(this).val() == "Yes I have") {
							$('[name=question261]').val("0");
							$('[name=question262]').val("0");
							$('input[name=question43]').attr('checked', false);
							$('input[name=question44]').attr('checked', false);
							$('input[name=question261]').val("0");
							$('input[name=question262]').val("0");
							$('input[name=question277]').attr('checked', false);
							$('input[name=question282]').attr('checked', false);
							
							
							$("[id^='question34_S1']").addClass('mh_hide');
							$("[id^='question34_S2']").addClass('mh_hide');
							$("[id^='question34_c1']").removeClass('mh_hide');
							$("[id^='question34_c5']").removeClass('mh_hide');
							$("[id^='question34_c']").removeClass('mh_hide');
							
							
							$("[id^='question288_current']").removeClass('mh_hide');
							$("[id^='question34_past']").addClass('mh_hide');
							
							$("[id^='question34_qc6']").addClass('mh_hide');
							$("[id^='question34_qc7']").addClass('mh_hide');
							$("[id^='question34_qc4']").removeClass('mh_hide');
							$("[id^='question34_qc5']").removeClass('mh_hide');
							
						}
						else if ($(this).val() == "Yes I had"){
							$('[name=question261]').val("0");
							$('[name=question262]').val("0");
							$('input[name=question43]').attr('checked', false);
							$('input[name=question44]').attr('checked', false);
							$('input[name=question261]').val("0");
							$('input[name=question262]').val("0");
							$('input[name=question288]').attr('checked', false);
							$('input[name=question282]').attr('checked', false);
							$('input[name=question276]').attr('checked', false);
							$("[id^='question34_c1']").removeClass('mh_hide');
							$("[id^='question34_c5']").removeClass('mh_hide');
							$("[id^='question34_c']").removeClass('mh_hide');
							
							$("[id^='question34_S1']").addClass('mh_hide');
							$("[id^='question34_S2']").addClass('mh_hide');
							
							$("[id^='question288_current']").addClass('mh_hide');
							$("[id^='question34_past']").removeClass('mh_hide');
							
							$("[id^='question34_qc4']").addClass('mh_hide');
							$("[id^='question34_qc5']").addClass('mh_hide');
							$("[id^='question34_qc6']").removeClass('mh_hide');
							$("[id^='question34_qc7']").removeClass('mh_hide');
						}
						else if ($(this).val() == "No"){
							
							$('input[name=question43]').attr('checked', false);
							$('input[name=question44]').attr('checked', false);
							$('input[name=question288]').attr('checked', false);
							$('input[name=question276]').attr('checked', false);
							$('input[name=question277]').attr('checked', false);
							
							
							$('[name=question261]').val("0");
							$('[name=question262]').val("0");
							//$("select[id^='question261']").val(1);
							//$("select[id^='question262']").val(1);
							$
							$("[id^='question34_c1']").addClass('mh_hide');
							$("[id^='question34_c5']").addClass('mh_hide');
							$("[id^='question34_c']").addClass('mh_hide');
							$("[id^='question34_S1']").addClass('mh_hide');
							$("[id^='question34_S2']").addClass('mh_hide');
						}
					}); 
			
			$("input[name=question35]").change(
					function() {
					
						if ($(this).val() == "Yes I have") {
							$('[name=question263]').val("0");
							$('[name=question264]').val("0");
							$('input[name=question45]').attr('checked', false);
							$('input[name=question46]').attr('checked', false);
							$('input[name=question283]').attr('checked', false);
							$('input[name=question279]').attr('checked', false);
							
							
							$("[id^='question35_c1']").removeClass('mh_hide');
							$("[id^='question35_c5']").removeClass('mh_hide');
							$("[id^='question35_c']").removeClass('mh_hide');
							
							$("[id^='question35_S1']").addClass('mh_hide');
							$("[id^='question35_S2']").addClass('mh_hide');
							
							$("[id^='question289_current']").removeClass('mh_hide');
							$("[id^='question35_past']").addClass('mh_hide');
							
							$("[id^='question35_qc6']").addClass('mh_hide');
							$("[id^='question35_qc7']").addClass('mh_hide');
							$("[id^='question35_qc4']").removeClass('mh_hide');
							$("[id^='question35_qc5']").removeClass('mh_hide');
						}
						else if ($(this).val() == "Yes I had"){
							$('[name=question263]').val("0");
							$('[name=question264]').val("0");
							$('input[name=question289]').attr('checked', false);
							$('input[name=question46]').attr('checked', false);
							$('input[name=question283]').attr('checked', false);
							$('input[name=question278]').attr('checked', false);
							
							$("[id^='question35_c1']").removeClass('mh_hide');
							$("[id^='question35_c5']").removeClass('mh_hide');
							$("[id^='question35_c']").removeClass('mh_hide');
							
							$("[id^='question35_S1']").addClass('mh_hide');
							$("[id^='question35_S2']").addClass('mh_hide');
							
							$("[id^='question289_current']").addClass('mh_hide');
							$("[id^='question35_past']").removeClass('mh_hide');
							
							$("[id^='question35_qc4']").addClass('mh_hide');
							$("[id^='question35_qc5']").addClass('mh_hide');
							$("[id^='question35_qc6']").removeClass('mh_hide');
							$("[id^='question35_qc7']").removeClass('mh_hide');
						}
						else if ($(this).val() == "No"){
							$('[name=question263]').val("0");
							$('[name=question264]').val("0");
							$('input[name=question45]').attr('checked', false);
							$('input[name=question46]').attr('checked', false);
							$('input[name=question283]').attr('checked', false);
							$('input[name=question279]').attr('checked', false);
							$('input[name=question289]').attr('checked', false);
							$('input[name=question46]').attr('checked', false);
							$('input[name=question283]').attr('checked', false);
							$('input[name=question278]').attr('checked', false);
							
							
							
							$("[id^='question35_c1']").addClass('mh_hide');
							$("[id^='question35_c5']").addClass('mh_hide');
							$("[id^='question35_c']").addClass('mh_hide');
							$("[id^='question35_S1']").addClass('mh_hide');
							$("[id^='question35_S2']").addClass('mh_hide');
						}
					}); 
			
			$("input[name=question36]").change(
					function() {
					
						if ($(this).val() == "Yes I have") {
							$('[name=question265]').val("0");
							$('[name=question269]').val("0");
							$('input[name=question189]').attr('checked', false);
							$('input[name=question260]').attr('checked', false);
							$('input[name=question284]').attr('checked', false);
							$('input[name=question281]').attr('checked', false);
							
							$("[id^='question36_c1']").removeClass('mh_hide');
							$("[id^='question36_c5']").removeClass('mh_hide');
							$("[id^='question36_c']").removeClass('mh_hide');
							
							$("[id^='question36_S1']").addClass('mh_hide');
							$("[id^='question36_S2']").addClass('mh_hide');
							
							$("[id^='question290_current']").removeClass('mh_hide');
							$("[id^='question36_past']").addClass('mh_hide');
							
							$("[id^='question36_qc6']").addClass('mh_hide');
							$("[id^='question36_qc7']").addClass('mh_hide');
							$("[id^='question36_qc4']").removeClass('mh_hide');
							$("[id^='question36_qc5']").removeClass('mh_hide');
						}
						else if ($(this).val() == "Yes I had"){
							$('[name=question265]').val("0");
							$('[name=question269]').val("0");
							$('input[name=question290]').attr('checked', false);
							$('input[name=question260]').attr('checked', false);
							$('input[name=question284]').attr('checked', false);
							$('input[name=question280]').attr('checked', false);
							
							$("[id^='question36_c1']").removeClass('mh_hide');
							$("[id^='question36_c5']").removeClass('mh_hide');
							$("[id^='question36_c']").removeClass('mh_hide');
							
							$("[id^='question36_S1']").addClass('mh_hide');
							$("[id^='question36_S2']").addClass('mh_hide');
							
							$("[id^='question290_current']").addClass('mh_hide');
							$("[id^='question36_past']").removeClass('mh_hide');
							
							$("[id^='question36_qc4']").addClass('mh_hide');
							$("[id^='question36_qc5']").addClass('mh_hide');
							$("[id^='question36_qc6']").removeClass('mh_hide');
							$("[id^='question36_qc7']").removeClass('mh_hide');
						}
						
						else if ($(this).val() == "No"){
							$('[name=question265]').val("0");
							$('[name=question269]').val("0");
							$('input[name=question189]').attr('checked', false);
							$('input[name=question260]').attr('checked', false);
							$('input[name=question281]').attr('checked', false);
							$('input[name=question280]').attr('checked', false);
							
							$('input[name=question290]').attr('checked', false);
							
							
							
							$("[id^='question36_c1']").addClass('mh_hide');
							$("[id^='question36_c5']").addClass('mh_hide');
							$("[id^='question36_c']").addClass('mh_hide');
							$("[id^='question36_S1']").addClass('mh_hide');
							$("[id^='question36_S2']").addClass('mh_hide');
						}
					}); 
			
			$("input[name=question291]").change(
					function() {
						
						if ($(this).val() == "Yes I have") {
							$('[name=question266]').val("0");
							$('[name=question270]').val("0");
							$('input[name=question309]').attr('checked', false);
							$('input[name=question297]').attr('checked', false);
							$('input[name=question303]').attr('checked', false);
							$('input[name=question306]').attr('checked', false); 
							 
							$("[id^='question291_S1']").addClass('mh_hide');
							$("[id^='question291_S2']").addClass('mh_hide'); 
							
							$("[id^='question294_current']").removeClass('mh_hide');
							$("[id^='question291_c']").removeClass('mh_hide');
							$("[id^='question291_past']").addClass('mh_hide');
							
							$("[id^='question291_qc6']").addClass('mh_hide');
							$("[id^='question291_qc7']").addClass('mh_hide'); 
							$("[id^='question291_qc4']").removeClass('mh_hide');
							$("[id^='question291_qc5']").removeClass('mh_hide');
						}
						else if ($(this).val() == "Yes I had"){
							$('[name=question266]').val("0");
							$('[name=question270]').val("0");
							$('input[name=question297]').attr('checked', false);
							$('input[name=question294]').attr('checked', false);
							$('input[name=question300]').attr('checked', false);
							$('input[name=question306]').attr('checked', false); 
							
							$("[id^='question291_S1']").addClass('mh_hide');
							$("[id^='question291_S2']").addClass('mh_hide');
							
							$("[id^='question294_current']").addClass('mh_hide');
							$("[id^='question291_past']").removeClass('mh_hide');
							
							$("[id^='question291_qc4']").addClass('mh_hide');
							$("[id^='question291_qc5']").addClass('mh_hide');
							$("[id^='question291_qc6']").removeClass('mh_hide');
							$("[id^='question291_qc7']").removeClass('mh_hide');
							
						}else if ($(this).val() == "No"){
							
							$('[name=question266]').val("0");
							$('[name=question270]').val("0");
							$('input[name=question309]').attr('checked', false);
							$('input[name=question297]').attr('checked', false);
							$('input[name=question303]').attr('checked', false);
							$('input[name=question294]').attr('checked', false);
							$('input[name=question300]').attr('checked', false);
							
							
						}
					}); 
			
			$("input[name=question292]").change(
					function() {
						if ($(this).val() == "Yes I have") {
							$('[name=question267]').val("0");
							$('[name=question271]').val("0");
							$('input[name=question310]').attr('checked', false);
							$('input[name=question298]').attr('checked', false);
							$('input[name=question304]').attr('checked', false);
							$('input[name=question307]').attr('checked', false);  
							 
							$("[id^='question292_S1']").addClass('mh_hide');
							$("[id^='question292_S2']").addClass('mh_hide'); 
							
							$("[id^='question295_current']").removeClass('mh_hide');
							$("[id^='question292_c']").removeClass('mh_hide');
							$("[id^='question292_past']").addClass('mh_hide');
							
							$("[id^='question292_qc6']").addClass('mh_hide');
							$("[id^='question292_qc7']").addClass('mh_hide'); 
							$("[id^='question292_qc4']").removeClass('mh_hide');
							$("[id^='question292_qc5']").removeClass('mh_hide');
						}
						else if ($(this).val() == "Yes I had"){
							$('[name=question267]').val("0");
							$('[name=question271]').val("0");
							$('input[name=question298]').attr('checked', false);
							$('input[name=question295]').attr('checked', false);
							$('input[name=question301]').attr('checked', false);
							$('input[name=question307]').attr('checked', false); 
							
							$("[id^='question292_S1']").addClass('mh_hide');
							$("[id^='question292_S2']").addClass('mh_hide');
							
							$("[id^='question295_current']").addClass('mh_hide');
							$("[id^='question292_past']").removeClass('mh_hide');
							
							$("[id^='question292_qc4']").addClass('mh_hide');
							$("[id^='question292_qc5']").addClass('mh_hide');
							$("[id^='question292_qc6']").removeClass('mh_hide');
							$("[id^='question292_qc7']").removeClass('mh_hide');
							
						}else if ($(this).val() == "No"){
							$('[name=question267]').val("0");
							$('[name=question271]').val("0");
							$('input[name=question310]').attr('checked', false);
							$('input[name=question298]').attr('checked', false);
							$('input[name=question304]').attr('checked', false);
							$('input[name=question295]').attr('checked', false);
							$('input[name=question301]').attr('checked', false);
						}
					}); 
			
			$("input[name=question293]").change(
					function() {
						if ($(this).val() == "Yes I have") {
							$('[name=question268]').val("0");
							$('[name=question272]').val("0");
							$('input[name=question311]').attr('checked', false);
							$('input[name=question299]').attr('checked', false);
							$('input[name=question305]').attr('checked', false);
							$('input[name=question308]').attr('checked', false);
							 
							$("[id^='question293_S1']").addClass('mh_hide');
							$("[id^='question293_S2']").addClass('mh_hide'); 
							
							$("[id^='question296_current']").removeClass('mh_hide');
							$("[id^='question293_c']").removeClass('mh_hide');
							$("[id^='question293_past']").addClass('mh_hide');
							
							$("[id^='question293_qc6']").addClass('mh_hide');
							$("[id^='question293_qc7']").addClass('mh_hide'); 
							$("[id^='question293_qc4']").removeClass('mh_hide');
							$("[id^='question293_qc5']").removeClass('mh_hide');
						}
						else if ($(this).val() == "Yes I had"){
							$('[name=question268]').val("0");
							$('[name=question272]').val("0");
							$('input[name=question296]').attr('checked', false);
							$('input[name=question302]').attr('checked', false);
							$('input[name=question308]').attr('checked', false); 
							
							$("[id^='question293_S1']").addClass('mh_hide');
							$("[id^='question293_S2']").addClass('mh_hide');
							
							$("[id^='question296_current']").addClass('mh_hide');
							$("[id^='question293_past']").removeClass('mh_hide');
							
							$("[id^='question293_qc4']").addClass('mh_hide');
							$("[id^='question293_qc5']").addClass('mh_hide');
							$("[id^='question293_qc6']").removeClass('mh_hide');
							$("[id^='question293_qc7']").removeClass('mh_hide');
							
						}else if ($(this).val() == "No"){
							$('[name=question268]').val("0");
							$('[name=question272]').val("0");
							$('input[name=question311]').attr('checked', false);
							$('input[name=question299]').attr('checked', false);
							$('input[name=question305]').attr('checked', false);
							$('input[name=question296]').attr('checked', false);
							$('input[name=question302]').attr('checked', false);
							
							
						}
					}); 
			
			
			
			$("input[name=question273]").change(
					function() {
					
						if ($(this).val() == yes) {
							$("[id^='question273_a']").removeClass('mh_hide');
							$("[id^='question273_a1']").removeClass('mh_hide');
							$("[id^='question273_a2']").removeClass('mh_hide');
							$("[id^='question273_a3']").removeClass('mh_hide');
							$("[id^='question273_a4']").removeClass('mh_hide');
							$("[id^='table_data_row']").removeClass('mh_hide');
						
							

						} else {
							
							$("[id^='question22_BP']").addClass('mh_hide');
							
							$("[id^='question273_a']").addClass('mh_hide');
							
							$("[id^='question273_a1']").addClass('mh_hide');
							$("[id^='question273_a2']").addClass('mh_hide');
							$("[id^='question273_a3']").addClass('mh_hide');
							$("[id^='question273_a4']").addClass('mh_hide');
							
							$("[id^='question33_c']").addClass('mh_hide');
							$("[id^='question33_qc7']").addClass('mh_hide');
							
							$("[id^='question34_c']").addClass('mh_hide');
							$("[id^='question34_c1']").addClass('mh_hide');
							$("[id^='question34_qc7']").addClass('mh_hide');
							$("[id^='question34_S1']").addClass('mh_hide');
							$("[id^='question34_S2']").addClass('mh_hide'); 
							
							
							$("[id^='question35_c']").addClass('mh_hide');
							$("[id^='question35_qc7']").addClass('mh_hide');
							$("[id^='question35_S1']").addClass('mh_hide');
							$("[id^='question35_S2']").addClass('mh_hide');
							
							$("[id^='question291_c']").addClass('mh_hide');
							$("[id^='question291_c1']").addClass('mh_hide');
							$("[id^='question291_qc7']").addClass('mh_hide');
							$("[id^='question291_S1']").addClass('mh_hide');
							$("[id^='question291_S2']").addClass('mh_hide');
							
							$("[id^='question292_c']").addClass('mh_hide');
							$("[id^='question292_qc7']").addClass('mh_hide');
							$("[id^='question292_S1']").addClass('mh_hide');
							$("[id^='question292_S2']").addClass('mh_hide');
							
							$("[id^='question293_c']").addClass('mh_hide');
							$("[id^='question293_qc7']").addClass('mh_hide');
							$("[id^='question293_S1']").addClass('mh_hide');
							$("[id^='question293_S2']").addClass('mh_hide');
							
							$("[id^='question36_c']").addClass('mh_hide');
							$("[id^='question36_qc7']").addClass('mh_hide');
							$("[id^='question36_S1']").addClass('mh_hide');
							$("[id^='question36_S2']").addClass('mh_hide');
							$("[id^='table_data_row']").addClass('mh_hide');
							

							
							$('input[name=question33]').attr('checked', false);
							$('input[name=question41]').attr('checked', false);
							$('input[name=question42]').attr('checked', false);
							$('input[name=question274]').attr('checked', false);
							$('input[name=question275]').attr('checked', false);
							$('input[name=question34]').attr('checked', false);
							$('input[name=question43]').attr('checked', false);
							$('input[name=question44]').attr('checked', false);
							$('input[name=question276]').attr('checked', false);
							$('input[name=question277]').attr('checked', false);
							$('input[name=question282]').attr('checked', false);
							$('input[name=question189]').attr('checked', false);
							$('input[name=question260]').attr('checked', false);
							
							$('input[name=question35]').attr('checked', false);
							$('input[name=question45]').attr('checked', false);
							$('input[name=question46]').attr('checked', false);
							$('input[name=question278]').attr('checked', false);
							$('input[name=question279]').attr('checked', false);
							$('input[name=question283]').attr('checked', false);
							
							$('input[name=question36]').attr('checked', false);
							$('input[name=question47]').attr('checked', false);
							$('input[name=question48]').attr('checked', false);
							$('input[name=question280]').attr('checked', false);
							$('input[name=question281]').attr('checked', false);
							$('input[name=question284]').attr('checked', false);
							$('input[name=question285]').attr('checked', false);
							$('input[name=question286]').attr('checked', false);
							$('input[name=question287]').attr('checked', false);
							$('input[name=question288]').attr('checked', false);
							$('input[name=question289]').attr('checked', false);
							$('input[name=question290]').attr('checked', false);
							
							$('input[name=question291]').attr('checked', false);
							$('input[name=question292]').attr('checked', false);
							$('input[name=question293]').attr('checked', false);
							$('input[name=question294]').attr('checked', false);
							$('input[name=question295]').attr('checked', false);
							$('input[name=question296]').attr('checked', false);
							$('input[name=question297]').attr('checked', false);
							$('input[name=question298]').attr('checked', false);
							$('input[name=question299]').attr('checked', false);
							$('input[name=question300]').attr('checked', false);
							$('input[name=question301]').attr('checked', false);
							$('input[name=question302]').attr('checked', false);
							$('input[name=question303]').attr('checked', false);
							$('input[name=question304]').attr('checked', false);
							$('input[name=question305]').attr('checked', false);
							$('input[name=question306]').attr('checked', false);
							$('input[name=question307]').attr('checked', false);
							$('input[name=question308]').attr('checked', false);
							$('input[name=question309]').attr('checked', false);
							$('input[name=question310]').attr('checked', false);
							$('input[name=question311]').attr('checked', false);
							
							$('[name=question262]').val("0");
							$('[name=question261]').val("0");
							$('[name=question263]').val("0");
							$('[name=question264]').val("0");							
							$('[name=question265]').val("0");
							$('[name=question269]').val("0");
							$('[name=question266]').val("0");
							$('[name=question270]').val("0");
							$('[name=question266]').val("0");
							$('[name=question270]').val("0");
							$('[name=question267]').val("0");
							$('[name=question271]').val("0");
							$('[name=question268]').val("0");
							$('[name=question272]').val("0");
							
						}
					});

			$("input[name=question22]").change(
					function() {
					
						if ($(this).val() == yes) {
							$("[id^='question22_BP']").removeClass('mh_hide');

						} else {
							$("[id^='question22_BP']").addClass('mh_hide');
							$('input[name=question209]').attr('checked', false);
							$('input[name=question210]').attr('checked', false);
							$('input[name=question211]').attr('checked', false);
							$('input[name=question212]').attr('checked', false);
							$('input[name=question214]').attr('checked', false);
							$('input[name=question215]').attr('checked', false);
							$('input[name=question216]').attr('checked', false);
							$('input[name=question217]').attr('checked', false);

						}
					});
			/* Code for hiding and opening on cantremember field and for past year */
			
			/* E-F */
			/* question 276 */
				$("input[name=question276]").change(
					function() {
						if ($(this).val() == "Left side" || $(this).val() == "Right side" || $(this).val() == "Both side") {
							/*  testing*/
						   if ($('input[id=question341]').attr('checked')) {
							   
							   $("[id^='question34_S']").removeClass('mh_hide');
							   if ($(this).val() == "Left side") {
								   
								   $('[name=question262]').val("0");
								   $('[name=question261]').val("0");
								  
								   $("[id^='bothSidePain01']").removeClass('mh_hide');
								   $("[id^='bothSidePain02']").addClass('mh_hide');
							   }
							   else if ( $(this).val() == "Right side") {
								   
								   $('[name=question262]').val("0");
								   $('[name=question261]').val("0");
								 
								   $("[id^='bothSidePain01']").addClass('mh_hide');
								   $("[id^='bothSidePain02']").removeClass('mh_hide');
							   }
							   else{
								   $("[id^='bothSidePain01']").removeClass('mh_hide');
								   $("[id^='bothSidePain02']").removeClass('mh_hide');
								  
							   }
							   
						}else{
							$("[id^='question34_S']").addClass('mh_hide');
						}
						   
							/* End testing */
						}else{
							$("[id^='question34_S']").addClass('mh_hide');
						} 
						
					});
			
			/* question 281,260 */
			$("input[name=question44]").change(
					
					function() {
						if($('input[id=question342]').attr('checked')){
						if ($(this).val() == "Past year" || $(this).val() == "1-2 years ago" || $(this).val() == "3-5 years ago" || $(this).val() == "More than 5 years ago" || $(this).val() == "Cannot remember") {
							/*  testing*/
							if($('input[id=question2771]').attr('checked') || $('input[id=question2772]').attr('checked') ||$('input[id=question2773]').attr('checked')){
								$("[id^='question34_S']").removeClass('mh_hide');
								 if ($('input[id=question2771]').attr('checked')) {
									
									   $("[id^='bothSidePain01']").removeClass('mh_hide');
									   $("[id^='bothSidePain02']").addClass('mh_hide');
								   }
								 else if ($('input[id=question2772]').attr('checked')) {
										
									  
									   $("[id^='bothSidePain01']").addClass('mh_hide');
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
								   }
								   else{
									  
									   $("[id^='bothSidePain01']").removeClass('mh_hide');
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
									  
								   }
							}
							else{
								$("[id^='question34_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question34_S']").addClass('mh_hide');
						} 
						}
						
					});
			
			$("input[name=question277]").change(
					function() {
						if ($(this).val() == "Left side"||$(this).val() == "Right side"||$(this).val() == "Both side") {
							/*  testing*/
							if($('input[id=question441]').attr('checked') || $('input[id=question442]').attr('checked') || $('input[id=question443]').attr('checked') || $('input[id=question444]').attr('checked') || $('input[id=question445]').attr('checked')){
								$("[id^='question34_S']").removeClass('mh_hide');	
								 if ($(this).val() == "Left side") {
									 
									  $('[name=question262]').val("0");
									  $('[name=question261]').val("0");
									  
									   $("[id^='bothSidePain01']").removeClass('mh_hide');
									   $("[id^='bothSidePain02']").addClass('mh_hide');
								   }
								 else if ($(this).val() == "Right side") {
									 
									   $('[name=question261]').val("0");
									   $('[name=question262]').val("0");
									 
									   $("[id^='bothSidePain01']").addClass('mh_hide');
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain01']").removeClass('mh_hide');
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
									 
								   }
							}
							else{
								$("[id^='question34_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question34_S']").addClass('mh_hide');
						} 
						
					});
			
			/* Q-35 */
			
			/* question 278 */
				$("input[name=question278]").change(
					function() {
						if ($(this).val() == "Left side" || $(this).val() == "Right side" || $(this).val() == "Both side") {
							/*  testing*/
						   if ($('input[id=question351]').attr('checked')) {
							   
							   $("[id^='question35_S']").removeClass('mh_hide');
							   if ($(this).val() == "Left side") {
								   
								   $('[name=question263]').val("0");
								   $('[name=question264]').val("0");
								   $("[id^='bothSidePain03']").removeClass('mh_hide');
								   $("[id^='bothSidePain04']").addClass('mh_hide');
							   }
							   else  if ($(this).val() == "Right side") {
								   $('[name=question263]').val("0");
								   $('[name=question264]').val("0");
								   $("[id^='bothSidePain03']").addClass('mh_hide');
								   $("[id^='bothSidePain04']").removeClass('mh_hide');
							   }
							   else{
								   $("[id^='bothSidePain03']").removeClass('mh_hide');
								   $("[id^='bothSidePain04']").removeClass('mh_hide');
							   }
							   
						}else{
							$("[id^='question35_S']").addClass('mh_hide');
						}
						   
							/* End testing */
						}else{
							$("[id^='question35_S']").addClass('mh_hide');
						} 
						
					});
			
			/* question 281,260 */
			$("input[name=question46]").change(
					
					function() {
						if($('input[id=question352]').attr('checked')){
							if ($(this).val() == "Past year" || $(this).val() == "1-2 years ago" || $(this).val() == "3-5 years ago" || $(this).val() == "More than 5 years ago" || $(this).val() == "Cannot remember") {
							/*  testing*/
							if($('input[id=question2791]').attr('checked') || $('input[id=question2792]').attr('checked') ||$('input[id=question2793]').attr('checked')){
								$("[id^='question35_S']").removeClass('mh_hide');
								 if ($('input[id=question2791]').attr('checked')) {
									
									 
									   $("[id^='bothSidePain03']").removeClass('mh_hide');
									   $("[id^='bothSidePain04']").addClass('mh_hide');
								   }
								 else if ($('input[id=question2792]').attr('checked')) {
										
									   
									   $("[id^='bothSidePain03']").addClass('mh_hide');
									   $("[id^='bothSidePain04']").removeClass('mh_hide');
								   }
								   else{
									  
									   $("[id^='bothSidePain02']").removeClass('mh_hide');
									   $("[id^='bothSidePain03']").removeClass('mh_hide');
									   
								   }
							}
							else{
								$("[id^='question35_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question35_S']").addClass('mh_hide');
						} 
						}
						
					});
			
			$("input[name=question279]").change(
					function() {
						if ($(this).val() == "Left side"||$(this).val() == "Right side"||$(this).val() == "Both side") {
							/*  testing*/
							if($('input[id=question461]').attr('checked') || $('input[id=question462]').attr('checked') || $('input[id=question463]').attr('checked') || $('input[id=question464]').attr('checked') || $('input[id=question465]').attr('checked')){
								$("[id^='question35_S']").removeClass('mh_hide');	
								 if ($(this).val() == "Left side") {
									 
									  $('[name=question263]').val("0");
									  $('[name=question264]').val("0");
									  
									   $("[id^='bothSidePain03']").removeClass('mh_hide');
									   $("[id^='bothSidePain04']").addClass('mh_hide');
								   }
								 else if ($(this).val() == "Right side") {
									 
									 $('[name=question263]').val("0");
									 $('[name=question264]').val("0");
									  
									   $("[id^='bothSidePain03']").addClass('mh_hide');
									   $("[id^='bothSidePain04']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain03']").removeClass('mh_hide');
									   $("[id^='bothSidePain04']").removeClass('mh_hide');
									  
								   }
							}
							else{
								$("[id^='question35_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question35_S']").addClass('mh_hide');
						} 
						
					});
			/*End E-f  */
			
			
			
			
			/* question 280 */
				$("input[name=question280]").change(
					function() {
						if ($(this).val() == "Left side" || $(this).val() == "Right side" || $(this).val() == "Both side") {
							/*  testing*/
						   if ($('input[id=question361]').attr('checked')) {
							   
							   $("[id^='question36_S']").removeClass('mh_hide');
							   if ($(this).val() == "Left side") {
								   
								   $('[name=question265]').val("0");
								   $('[name=question269]').val("0");
								   
								   $("[id^='bothSidePain1']").removeClass('mh_hide');
								   $("[id^='bothSidePain2']").addClass('mh_hide');
							   }else if ($(this).val() == "Right side") {
								   $('[name=question265]').val("0");
								   $('[name=question269]').val("0");
								  
								   $("[id^='bothSidePain1']").addClass('mh_hide');
								   $("[id^='bothSidePain2']").removeClass('mh_hide');
							   }
							   else{
								   $("[id^='bothSidePain1']").removeClass('mh_hide');
								   $("[id^='bothSidePain2']").removeClass('mh_hide');
								  
							   }
							   
						}else{
							$("[id^='question36_S']").addClass('mh_hide');
						}
						   
							/* End testing */
						}else{
							$("[id^='question36_S']").addClass('mh_hide');
						} 
						
					});
			
			/* question 281,260 */
			$("input[name=question260]").change(
					
					function() {
						if($('input[id=question362]').attr('checked')){
							if ($(this).val() == "Past year" || $(this).val() == "1-2 years ago" || $(this).val() == "3-5 years ago" || $(this).val() == "More than 5 years ago" || $(this).val() == "Cannot remember") {
							/*  testing*/
							if($('input[id=question2811]').attr('checked') || $('input[id=question2812]').attr('checked') ||$('input[id=question2813]').attr('checked')){
								$("[id^='question36_S']").removeClass('mh_hide');
								 if ($('input[id=question2811]').attr('checked')) {
									
									 
									   $("[id^='bothSidePain1']").removeClass('mh_hide');
									   $("[id^='bothSidePain2']").addClass('mh_hide');
								   
								 }else if ($('input[id=question2812]').attr('checked')) {
									
									   
									   $("[id^='bothSidePain1']").addClass('mh_hide');
									   $("[id^='bothSidePain2']").removeClass('mh_hide');
								   }
								   else{
									  
									   $("[id^='bothSidePain1']").removeClass('mh_hide');
									   $("[id^='bothSidePain2']").removeClass('mh_hide');
									  
								   }
							}
							else{
								$("[id^='question36_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question36_S']").addClass('mh_hide');
						} 
						}
						
					});
			
			$("input[name=question281]").change(
					function() {
						if ($(this).val() == "Left side"||$(this).val() == "Right side"||$(this).val() == "Both side") {
							/*  testing*/
							if($('input[id=question2601]').attr('checked') || $('input[id=question2602]').attr('checked')  || $('input[id=question2603]').attr('checked')  || $('input[id=question2604]').attr('checked')  || $('input[id=question2605]').attr('checked')){
								$("[id^='question36_S']").removeClass('mh_hide');	
								 if ($(this).val() == "Left side") {
									 
									 $('[name=question265]').val("0");
									 $('[name=question269]').val("0");
									  
									   $("[id^='bothSidePain1']").removeClass('mh_hide');
									   $("[id^='bothSidePain2']").addClass('mh_hide');
								   }
								 else if ($(this).val() == "Right side") {
									 
									 $('[name=question265]').val("0");
									 $('[name=question269]').val("0");
									 
									   $("[id^='bothSidePain1']").addClass('mh_hide');
									   $("[id^='bothSidePain2']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain1']").removeClass('mh_hide');
									   $("[id^='bothSidePain2']").removeClass('mh_hide');
									  
								   }
							}
							else{
								$("[id^='question36_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question36_S']").addClass('mh_hide');
						} 
						
					});
			
		
			/* Q 300 */
				$("input[name=question300]").change(
					function() {
						if ($(this).val() == "Left side" || $(this).val() == "Right side" || $(this).val() == "Both side") {
							/*  testing*/
						   if ($('input[id=question2911]').attr('checked')) {
							   $("[id^='question291_S']").removeClass('mh_hide');
							   if ($(this).val() == "Left side") {
								   
								   $('[name=question266]').val("0");
								   $('[name=question270]').val("0");
								  
								   $("[id^='bothSidePain3']").removeClass('mh_hide');
								   $("[id^='bothSidePain4']").addClass('mh_hide');
								   
							   }else if ($(this).val() == "Right side") {
								   
								   $('[name=question266]').val("0");
								   $('[name=question270]').val("0");
								  
								   $("[id^='bothSidePain3']").addClass('mh_hide');
								   $("[id^='bothSidePain4']").removeClass('mh_hide');
							   }
							   else{
								   $("[id^='bothSidePain3']").removeClass('mh_hide');
								   $("[id^='bothSidePain4']").removeClass('mh_hide');
								 
							   }
							  
						}else{
							$("[id^='question291_S']").addClass('mh_hide');
						}
						   
							/* End testing */
						}else{
							$("[id^='question291_S']").addClass('mh_hide');
						} 
						
					});
			
			/* Q 303,297 */
			
			$("input[name=question297]").change(
					function() {
						if($('input[id=question2912]').attr('checked')){
							if ($(this).val() == "Past year" || $(this).val() == "1-2 years ago" || $(this).val() == "3-5 years ago" || $(this).val() == "More than 5 years ago" || $(this).val() == "Cannot remember") {
							/*  testing*/
							if($('input[id=question3031]').attr('checked') || $('input[id=question3032]').attr('checked') ||$('input[id=question3033]').attr('checked')){
								$("[id^='question291_S']").removeClass('mh_hide');
								
								 if ($('input[id=question3031]').attr('checked')) {
									 
									  
									   $("[id^='bothSidePain3']").removeClass('mh_hide');
									   $("[id^='bothSidePain4']").addClass('mh_hide');
								   }else if ($('input[id=question3032]').attr('checked')) {
									 
									
									   $("[id^='bothSidePain3']").addClass('mh_hide');
									   $("[id^='bothSidePain4']").removeClass('mh_hide');
								   }
								   else{
									  
									   $("[id^='bothSidePain3']").removeClass('mh_hide');
									   $("[id^='bothSidePain4']").removeClass('mh_hide');
									 
								   }
							}
							else{
								$("[id^='question291_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question291_S']").addClass('mh_hide');
						} }
						
					});
			
			$("input[name=question303]").change(
					function() {
						if ($(this).val() == "Left side"||$(this).val() == "Right side"||$(this).val() == "Both side") {
							/*  testing*/
							if($('input[id=question2971]').attr('checked') || $('input[id=question2972]').attr('checked') || $('input[id=question2973]').attr('checked') || $('input[id=question2974]').attr('checked') || $('input[id=question2975]').attr('checked')){
								$("[id^='question291_S']").removeClass('mh_hide');	
								 if ($(this).val() == "Left side") {
									 
									 $('[name=question266]').val("0");
									 $('[name=question270]').val("0");
									 
									   $("[id^='bothSidePain3']").removeClass('mh_hide');
									   $("[id^='bothSidePain4']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   
									   $('[name=question266]').val("0");
									   $('[name=question270]').val("0");
									   
									   $("[id^='bothSidePain3']").addClass('mh_hide');
									   $("[id^='bothSidePain4']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain3']").removeClass('mh_hide');
									   $("[id^='bothSidePain4']").removeClass('mh_hide');
									  
								   }
							}
							else{
								$("[id^='question291_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question291_S']").addClass('mh_hide');
						} 
						
					});
			
			/* Q301 */
			
			$("input[name=question301]").change(
					function() {
						if ($(this).val() == "Left side" || $(this).val() == "Right side" || $(this).val() == "Both side") {
							/*  testing*/
						   if ($('input[id=question2921]').attr('checked')) {
							   $("[id^='question292_S']").removeClass('mh_hide');
							   
							   if ($(this).val() == "Left side") {
								   
								   $('[name=question267]').val("0");
								   $('[name=question271]').val("0");
								 
								   $("[id^='bothSidePain5']").removeClass('mh_hide');
								   $("[id^='bothSidePain6']").addClass('mh_hide');
							   }else if ($(this).val() == "Right side") {
								   

								   $('[name=question267]').val("0");
								   $('[name=question271]').val("0");
								 
								   $("[id^='bothSidePain5']").addClass('mh_hide');
								   $("[id^='bothSidePain6']").removeClass('mh_hide');
							   }
							   else{
								   $("[id^='bothSidePain5']").removeClass('mh_hide');
								   $("[id^='bothSidePain6']").removeClass('mh_hide');
								  
							   }
							  
						}else{
							$("[id^='question292_S']").addClass('mh_hide');
						}
						   
							/* End testing */
						}else{
							$("[id^='question292_S']").addClass('mh_hide');
						} 
						
					});
			
			/* Q 304,298 */
			
			$("input[name=question298]").change(
					function() {
						if($('input[id=question2922]').attr('checked')){
							if ($(this).val() == "Past year" || $(this).val() == "1-2 years ago" || $(this).val() == "3-5 years ago" || $(this).val() == "More than 5 years ago" || $(this).val() == "Cannot remember") {
							/*  testing*/
							if($('input[id=question3041]').attr('checked') || $('input[id=question3042]').attr('checked') ||$('input[id=question3043]').attr('checked')){
								$("[id^='question292_S']").removeClass('mh_hide');	
								
								if ($('input[id=question3041]').attr('checked')) {
									
									 
									   $("[id^='bothSidePain5']").removeClass('mh_hide');
									   $("[id^='bothSidePain6']").addClass('mh_hide');
								   }else if ($('input[id=question3042]').attr('checked')) {
									
									  
									   $("[id^='bothSidePain5']").addClass('mh_hide');
									   $("[id^='bothSidePain6']").removeClass('mh_hide');
								   }
								   else{
									  
									   $("[id^='bothSidePain5']").removeClass('mh_hide');
									   $("[id^='bothSidePain6']").removeClass('mh_hide');
									 
								   }
							}
							else{
								$("[id^='question292_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question292_S']").addClass('mh_hide');
						} 
						}
					});
			
			$("input[name=question304]").change(
					function() {
						if ($(this).val() == "Left side"||$(this).val() == "Right side"||$(this).val() == "Both side") {
							/*  testing*/
							if($('input[id=question2981]').attr('checked') || $('input[id=question2982]').attr('checked') || $('input[id=question2983]').attr('checked') || $('input[id=question2984]').attr('checked') || $('input[id=question2985]').attr('checked')){
								$("[id^='question292_S']").removeClass('mh_hide');	
								
								if ($(this).val() == "Left side") {
									
									   $('[name=question267]').val("0");
									   $('[name=question271]').val("0");
									  
									   $("[id^='bothSidePain5']").removeClass('mh_hide');
									   $("[id^='bothSidePain6']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $('[name=question267]').val("0");
									   $('[name=question271]').val("0");
									   $("[id^='bothSidePain5']").addClass('mh_hide');
									   $("[id^='bothSidePain6']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain5']").removeClass('mh_hide');
									   $("[id^='bothSidePain6']").removeClass('mh_hide');
								   }
							}
							else{
								$("[id^='question292_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question292_S']").addClass('mh_hide');
						} 
						
					});
			
			
			
			
               /* Q302 */
			
			$("input[name=question302]").change(
					function() {
						if ($(this).val() == "Left side" || $(this).val() == "Right side" || $(this).val() == "Both side") {
							/*  testing*/
						   if ($('input[id=question2931]').attr('checked')) {
							   
							   $("[id^='question293_S']").removeClass('mh_hide');
							   
							   if ($(this).val() == "Left side" ) {
								   
								   $('[name=question268]').val("0");
								   $('[name=question272]').val("0");
								   
								   $("[id^='bothSidePain7']").removeClass('mh_hide');
								   $("[id^='bothSidePain8']").addClass('mh_hide');
							   }else if ($(this).val() == "Right side") {

								   $('[name=question268]').val("0");
								   $('[name=question272]').val("0");
									   $("[id^='bothSidePain7']").addClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
							   else{
								   $("[id^='bothSidePain7']").removeClass('mh_hide');
								   $("[id^='bothSidePain8']").removeClass('mh_hide');
							   }
							  
						}else{
							$("[id^='question293_S']").addClass('mh_hide');
						}
						   
							/* End testing */
						}else{
							$("[id^='question293_S']").addClass('mh_hide');
						} 
						
					});
			
			/* Q 310,299 */
			
			$("input[name=question299]").change(
					function() {
						if($('input[id=question2932]').attr('checked')){

							if ($(this).val() == "Past year" || $(this).val() == "1-2 years ago" || $(this).val() == "3-5 years ago" || $(this).val() == "More than 5 years ago" || $(this).val() == "Cannot remember") {
							/*  testing*/
							if($('input[id=question3051]').attr('checked') || $('input[id=question3052]').attr('checked') ||$('input[id=question3053]').attr('checked')){
								$("[id^='question293_S']").removeClass('mh_hide');	
								
								 if ($('input[id=question3051]').attr('checked') || $('input[id=question3052]').attr('checked')) {
									
									   $("[id^='bothSidePain7']").removeClass('mh_hide');
									   $("[id^='bothSidePain8']").addClass('mh_hide');
								   }else if ($('input[id=question3052]').attr('checked')) {
									
									   $("[id^='bothSidePain7']").addClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
								   else{
									 
									   $("[id^='bothSidePain7']").removeClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
							}
							else{
								$("[id^='question293_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question293_S']").addClass('mh_hide');
						} 
						}
					});
			
			$("input[name=question305]").change(
					function() {
						if ($(this).val() == "Left side"||$(this).val() == "Right side"||$(this).val() == "Both side") {
							/*  testing*/
							if($('input[id=question2991]').attr('checked') || $('input[id=question2992]').attr('checked') || $('input[id=question2993]').attr('checked') || $('input[id=question2994]').attr('checked') || $('input[id=question2995]').attr('checked')){
								$("[id^='question293_S']").removeClass('mh_hide');	
								if ($(this).val() == "Left side") {
									
									 $('[name=question268]').val("0");
									 $('[name=question272]').val("0");
									
									   $("[id^='bothSidePain7']").removeClass('mh_hide');
									   $("[id^='bothSidePain8']").addClass('mh_hide');
								   }else if ($(this).val() == "Right side") {
									   $('[name=question268]').val("0");
									   $('[name=question272]').val("0");
									   
									   $("[id^='bothSidePain7']").addClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
								   else{
									   $("[id^='bothSidePain7']").removeClass('mh_hide');
									   $("[id^='bothSidePain8']").removeClass('mh_hide');
								   }
								
							}
							else{
								$("[id^='question293_S']").addClass('mh_hide');
							}
						   
							/* End testing */
						}else{
							$("[id^='question293_S']").addClass('mh_hide');
						} 
						
					});
			
			/*End Code for hiding and opening on cantremember field and for past year */
			$("input[name^='question'][type=radio]").change(function() {
				var id = $(this).attr("name");
				var num = id.match(/\d+/);
				if (num == 20 || num < 33 || num == 291 || num == 292 || num == 293) {
					if ($(this).val() != no) {
						$("[id^='" + id + "_c']").removeClass('mh_hide');										
					} else {
						$("[id^='" + id + "_c']").addClass('mh_hide');
						$("[id^='" + id + "_S']").addClass('mh_hide');
						$("input[name^='question'][type=radio]", "[id^='" + id + "_c']").attr('checked', false);
						$("select[name^='question']", "[id^='" + id + "_S']").val("0");
					
					}
				} 
				
			});

			

			$('#form')
					.submit(
							function(event) {
								var valid = true;
								
								var q22 = $("input[name=question22]:checked")
										.val();
								$("[id$='_error']").addClass('mh_hide');

								if (!validateRadioButton('question18')) {
									valid = false;
									$("input[name=question18]").focus();
								}

								/*if (!validateCheckBox('question19') && valid) {
									valid = false;
									$("input[name=question19]").focus();
								}*/
								
								if (!validateRadioButton('question164')) {
									valid = false;
									$("input[name=question164]").focus();
								}
								if (!validateRadioButton('question165')) {
									valid = false;
									$("input[name=question165]").focus();
								}
								if (!validateRadioButton('question166')) {
									valid = false;
									$("input[name=question166]").focus();
								}
								if (!validateRadioButton('question167')) {
									valid = false;
									$("input[name=question167]").focus();
								}
								
								/* Validation Q[6]-Currently have it or I had it in the past */
								/* question285,question37 */
								if (validateRadioButton('question20')) {
									var q21 = $("input[name=question20]:checked").val();
									if (q21 == "Yes I have") {
										
										if (!validateRadioButton('question285')) {
											valid = false;
										}
										if (!validateRadioButton('question38')) {
											valid = false;
										}
										
									}
									else if(q21 == "Yes I had"){
										if (!validateRadioButton('question37')) {
											valid = false;
										}
										if (!validateRadioButton('question38')) {
											valid = false;
										}
									}
								} else {
									valid = false;
									$("input[name=question20]").focus();
								}
								
								/* question286,question38 */
								
								if (validateRadioButton('question32')) {
									var q21 = $("input[name=question32]:checked").val();
									if (q21 == "Yes I have") {
										
										if (!validateRadioButton('question286')) {
											valid = false;
										}
										if (!validateRadioButton('question40')) {
											valid = false;
										}
										
									}
									else if(q21 == "Yes I had"){
										if (!validateRadioButton('question39')) {
											valid = false;
										}
										if (!validateRadioButton('question40')) {
											valid = false;
										}
									}
								} else {
									valid = false;
									$("input[name=question20]").focus();
								}
								
								/*End Validation Q[6]-Currently have it or I had it in the past */
								
								/* testing validation  */
								
								if (validateRadioButton('question273')) {
									var q21 = $("input[name=question273]:checked").val();
									if (q21 == yes) {
										
										/*Validation Q33 */
										
										if (validateRadioButton('question33')) {
											var q21 = $("input[name=question33]:checked").val();
												if (q21 == "Yes I have") {
												
												if (!validateRadioButton('question287')) {
													valid = false;
												}
												if (!validateRadioButton('question42')) {
													valid = false;
												}
												if (!validateRadioButton('question274')) {
													valid = false;
												}
												
											}
												else if(q21 == "Yes I had"){
													if (!validateRadioButton('question41')) {
														valid = false;
													}
													if (!validateRadioButton('question42')) {
														valid = false;
													}
													if (!validateRadioButton('question275')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question33]").focus();
										}
										
										/* End Validation Q33 */
										
										
										/*Validation Q34 */
										
										if (validateRadioButton('question34')) {
											var q21 = $("input[name=question34]:checked").val();
												if (q21 == "Yes I have") {
												
													
												/* Sub [iv] question Validation */
												if (validateRadioButton('question276')) {
																		var q21 = $("input[name=question276]:checked").val();
																		if (q21 == "Left side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question261')){
																				
																				$("[id^='question34_1_error']").removeClass('mh_hide');
																				
																					valid = false;
																				}
																		}else if (q21 == "Right side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question262')){
																				
																				$("[id^='question34_1_error']").removeClass('mh_hide');
																				
																					valid = false;
																				}
																		}
																		
																		else if(q21 == "Both side"){
																			
																				if(!validateQ6Select('question261')){
																					
																				$("[id^='question34_1_error']").removeClass('mh_hide');
																					valid = false;
																				}
																				if(!validateQ6Select('question262')){
																					
																				$("[id^='question34_1_error']").removeClass('mh_hide');
																					valid = false;
																				}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question276]").focus();
																	}
												
												/*End Sub [iv] question Validation */
												
												
												if (!validateRadioButton('question44')) {
													valid = false;
												}
												if (!validateRadioButton('question288')) {
													valid = false;
												}
												
											}
												else if(q21 == "Yes I had"){
													
													/*Validation Sub [iv] */
													if (validateRadioButton('question44')) {
																		var q21 = $("input[name=question44]:checked").val();
																		if (q21 == "Past year" || q21 == "1-2 years ago" || q21 == "3-5 years ago" || q21 == "More than 5 years ago" || q21 == "Cannot remember") 
																			{
																			
																			if (validateRadioButton('question277')) {
																				var q21 = $("input[name=question277]:checked").val();
																				if (q21 == "Left side") 
																				{
																					/*innner validation  */
																					if(!validateQ6Select('question261')){
																						
																						$("[id^='question34_1_error']").removeClass('mh_hide');
																						
																							valid = false;
																						}
																				}else if (q21 == "Right side") 
																				{
																					/*innner validation  */
																					if(!validateQ6Select('question262')){
																						
																						$("[id^='question34_1_error']").removeClass('mh_hide');
																						
																							valid = false;
																						}
																				}else if(q21 == "Both side"){
																					
																						if(!validateQ6Select('question261')){
																							
																						$("[id^='question34_1_error']").removeClass('mh_hide');
																							valid = false;
																						}
																						if(!validateQ6Select('question262')){
																							
																						$("[id^='question34_1_error']").removeClass('mh_hide');
																							valid = false;
																						}
																					
																				}
																				
																			}
																			else {
																				valid = false;
																				$("input[name=question277]").focus();
																			}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question44]").focus();
																	}
													/*End Validation Sub [iv] */
													
													if (!validateRadioButton('question43')) {
														valid = false;
													}
													if (!validateRadioButton('question277')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question34]").focus();
										}
										
										/* End Validation Q34 */
										
										
										/*Validation Q35 */
										
										if (validateRadioButton('question35')) {
											var q21 = $("input[name=question35]:checked").val();
												if (q21 == "Yes I have") {
												
													/*Validation Sub [iv] */
													if (validateRadioButton('question278')) {
																		var q21 = $("input[name=question278]:checked").val();
																		if (q21 == "Left side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question263')){
																				
																				$("[id^='question35_1_error']").removeClass('mh_hide');
																				
																					valid = false;
																				}
																		}else if (q21 == "Right side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question264')){
																				
																				$("[id^='question35_1_error']").removeClass('mh_hide');
																				
																					valid = false;
																				}
																		}else if(q21 == "Both side"){
																			
																				if(!validateQ6Select('question263')){
																					
																				$("[id^='question35_1_error']").removeClass('mh_hide');
																					valid = false;
																				}
																				if(!validateQ6Select('question264')){
																					
																				$("[id^='question35_1_error']").removeClass('mh_hide');
																					valid = false;
																				}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question278]").focus();
																	}
													
													/*End Validation Sub [iv] */	
												
												if (!validateRadioButton('question46')) {
													valid = false;
												}
												if (!validateRadioButton('question289')) {
													valid = false;
												}
												
												
											}
												else if(q21 == "Yes I had"){
													
													/*Validation Sub [iv] */
													if (validateRadioButton('question46')) {
																		var q21 = $("input[name=question46]:checked").val();
																		if (q21 == "Past year" || q21 == "1-2 years ago" || q21 == "3-5 years ago" || q21 == "More than 5 years ago" || q21 == "Cannot remember") 
																			{
																			
																			if (validateRadioButton('question279')) {
																				var q21 = $("input[name=question279]:checked").val();
																				if (q21 == "Left side") 
																					{
																					
																					if(!validateQ6Select('question263')){
																						
																						$("[id^='question35_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if (q21 == "Right side") 
																					{
																					
																					if(!validateQ6Select('question264')){
																						
																						$("[id^='question35_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if(q21 == "Both side"){
																					
																					if(!validateQ6Select('question263')){
																						
																					$("[id^='question35_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																					if(!validateQ6Select('question264')){
																						
																					$("[id^='question35_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																				
																			}
																				
																			}
																			else {
																				valid = false;
																				$("input[name=question279]").focus();
																			}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question46]").focus();
																	}
													
													/*End Validation Sub [iv] */
													
													if (!validateRadioButton('question45')) {
														valid = false;
													}
													if (!validateRadioButton('question279')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question35]").focus();
										}
										
										/* End Validation Q35 */
										
										/*Validation Q36 */
										
										if (validateRadioButton('question36')) {
											var q21 = $("input[name=question36]:checked").val();
												if (q21 == "Yes I have") {
												
													
													/*Validation Sub [iv] */
													if (validateRadioButton('question280')) {
																		var q21 = $("input[name=question280]:checked").val();
																		if (q21 == "Left side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question265')){
																				
																				$("[id^='question36_1_error']").removeClass('mh_hide');
																				
																					valid = false;
																				}
																		}else if (q21 == "Right side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question269')){
																				
																				$("[id^='question36_1_error']").removeClass('mh_hide');
																				
																					valid = false;
																				}
																		}
																		else if(q21 == "Both side"){
																			
																				if(!validateQ6Select('question265')){
																					
																				$("[id^='question36_1_error']").removeClass('mh_hide');
																					valid = false;
																				}
																				if(!validateQ6Select('question269')){
																					
																				$("[id^='question36_1_error']").removeClass('mh_hide');
																					valid = false;
																				}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question280]").focus();
																	}
													
													/*End Validation Sub [iv] */	
												
												if (!validateRadioButton('question260')) {
													valid = false;
												}
												if (!validateRadioButton('question290')) {
													valid = false;
												}
												
												
											}
												
												else if(q21 == "Yes I had"){
													
													/*Validation Sub [iv] */
													if (validateRadioButton('question260')) {
																		var q21 = $("input[name=question260]:checked").val();
																		if (q21 == "Past year" || q21 == "1-2 years ago" || q21 == "3-5 years ago" || q21 == "More than 5 years ago" || q21 == "Cannot remember") 
																			{
																		
																			
																			if (validateRadioButton('question281')) {
																				var q21 = $("input[name=question281]:checked").val();
																				if (q21 == "Left side") 
																					{
																					
																					if(!validateQ6Select('question265')){
																						
																						$("[id^='question36_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if (q21 == "Right side") 
																					{
																					
																					if(!validateQ6Select('question269')){
																						
																						$("[id^='question36_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}
																				else if(q21 == "Both side"){
																					
																					if(!validateQ6Select('question265')){
																						
																					$("[id^='question36_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																					if(!validateQ6Select('question269')){
																						
																					$("[id^='question36_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																				
																			}
																				
																			}
																			else {
																				valid = false;
																				$("input[name=question281]").focus();
																			}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question260]").focus();
																	}
												
													/*End Validation Sub [iv] */	
													if (!validateRadioButton('question189')) {
														valid = false;
													}
													if (!validateRadioButton('question281')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question36]").focus();
										}
										
										/* End Validation Q36 */
										
										/* Validation Q291 */
										
										if (validateRadioButton('question291')) {
											var q21 = $("input[name=question291]:checked").val();
												if (q21 == "Yes I have") {
												
													
													/*Validation Sub [iv] */
													if (validateRadioButton('question300')) {
																		var q21 = $("input[name=question300]:checked").val();
																		if (q21 == "Left side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question266')){
																				
																				$("[id^='question291_1_error']").removeClass('mh_hide');
																					
																					valid = false;
																				}
																		}else if (q21 == "Right side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question270')){
																				
																				$("[id^='question291_1_error']").removeClass('mh_hide');
																					
																					valid = false;
																				}
																		}else if(q21 == "Both side"){
																			
																			
																			if(!validateQ6Select('question266')){
																				
																			$("[id^='question291_1_error']").removeClass('mh_hide');
																				valid = false;
																			}
																			
																			if(!validateQ6Select('question270')){
																				
																			$("[id^='question291_1_error']").removeClass('mh_hide');
																				valid = false;
																			}
																			
																		
																	}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question300]").focus();
																	}
													
													/*End Validation Sub [iv] */	
												
												if (!validateRadioButton('question297')) {
													valid = false;
												}
												if (!validateRadioButton('question294')) {
													valid = false;
												}
												
												
											}
												
												else if(q21 == "Yes I had"){
													
													/*Validation Sub [iv] */
													
												if (validateRadioButton('question297')) {
																		var q21 = $("input[name=question297]:checked").val();
																		if (q21 == "Past year" || q21 == "1-2 years ago" || q21 == "3-5 years ago" || q21 == "More than 5 years ago" || q21 == "Cannot remember") 
																			{
																			
																			if (validateRadioButton('question303')) {
																				var q21 = $("input[name=question303]:checked").val();
																				if (q21 == "Left side") 
																					{
																					
																					if(!validateQ6Select('question266')){
																						
																						$("[id^='question291_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if (q21 == "Right side") 
																					{
																					
																					if(!validateQ6Select('question270')){
																						
																						$("[id^='question291_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if(q21 == "Both side"){
																					
																					if(!validateQ6Select('question266')){
																						
																					$("[id^='question291_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																					
																					if(!validateQ6Select('question270')){
																					
																					$("[id^='question291_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																				
																			}
																				
																			}
																			else {
																				valid = false;
																				$("input[name=question303]").focus();
																			}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question297]").focus();
																	}
													
													/*End Validation Sub [iv] */	
													if (!validateRadioButton('question309')) {
														valid = false;
													}
													if (!validateRadioButton('question303')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question291]").focus();
										}
										
										/* End Validation Q291  */
										
										/* Validation Q292 */
										
										if (validateRadioButton('question292')) {
											var q21 = $("input[name=question292]:checked").val();
												if (q21 == "Yes I have") {
												
													
													/*Validation Sub [iv] */
												if (validateRadioButton('question301')) {
																		var q21 = $("input[name=question301]:checked").val();
																		if (q21 == "Left side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question267')){
																				
																				$("[id^='question292_1_error']").removeClass('mh_hide');
																					
																					valid = false;
																				}
																		}else if (q21 == "Right side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question271')){
																				
																				$("[id^='question292_1_error']").removeClass('mh_hide');
																					
																					valid = false;
																				}
																		}else if(q21 == "Both side"){
																			
																			if(!validateQ6Select('question267')){
																				
																			$("[id^='question292_1_error']").removeClass('mh_hide');
																				valid = false;
																			}
																			
																			if(!validateQ6Select('question271')){
																				
																			$("[id^='question292_1_error']").removeClass('mh_hide');
																				valid = false;
																			}
																		
																	}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question301]").focus();
																	}
													
													/*End Validation Sub [iv] */	
												
												if (!validateRadioButton('question298')) {
													valid = false;
												}
												if (!validateRadioButton('question295')) {
													valid = false;
												}
												
												
											}
												
												else if(q21 == "Yes I had"){
													
													/*Validation Sub [iv] */
													
													if (validateRadioButton('question298')) {
																		var q21 = $("input[name=question298]:checked").val();
																		if (q21 == "Past year" || q21 == "1-2 years ago" || q21 == "3-5 years ago" || q21 == "More than 5 years ago" || q21 == "Cannot remember") 
																			{
																			
																			if (validateRadioButton('question304')) {
																				var q21 = $("input[name=question304]:checked").val();
																				if (q21 == "Left side") 
																					{
																					
																					if(!validateQ6Select('question267')){
																						
																						$("[id^='question292_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if (q21 == "Right side") 
																					{
																					
																					if(!validateQ6Select('question271')){
																						
																						$("[id^='question292_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if(q21 == "Both side"){
																					
																					if(!validateQ6Select('question267')){
																						
																					$("[id^='question292_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																					
																					if(!validateQ6Select('question271')){
																						
																					$("[id^='question292_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																				
																			}
																				
																			}
																			else {
																				valid = false;
																				$("input[name=question304]").focus();
																			}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question298]").focus();
																	}
													
													/*End Validation Sub [iv] */	
													if (!validateRadioButton('question310')) {
														valid = false;
													}
													if (!validateRadioButton('question304')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question292]").focus();
										}
										
										/* End Validation Q292  */
										
										/* Validation Q293 */
										
										if (validateRadioButton('question293')) {
											var q21 = $("input[name=question293]:checked").val();
												if (q21 == "Yes I have") {
												
													
													/*Validation Sub [iv] */
													
													if (validateRadioButton('question302')) {
																		var q21 = $("input[name=question302]:checked").val();
																		if (q21 == "Left side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question268')){
																				
																				$("[id^='question293_1_error']").removeClass('mh_hide');
																					
																					valid = false;
																				}
																		}else if (q21 == "Right side") 
																			{
																			/*innner validation  */
																			if(!validateQ6Select('question272')){
																				
																				$("[id^='question293_1_error']").removeClass('mh_hide');
																					
																					valid = false;
																				}
																		}else if(q21 == "Both side"){
																			
																			if(!validateQ6Select('question268')){
																				
																			$("[id^='question293_1_error']").removeClass('mh_hide');
																				valid = false;
																			}
																			
																			if(!validateQ6Select('question272')){
																			
																			$("[id^='question293_1_error']").removeClass('mh_hide');
																				valid = false;
																			}
																		
																	}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question302]").focus();
																	}
													
													/*End Validation Sub [iv] */	
												
												if (!validateRadioButton('question299')) {
													valid = false;
												}
												if (!validateRadioButton('question296')) {
													valid = false;
												}
												
												
											}
												
												else if(q21 == "Yes I had"){
													
													/*Validation Sub [iv] */
														if (validateRadioButton('question299')) {
																		var q21 = $("input[name=question299]:checked").val();
																		if (q21 == "Past year" || q21 == "1-2 years ago" || q21 == "3-5 years ago" || q21 == "More than 5 years ago" || q21 == "Cannot remember") 
																			{
																			
																			if (validateRadioButton('question305')) {
																				var q21 = $("input[name=question305]:checked").val();
																				if (q21 == "Left side") 
																					{
																					
																					if(!validateQ6Select('question268')){
																						
																						$("[id^='question293_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if (q21 == "Right side") 
																					{
																					
																					if(!validateQ6Select('question272')){
																						
																						$("[id^='question293_1_error']").removeClass('mh_hide');
																							
																							valid = false;
																						}
																					
																				}else if(q21 == "Both side"){
																					
																					if(!validateQ6Select('question268')){
																						
																					$("[id^='question293_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																					
																					if(!validateQ6Select('question272')){
																						
																					$("[id^='question293_1_error']").removeClass('mh_hide');
																						valid = false;
																					}
																				
																			}
																				
																			}
																			else {
																				valid = false;
																				$("input[name=question305]").focus();
																			}
																			
																		}
																		
																	}
																	else {
																		valid = false;
																		$("input[name=question299]").focus();
																	}
													
													/*End Validation Sub [iv] */	
													if (!validateRadioButton('question311')) {
														valid = false;
													}
													if (!validateRadioButton('question305')) {
														valid = false;
													}
													
												}
											
										}
										else {
											valid = false;
											$("input[name=question293]").focus();
										}
										
										/* End Validation Q293  */
										
									
										if (!validateRadioButton('question36')) {
											valid = false;
										}
										
									}
								}
								else {
									valid = false;
									$("input[name=question273]").focus();
								}
								
								
								
								/* end testing validation */
								
								
								if (validateRadioButton('question21')) {
									var q21 = $("input[name=question21]:checked").val();
									if (q21 == yes) {
										if (!validateRadioButton('question191')) {
											valid = false;
										}
										if (!validateRadioButton('question192')) {
											valid = false;
										}
										if (!validateRadioButton('question193')) {
											valid = false;
										}
										if (!validateRadioButton('question194')) {
											valid = false;
										}
										if (!validateRadioButton('question195')) {
											valid = false;
										}
										if (!validateRadioButton('question196')) {
											valid = false;
										}
										if (!validateRadioButton('question199')) {
											valid = false;
										}
										if (!validateRadioButton('question200')) {
											valid = false;
										}
										if (!validateRadioButton('question201')) {
											valid = false;
										}
										if (!validateRadioButton('question202')) {
											valid = false;
										}
										if (!validateRadioButton('question203')) {
											valid = false;
										}
										if (!validateRadioButton('question204')) {
											valid = false;
										}
										if (!validateRadioButton('question206')) {
											valid = false;
										}
										if (!validateRadioButton('question207')) {
											valid = false;
										}
										
										if($("input[name=question191]:checked").val()== "346" && $("input[name=question192]:checked").val()== "No" && $("input[name=question193]:checked").val()== "No" && $("input[name=question194]:checked").val()== "348"
												&& $("input[name=question195]:checked").val()== "350" && $("input[name=question196]:checked").val()== "352" && $("input[name=question199]:checked").val()== "346" && $("input[name=question200]:checked").val()== "No" 
												&& $("input[name=question201]:checked").val()== "No" && $("input[name=question202]:checked").val()== "348" && $("input[name=question203]:checked").val()== "350" && $("input[name=question204]:checked").val()== "352"
												&& $("input[name=question206]:checked").val()== "501" && $("input[name=question207]:checked").val()== "503"){
											$("[id^='label21']").removeClass('mh_hide');
											valid = false;
										}

										if(!valid) {
											$("input[name=question191]").focus();
										}
										
									}
									
									
								} else {
									valid = false;
									$("input[name=question21]").focus();
								}

								
								if (validateRadioButton('question22')) {
									var q22 = $("input[name=question22]:checked").val();
									if (q22 == yes) {
										if (!validateRadioButton('question209')) {
											valid = false;
										}
										if (!validateRadioButton('question210')) {
											valid = false;
										}
										if (!validateRadioButton('question211')) {
											valid = false;
										}
										if (!validateRadioButton('question212')) {
											valid = false;
										}
										if (!validateRadioButton('question214')) {
											valid = false;
										}
										if (!validateRadioButton('question215')) {
											valid = false;
										}
										if (!validateRadioButton('question216')) {
											valid = false;
										}
										if (!validateRadioButton('question217')) {
											valid = false;
										}
										

										if(!valid) {
											$("input[name=question209]").focus();
										}
										
									}
									
									
								} else {
									valid = false;
									$("input[name=question22]").focus();
								}


								
								/* if (validateRadioButton('question273')) {
									var q22 = $("input[name=question273]:checked").val();
									if (q22 == yes) {
										
										alert('hiiii');
										// to do something
										
										
									}
									else
										{
											alert('else');
										}
									
									
								} else {
									valid = false;
									$("input[name=question273]").focus();
								} */
								/*if (q22 == yes
										&& !validateCheckBox('question123')
										&& valid) {
									valid = false;
									$("input[name=question123]").focus();
								}

								if (q22 == yes
										&& !validateCheckBox('question124')
										&& valid) {
									valid = false;
									$("input[name=question124]").focus();
								}*/

								
								if (!validateQuestion6()) {									
									valid = false

								} 

								
								if (valid) {
									return true;
								} else {
									$("[id^='errorVal']").removeClass('mh_hide');
									return false;
									
									
								}

							});

			
		

		});


		function validateCheckBox(name) {

			if ($("input:checkbox[name=" + name + "]").is(':checked')) {
				return true;
			} else {
				$("#" + name + "_error").removeClass('mh_hide');
				return false;
			}
		}

		function validateQuestion6(){
			var validate = true;
			/* if(!validateQ6RadioButtons('question20', 'question37', 'question38')) {
				validate = false;
				 $( "[name='question20']" ).focus();
			}   */

			/* if(!validateQ6RadioButtons('question32','question39', 'question40')) {
				validate = false;
				 $( "[name='question32']" ).focus();
			} */

			/* if(!validateQ6RadioButtons('question33','question41', 'question42' ,'question274')) {
				validate = false;
				 $( "[name='question33']" ).focus();
			}

			if(!validateQuestion34() ) {
				validate = false;
				 $( "[name='question34']" ).focus();
			} 

			if(!validateQuestion35()) {
				validate = false;
				 $( "[name='question35']" ).focus();
			} 
			
			if(!validateQuestion36()) {
				validate = false;
				 $( "[name='question36']" ).focus();
			}  */
					
			return validate;
		}
		
		function validateQ6RadioButtons(name, c1, c2) {
				var validate = true;		
				if (validateRadioButton(name)) {				
					if ($("[name=" + name + "]:checked").val() != no) {
						if (!validateRadioButton(c1)) {
							validate = false;
						}

						if (!validateRadioButton(c2)) {
							validate = false;
						}
					}
				} else {
					validate = false;
				}		
				return validate;	
		}

		function validateQuestion34(){
			var validate = true;			
			
			if(validateQ6RadioButtons('question34','question43', 'question44' , 'question276')) {
				var val = $("[name='question34']:checked").val();				
				if (val != no) {
					var child = $("[name='question43']:checked").val();
					if (child != 'Cannot remember' && child != 'More than a year ago') {
						if(!validateQ6Select('question261')){
							validate = false;
							$("#question34_1_error").removeClass('mh_hide');
						}
						if(!validateQ6Select('question262')){
							validate = false;
							$("#question34_2_error").removeClass('mh_hide');
						}
					}
				}
				
			} else {
				validate = false;
			}

			
			return validate;	
		}

		function validateQuestion35(){
			var validate = true;
			
			if(validateQ6RadioButtons('question35','question45', 'question46')) {
				var val = $("[name='question35']:checked").val();
				if (val != no) {
					var child = $("[name='question45']:checked").val();
					if (child != 'Cannot remember' && child != 'More than a year ago') {
						if(!validateQ6Select('question263')) {
								validate = false;
								$("#question35_1_error").removeClass('mh_hide');
						}
						if(!validateQ6Select('question264')) {
								validate = false;
								$("#question35_2_error").removeClass('mh_hide');
						}
					}
				}
				
			} else {
				validate = false;
			}

			return validate;	
		}

		function validateQuestion36(){
			var validate = true;			
			if(validateQ6RadioButtons('question36','question189', 'question260')) {
				var val = $("[name='question36']:checked").val();
				if (val != no) {
					var child = $("[name='question189']:checked").val();
					if (child != 'Cannot remember' && child != 'More than a year ago') {
						if(!validateQ6Select('question265')
								 ||  !validateQ6Select('question266')
								 ||  !validateQ6Select('question267')
								 ||  !validateQ6Select('question268')) {
								validate = false;
								$("#question36_1_error").removeClass('mh_hide');
						}
						
						if(!validateQ6Select('question269')
								 ||  !validateQ6Select('question270')
								 ||  !validateQ6Select('question271')
								 ||  !validateQ6Select('question272')) {
							validate = false;
							$("#question36_2_error").removeClass('mh_hide');
						}
								
					}
				}
				
			} else {
				validate = false;
			}

			return validate;	
		}

		function validateSelect() {
			var validate = true;
			$('select[name^=question1]').each(function(index) {
				var name = $(this).attr("name");
				if ($(this).val() == '') {
					$("#" + name + "_error").removeClass('mh_hide');
					validate = false;

				}
			});

			return validate;

		}

		function validateQ6Select(name) {
			return  $('select[name='+ name +']').val() != '0';	
		}

		function validateRadioButton(name) {
			if (!$("[name='" + name + "']").is(':checked')) {
				$("#" + name + "_error").removeClass('mh_hide');
				return false;
			}

			return true;
		}
		
		
		
	</script>

</body>
</html>