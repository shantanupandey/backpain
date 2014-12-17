<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<c:set var="url" value="${contextPath}/aboutYou.html" />
<c:if test="${loggedClient.roleId == 2}">
	<c:set var="url" value="${contextPath}/admin/aboutYou.html" />
</c:if>
<body>

	<form:form method="post" action="${url}" commandName="form"
		id="aboutYouForm" onsubmit="return validation();">
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



										<table width="727"
											style="border-style: solid; background-color: Transparent;"
											cellpadding="3" cellspacing="0" class="tbl_Grid">
											<tbody>
												<tr>
													<td height="25" colspan="2" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;"><center style="margin-top: -13px;font-size:13px;">1. About
															you</center></strong></td>
												</tr>
												<tr>
													<td colspan="2"><br /></td>
												</tr>
												<c:if test="${not empty message}">
													<tr>
														<td height="25" colspan="2" style="font-family: Calibri;">
															<div style="color: #4F8A10; font-weight: bold;">
																<font size="4">${message}</font>
															</div>
														</td>
													</tr>
												</c:if>
												<c:if test="${not empty error}">
													<tr>
														<td height="25" colspan="2" style="font-family: Calibri;">
															<div style="color: red; font-weight: bold;">
																${error}</div>
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
													<td colspan="1" style="width: 123px">First Name</td>
													<td><form:input path="foreName"
															cssStyle="width:148px;" /> <form:errors path="foreName"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px">Last Name</td>
													<td><form:input path="surName" cssStyle="width:148px;" />
														<form:errors path="surName" cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px">Address</td>

													<td>
														<table>
															<tbody>
																<tr>
																	<td colspan="1">Line 1</td>
																	<td colspan="1"><form:input path="line1"
																			cssStyle="width:200px;" /></td>
																	<td colspan="1"><form:errors path="line1"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="1">Line 2</td>
																	<td colspan="1"><form:input path="line2"
																			cssStyle="width:200px;" /></td>
																	<td colspan="1"><form:errors path="line2"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="1">Line 3</td>
																	<td colspan="1"><form:input path="line3"
																			cssStyle="width:200px;" /></td>
																	<td colspan="1"><span></span></td>
																</tr>
																<tr>
																	<td colspan="1">Town/City</td>
																	<td colspan="1"><form:input path="city"
																			cssStyle="width:150px;" /></td>
																	<td colspan="1"><form:errors path="city"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="1">County/Other</td>
																	<td colspan="2"><form:input path="country"
																			cssStyle="width:148px;" /></td>
																	<td colspan="3"><form:errors path="country"
																			cssClass="errors" /></td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td colspan="1">Postal Code</td>
																	<td colspan="2"><form:input path="postcode"
																			cssStyle="width:148px;" /></td>
																	<td colspan="3"><form:errors path="postcode"
																			cssClass="errors" /></td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px">Telephone No</td>
													<td><form:input path="phone" pattern="[0-9\\+ \\-]{3,15}" title="Phone Number must be valid" cssStyle="width:148px;" />
														<form:errors path="phone" cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="1">Mobile</td>
													<td colspan="1"><form:input path="mobile" pattern="[0-9\\+ \\-]{3,15}" title="Mobile number must be valid"
															cssStyle="width:148px;" /></td>
													<td colspan="1"><form:errors path="mobile"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px">Email Address</td>
													<td><form:input path="email" cssStyle="width:148px;" />
														<form:errors path="email" cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px">Date of Birth</td>
													<td><form:input path="dateOfBirth" pattern="\d{1,2}/\d{1,2}/\d{4}" title="Enter Date of birth in format (dd/MM/yyyy)."
															cssStyle="width:148px;" /> <form:errors
															path="dateOfBirth" cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>

												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="1" style="width: 123px">Gender</td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="sex" value="Male" />
																		<label for="sex">Male</label></td>
																	<td><form:radiobutton path="sex" value="Female" />
																		<label for="sex">Female</label></td>
																	<td><form:errors path="sex" cssClass="errors" /></td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>


												<tr>
													<td colspan="2"><br /></td>
												</tr>

												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														<c:if
															test="${loggedClient.roleId == 1 && loggedClient.clientStateId  == 4}">
															<input type="submit" name="submit" value="Update Details"
																disabled="disabled" />
															<input type="submit" name="submit"
																value="proceed" />
															<input type="hidden" id="sendMessage" name="sendMessage"
																value="Yes"></input>
															<%--  <a href="#" onclick="aboutYou();"><fmt:message key="form.admin.link" /> </a> --%>
														</c:if> <c:if
															test="${loggedClient.roleId == 2 || loggedClient.clientStateId  != 4}">
															Click ‘Update’ to continue: <input type="submit" name="submit" value="Update" />
														</c:if> <br />

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
		function aboutYou() {
			alert("hi");

			var temp = jQuery.ajax({
				url : "/calba/aboutYou.html",
				type : "POST",
				dataType : "text",
				success : function(data) {
				}
			}).responseText;
		}

		/* $(function() {
			$("#dateOfBirth").datepicker({
				dateFormat : 'dd/mm/yy',
				yearRange : '-94y:-14y',
				changeMonth : true,
				changeYear : true
			});

			$('#form').submit(function(event) {
				var valid = true;

				if (valid) {
					return true;
				} else {
					event.preventDefault();
					return false;
				}

			});

		}); */

		function validateCheckBox(name, other) {

			if ($("input:checkbox[name=" + name + "][value=Other]").is(
					':checked')) {

				var other = $("textarea[name=" + other + "]").val();
				other = $.trim(other);
				if (other == "") {
					$("#" + name + "_other_error").removeClass('mh_hide');
					$("#" + name + "_error").addClass('mh_hide');
					return false;
				} else {
					$("#" + name + "_other_error").addClass('mh_hide');
				}
			}

			if ($("input:checkbox[name=" + name + "]").is(':checked')) {
				$("#" + name + "_error").addClass('mh_hide');
				return true;
			} else {
				$("#" + name + "_error").removeClass('mh_hide');
				return false;
			}

		}
	</script>
</body>
</html>