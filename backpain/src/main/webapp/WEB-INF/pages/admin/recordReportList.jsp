<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
														</tbody>
													</table> <br />
													<fieldset>
														<table>
															<tbody>
																<tr>
																	<td colspan="1" class="style3">1.</td>
																	<td><a href="${contextPath}/admin/${client.clientId}/aboutYou.html">About You</a></td>
																</tr>
																<tr>
																	<td colspan="1" class="style3">2.</td>
																	<td><a href="${contextPath}/admin/${client.clientId}/medicalHistory.html">Medical History</a></td>
																</tr>
																<tr>
																	<td colspan="1" class="style3">3.</td>
																	<td><a href="${contextPath}/admin/${client.clientId}/backPain.html">About Back Pain 1</a></td>
																</tr>
																<tr>
																	<td colspan="1" class="style3">4.</td>
																	<td><a href="${contextPath}/admin/${client.clientId}/backPain2.html">About Back Pain 2</a></td>
																</tr>
																<tr>
																	<td colspan="1" class="style3">5.</td>
																	<td><a href="${contextPath}/admin/${client.clientId}/selfExam.html">Self Examination</a></td>
																</tr>
																<tr>
																	<td colspan="1" class="style3">6.</td>
																	<td><a href="${contextPath}/admin/${client.clientId}/selfExamine.html">Disability</a></td>
																</tr>
																<%-- <tr><td>
																<font color="green" size="3px">
													<label>${message}</label>
													</font></td></tr> --%>
															</tbody>
														</table>
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