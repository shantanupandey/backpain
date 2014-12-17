<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<!-- <style>
p.speech
{
	position: relative;
	width: 200px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	background-color: #fff;
	border: 8px solid #666;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
	-webkit-box-shadow: 2px 2px 4px #888;
	-moz-box-shadow: 2px 2px 4px #888;
	box-shadow: 2px 2px 4px #888;
}
</style> -->
<body>

	<form:form method="post"
		action="${pageContext.request.contextPath}/register.html"
		commandName="form" onsubmit="return checkform();" autocomplete="off">
		<form:hidden path="projectId" />



		<table width="980" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<jsp:include page="banner.jsp" />
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center" valign="top">
					<table width="980" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="727" align="center" valign="top">
								<div id="TabbedPanels1" class="TabbedPanels">
									<ul class="TabbedPanelsTabGroup">
										<li class="TabbedPanelsTab">Register Me</li>
										<!-- <li class="TabbedPanelsTab"><a href="home.html">Home</a></li> -->
									</ul>
									<div class="TabbedPanelsContentGroup">
										<div class="TabbedPanelsContent">
											<table width="720" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><label id="label" style="color:red;"></label></td>
												</tr>
												<tr>
													<td width="720" align="left" valign="top"><br />
														<table>
															<tr>
																<td colspan="3"><c:if test="${not empty error}">
																		<div class="errors">${error}</div>
																	</c:if></td>
															</tr>
															
															<tr>
																<td colspan="1">First Name :-</td>
																<td colspan="1"><form:input path="foreName" onkeyup="$('#forelabel').html('');" onclick="$('#forelabel').html('');" 
																		cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="foreName" 
																		cssClass="errors" /></td>
																		<td><label id="forelabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Last Name :-</td>
																<td colspan="1"><form:input path="surName" onkeyup="$('#lastlabel').html('');" onclick="$('#lastlabel').html('');"
																		cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="surName" 
																		cssClass="errors" /></td>
																		<td><label id="lastlabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">User Name :-</td>
																<td colspan="1"><form:input path="userId" onkeyup="$('#userlabel').html('');" onclick="$('#userlabel').html('');"
																		cssStyle="width:150px;text-transform: uppercase;" /></td>
																<td colspan="1"><form:errors path="userId" 
																		cssClass="errors" /></td>
																		<td><label id="userlabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Password :-</td>
																<td colspan="1"><form:password path="newPassward" pattern="^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{8,20}$" title="Password must between 8 to 20 Characters, including at least one letter and one number"
																onkeyup="$('#passlabel').html('Password must between 8 to 20 Characters, including at least one letter and one number');" onclick="$('#passlabel').html('Password must between 8 to 20 Characters, including at least one letter and one number');" onblur="$('#passlabel').html('');"	
																		cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="newPassward"
																		cssClass="errors" /></td>
																		<td><label id="passlabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Confirm Password :-</td>
																<td colspan="1"><form:password
																		path="confirmPassward" onkeyup="$('#confirmlabel').html('');" onclick="$('#confirmlabel').html('');" cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="confirmPassward" 
																		cssClass="errors" /></td>
																		<td><label id="confirmlabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Date of Birth :-</td>
																<td colspan="1"><form:input path="dateOfBirth" pattern="\d{1,2}/\d{1,2}/\d{4}" title="Enter Date of birth in format (dd/MM/yyyy)." onkeyup="$('#doblabel').html('Enter Date of birth in format (dd/MM/yyyy).');"
																onclick="$('#doblabel').html('Enter Date of birth in format (DD/MM/YYYY).');" onblur="$('#doblabel').html('');"
																		cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="dateOfBirth"
																		cssClass="errors" /></td>
																		<td><label id="doblabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Gender :-</td>
																<td>
																	<table>
																		<tbody>
																			<tr>
																				<td><form:radiobutton path="sex" value="Male" onchange="$('#sexlabel').html('');"/>
																					<label for="sex">Male</label></td>
																				<td><form:radiobutton path="sex" value="Female" onchange="$('#sexlabel').html('');"/>
																					<label for="sex">Female</label></td>
																				<td><form:errors path="sex" cssClass="errors" /></td>
																				<td><label id="sexlabel" style="color:red;"></label></td>
																			</tr>
																		</tbody>
																	</table>
																</td>
															</tr>
															<tr>
																<td colspan="1">Email Address :-</td>
																<td colspan="1"><form:input path="email" type="email"  onkeyup="$('#emaillabel').html('');"  onclick="$('#emaillabel').html('');" title="Please enter a valid email address."
																		cssStyle="width:200px;" /></td>
																<td colspan="1"><form:errors path="email" 
																		cssClass="errors" /></td>
																	<td><label id="emaillabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Confirm Email Address :-</td>
																<td colspan="1"><form:input path="confirmEmail" onkeyup="$('#confirmemaillabel').html('');" onclick="$('#confirmemaillabel').html('');"
																		cssStyle="width:200px;" /></td>
																<td colspan="1"><form:errors path="confirmEmail"
																		cssClass="errors" /></td>
															<td><label id="confirmemaillabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">Telephone No :-&nbsp;&nbsp; &nbsp;</td>
															</tr>
															<tr>
																<td colspan="1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Landline</td>
																<td colspan="1"><form:input path="telephone" onkeyup="$('#telephonelabel').html('');" pattern="[0-9\\+ \\-]{3,15}" title="Must contain only numbers and have no spaces"
																onclick="$('#telephonelabel').html('Must contain only numbers and have no spaces');" onblur="$('#telephonelabel').html('');" cssStyle="width:200px;" /></td>
																<td colspan="1"><form:errors path="telephone"
																		cssClass="errors" /></td>
																		<td><label id="telephonelabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Mobile</td>
																<td colspan="1"><form:input path="mobile" onkeyup="$('#mobilelabel').html('');" pattern="[0-9\\+ \\-]{3,15}" title="Must contain only numbers and have no spaces"	onclick="$('#mobilelabel').html('Must contain only numbers and have no spaces');" onblur="$('#mobilelabel').html('');"  cssStyle="width:200px;" /></td>
																<td colspan="1"><form:errors path="mobile" 
																		cssClass="errors" /></td>
																			<td><label id="mobilelabel" style="color:red;"></label></td>
															</tr>


															<tr>
																<td colspan="1">Address :- &nbsp; Line 1</td>
																<td colspan="1"><form:input path="line1"
																		cssStyle="width:200px;" /></td>
																<td colspan="1"><form:errors path="line1"
																		cssClass="errors" /></td>
															</tr>
															<tr>
																<td colspan="1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Line 2</td>
																<td colspan="1"><form:input path="line2"
																		cssStyle="width:200px;" /></td>
																<td colspan="1"><form:errors path="line2"
																		cssClass="errors" /></td>
															</tr>
															<tr>
																<td colspan="1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Line 3</td>
																<td colspan="1"><form:input path="line3"
																		cssStyle="width:200px;" /></td>
																<td colspan="1"><span></span></td>
															</tr>
															<tr>
																<td colspan="1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Town/City</td>
																<td colspan="1"><form:input path="city" onkeyup="$('#townlabel').html('');" onclick="$('#townlabel').html('');"
																		cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="city"
																		cssClass="errors" /></td>
																		<td><label id="townlabel" style="color:red;"></label></td>
															</tr>
															<tr>
																<td colspan="1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Country/State</td>
																<td colspan="1"><form:input path="country" onkeyup="$('#countrylabel').html('');" onclick="$('#countrylabel').html('');" 
																		cssStyle="width:150px;" /></td>
																<td colspan="1"><form:errors path="country"
																		cssClass="errors" /></td>
																			<td><label id="countrylabel" style="color:red;"></label></td>
																		
															</tr>
															<tr>
																<td colspan="1" style="width: 220px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Postal Code</td>
																<td colspan="1"><form:input path="postcode"  onkeyup="$('#postallabel').html('');" onclick="$('#postallabel').html('');"
																		cssStyle="width:100px;" /></td>
																<td colspan="1"><form:errors path="postcode"
																		cssClass="errors" /></td>
																			<td><label id="postallabel" style="color:red;"></label></td>
																			
															</tr>
															<!-- <p class="speech" style="display: none;">SitePoint Rocks!</p> -->
															<%-- <tr>
																<td colspan="1">Category :-</td>
																<td colspan="1" rowspan="1">
																	<div style="width: 100%; height: 100%; overflow: auto;">
																		<table>
																			<c:forEach items="${category}" var="resultVal"
																				varStatus="counter">

																				<c:set var="selectedClientId"
																					value="${resultVal.categoryname}" />
																				<tr>
																					<td colspan="1">
																						<form:checkboxes items="${cat}" path="status" />
																						<form:checkbox id="${resultVal.categoryid}" path="" value="" onclick="getVal();"/>${resultVal.categoryname}
																					</td>
																				</tr>
																			</c:forEach>
																		</table>
																	</div>
																</td>																
																<td colspan="1"><form:errors path="categoryname"
																		cssClass="errors" /></td>
															</tr> --%>
															<tr>
																<td colspan="3">&nbsp; <input type="submit"
																	name="ButtonRegisterMe" value="Register" />
																</td>
															</tr>

														</table></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</td>
							<td class="style1">&nbsp;</td>
							<td width="238" align="right" valign="top">
								<table width="238" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="24">&nbsp;</td>
									</tr>
								</table> <jsp:include page="contactUs.jsp" />


							</td>
						</tr>
					</table>
				</td>
			</tr>
			<jsp:include page="footer.jsp" />
		</table>

	</form:form>

	<script>
	 /* var date = new Date();
		$(function() {
				$("#dateOfBirth").datepicker({
				dateFormat : 'dd/mm/yy',
				yearRange : '-94y:-14y',
				changeMonth : true,
				changeYear : true,
				defaultDate: date.getDay()+'/'+date.getMonth()+'/2000'
			});
			
		
			
		}); */
		$("#foreName").on('keyup',function() {
			/*  $(".speech").css({ display: "block" });*/
			$("#userId").val($(this).val());
		    });
		$("#surName").on('keyup',function() {
			$("#userId").val($('#foreName').val()+" "+ $(this).val());
		    });
		/* $("#foreName").on('mouseenter',function() {
			/*  $(".speech").css({ display: "block" });*/
			/*$("#userId").val($(this).val());
		    }); */
		$("#surName").on('mouseenter',function() {
			$("#userId").val($('#foreName').val()+" "+ $(this).val());
		    });
		function getVal() {
			alert("hello");
		}
	
		function checkform() {
			var flag="no";
			if ($("#foreName").val() == "") {
				$('#forelabel').html('First name must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			}  if ($("#surName").val() == "") {
				// something else is wrong
				$('#lastlabel').html('Last name must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			 } if ($("#userId").val() == "") {
				// something else is wrong
					$('#userlabel').html('User name must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes'; }
			 if ($("#newPassward").val() == "") {
				// something else is wrong
					$('#passlabel').html('Password must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#confirmPassward").val() == "") {
				// something else is wrong
					$('#confirmlabel').html('Confirm Password must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#dateOfBirth").val() == "") {
				// something else is wrong
					$('#doblabel').html('DOB must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#sex1").attr("checked") != "checked" && $("#sex2").attr("checked") != "checked") {
				// something else is wrong
				$('#sexlabel').html('Gender must not be blank');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#email").val() == "") {
				// something else is wrong
				$('#emaillabel').html('Email must not be blank');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#confirmEmail").val() == "") {
				// something else is wrong
					$('#confirmemaillabel').html('Confirm email must not be blank');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#telephone").val() == "" && $("#mobile").val() == "") {
				// something else is wrong
				$('#telephonelabel').html('Please enter your Landline number. If you don’t have one, put 000.');
				$('#mobilelabel').html('Please enter your Landline number. If you don’t have one, put 000.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			/* }else if ($("#mobile").val() == "") {
				// something else is wrong
				$('#label').html('All fields must be completed');
				return false; 
			}else if ($("#line1").val() == "") {
				// something else is wrong
					$('#line1label').html('Required field');
				$('#label').html('All fields must be completed');
				return false;*/
			} if ($("#country").val() == "") {
				// something else is wrong
				$('#countrylabel').html('Country must not be blank.');
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#city").val() == "") {
				// something else is wrong
					$('#townlabel').html('City must not be blank.');
				
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			} if ($("#postcode").val() == "") {
				// something else is wrong
					$('#postallabel').html('Postal code must not be blank.');
				
				$('#label').html('The indicated fields must be completed');
				flag='yes';
			}
			// If the script gets this far through all of your fields
			// without problems, it's ok and you can submit the form
			if(flag=='yes'){
				return false;
			}else{
				$('#label').html('');
				return true;
			}
		
		}
	</script>

</body>
</html>