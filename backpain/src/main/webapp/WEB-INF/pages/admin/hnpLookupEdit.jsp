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
													style="margin-left: 10px; font-size: 15px; font-weight: bold;">HNP
														LOOKUP</strong></td>
											</tr>


											<tr>
												<td style="width: 123px; height: 420px" valign="top">
													<div>
														<c:set var="count" value="0" scope="page" />
														<table cellspacing="0" cellpadding="4" rules="rows"
															border="1"
															style="color: #333333; height: 95px; width: 725px; border-collapse: collapse;">


															<tr
																style="color: White; background-color: #990000; font-weight: bold;">

																<th scope="col" style="border: 1px solid black;">Non
																	Rad</th>
																<th scope="col" style="border: 1px solid black;">Rad</th>
																<th scope="col" style="border: 1px solid black;">Acute</th>
																<th scope="col" style="border: 1px solid black">Early</th>
																<th scope="col" style="border: 1px solid black;">Early
																	Mid</th>
																<th scope="col" style="border: 1px solid black;">Late
																	Mid</th>
																<th scope="col" style="border: 1px solid black;">Late</th>
																<th scope="col" style="border: 1px solid black;">Recovered</th>
																<th scope="col" style="border: 1px solid black;">Chronic</th>
																<th scope="col" style="border: 1px solid black;">Consult
																	Doctor</th>
																<th scope="col" style="border: 1px solid black;">Master
																	Update</th>

															</tr>

															<c:set var="boldRowCounter" value="1" />
															<c:forEach items="${HNPPhase}" var="hnpPhase"
																varStatus="counter">

																<c:choose>
																	<c:when
																		test="${(boldRowCounter eq 6) || (boldRowCounter eq 12) || (boldRowCounter eq 18)|| (boldRowCounter eq 24) }">
																		<c:set var="boldRowStyle"
																			value="border: 3px solid black" />

																		<tr id="${boldRowCounter}"
																			style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border-bottom: 3px solid black;">
																	</c:when>

																	<c:otherwise>
																		<tr id="${boldRowCounter}"
																			style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border-bottom: 1px solid black;">
																	</c:otherwise>
																</c:choose>

																<c:set var="boldRowCounter" value="${boldRowCounter+1}" />
																<td style="border: 1px solid black;">${hnpPhase.non_rad}</td>
																<td style="border: 1px solid black;">${hnpPhase.rad}</td>


																<td style="border: 1px solid black">${hnpPhase.acute}</td>
																<td style="border: 1px solid black">${hnpPhase.early}</td>

																<td style="border: 1px solid black;">${hnpPhase.early_mid}</td>
																<td style="border: 1px solid black;">${hnpPhase.late_mid}</td>
																<td style="border: 1px solid black;">${hnpPhase.late}</td>
																<td style="border: 1px solid black;">${hnpPhase.recovered}</td>
																<td style="border: 1px solid black;">${hnpPhase.chronic}</td>
																<td style="border: 1px solid black;">${hnpPhase.consultme}</td>
																<td style="border: 1px solid black;"><a
																	href="${contextPath}/admin/${hnpPhase.id}/hnpLookupValue.html"
																	style="display: inline-block; width: 50px;">Edit</a></td>
																</tr>
															</c:forEach>

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