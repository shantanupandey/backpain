<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
									</table> <!-- End -->







									<table width="727" border="0" cellpadding="0" cellspacing="0"
										class="data-table" id="table1">



										<tr
											style="color: White; background-color: #990000; font-weight: bold;">

											<c:set var="otherSiteColspan" value="11" />

										</tr>
										<thead>

											<tr style="color: White; background-color: #990000; font-weight: bold;">

												<th scope="col"
													style="width: 50px; border: 1px solid black; border-bottom: 0px; border-top: 0px">Date</th>
												<th scope="col"
													style="width: 50px; border: 1px solid black; border-bottom: 0px; border-top: 0px">Score</th>

											</tr>

										</thead>
										<tbody>
											<c:forEach items="${result}" var="line"><tr style="background-color:#FFFBD6;border: 1px solid black;">
												<td align="center" style=" border: 1px solid black;">${line.date}</td>
												<td align="center" style=" border: 1px solid black;">${line.score}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table> 
									


								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
<script>
$(document).ready(function(){
								$("#table1").freezeHeader({ top: true, left: false });
							});
									</script>
			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table>
	</table>
	
</body>
</html>