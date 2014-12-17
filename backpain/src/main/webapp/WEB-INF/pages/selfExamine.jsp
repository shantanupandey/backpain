<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<c:set var="url" value="${contextPath}/selfExamine.html" />
<c:if test="${loggedClient.roleId == 2}">
	<c:set var="url" value="${contextPath}/admin/selfExamine.html" />
</c:if>
<body>

	<form:form method="post" action="${url}" id="selfExamineform"
		commandName="form">




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



										<table width="727"
											style="border-style: solid; background-color: Transparent;"
											cellpadding="3" cellspacing="0" class="tbl_Grid">
											<tbody>
												<tr>
													<td height="25" colspan="2" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;"><center style="margin-top: -13px;font-size:13px;">6. Disability</center></strong></td>
												</tr>
												<tr>
													<td align="center" colspan="3"><b>Roland Morris Disability Questionnaire</b><br /></td>
												</tr>
												<c:if test="${loggedClient.roleId == 2}">
													<jsp:include page="admin/clientInfo.jsp" />
													<tr>
														<td colspan="3"><br /></td>
													</tr>
												</c:if>
												<c:if test="${loggedClient.roleId != 2 && not empty message}">
													<tr>
														<td height="25" colspan="3" style="font-family: Calibri;">
															<div style="color: #4F8A10; font-weight: bold;">
																${message}</div>
														</td>
													</tr>
												</c:if>
												<c:if test="${loggedClient.roleId != 2 && empty error}">
												<tr><td colspan="2" align="left" valign="middle" style="font-family: message-box;font-size: 14px;color: green; ">When your back hurts, you may find it difficult to
													do some of the things you normally do. <p>This list contains
													sentences that people have used to describe themselves when
													they have back pain. When you read them, you may find that
													some stand out because they describe you today.</p><p> As you read
													the list, think of yourself today. When you read a sentence
													that describes you today, put a tick against it. If the
													sentence does not describe you, then leave the space blank
													and go on to the next one. Remember, only tick the sentence
													if you are sure it describes you today.</p>
													</td>

												</tr></c:if>
												

												<c:forEach items="${questionList}" var="questionGroup"
													varStatus="counter">


													<tr>
														<td colspan="2" style="border-top: dotted 1px black;">

															<form:checkbox path="isquestion${questionGroup.id}"
																value="isquestion${questionGroup.id}" />
															${questionGroup.questiontext}
														</td>
													</tr>
													<%--<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									
																								
																								<td><form:radiobutton path="question${questionGroup.id}"
																											value="1" /><label for="question${questionGroup.id}">Yes</label></td>
																									<td><form:radiobutton path="question${questionGroup.id}"
																											value="0" /><label for="question${questionGroup.id}">No</label></td>
																								</tr>
																								
																							</tbody>
																						</table>
																					</td>
																					<td>&nbsp;</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr> --%>
												</c:forEach>
												<c:if test="${status1 eq 0}">
													<tr>
														<td  style="border-top: dotted 1px black;">Click ‘Update’ to continue: <input type="submit" name="submit" id="submit"
															value="Update" /></td>
													</tr>
												</c:if>
												<c:if test="${status1 eq 1}">
													<tr>
														<td  style="border-top: dotted 1px black;"><input type="submit" name="submit" id="submit"
															value="Update" disabled="disabled" /></td>
													</tr>
												</c:if>
												<c:if test="${loggedClient.roleId == 2}">
												<tr>
														<td  style="border-top: dotted 1px black;">Click ‘Update’ to continue: <input type="submit" name="submit" id="submit"
															value="Update" /></td>
													</tr>
												</c:if>




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


</body>
</html>