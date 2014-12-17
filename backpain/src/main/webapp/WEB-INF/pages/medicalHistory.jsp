<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<c:set var="url" value="${contextPath}/medicalHistory.html" />
<c:if test="${loggedClient.roleId == 2}">
	<c:set var="url" value="${contextPath}/admin/medicalHistory.html" />
</c:if>
<body>

	<form:form method="post" action="${url}" name="mh_form"
		commandName="form">

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
													<td height="25" colspan="2" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;"><center style="margin-top: -13px;font-size:13px;"+>2. Medical
															History</center></strong></td>
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
												<tr>
													<td colspan="2" class="mh_style3"><br /></td>
												</tr>
												<c:if test="${loggedClient.roleId == 2}">
													<jsp:include page="admin/clientInfo.jsp" />
													<tr>
														<td colspan="2"><br /></td>
													</tr>
												</c:if>
												<tr>
													<td colspan="2">1. <fmt:message key="question1" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:select path="question1"
															cssStyle="width:250px;">
															<form:option value="" />
															<form:option value="No" />
															<form:option value="1 - 5 days" />
															<form:option value="6 - 20 days" />
															<form:option value="21 - 50 days" />
															<form:option value="51 - 100 days" />
															<form:option value="over 100 days" />
														</form:select></td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question1"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														2. <fmt:message key="question2" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:radiobutton path="question2" value="Yes" /><label
														for="question2">Yes</label> <form:radiobutton
															path="question2" value="No" /><label for="question2">No</label>
													</td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question2"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														3. <fmt:message key="question3" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>

													<td><form:radiobutton path="question3" value="Yes" /><label
														for="">Yes</label> <form:radiobutton path="question3"
															value="No" /><label for="">No</label></td>
												</tr>
												<tr>
												<td id="question3_message" class="mh_hide">
																		<span class="errors">Please Tick one or more of the items on the following list:</span>
												</td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question3"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2">
														<table width="100%" id="question3_MH" class="mh_hide">
															<tbody>
																<tr>
																	<td class="mh_style6"><form:checkbox
																			path="question110" value="Prolapsed Disk" /><label
																		for="question110">Prolapsed Disk</label></td>
																	<td><form:checkbox path="question110"
																			value="Spondylosis" /><label for="question110">Spondylosis</label>
																	</td>
																	<td class="mh_style1"><form:checkbox
																			path="question110" value="Osteoarthritis" /><label
																		for="question110">Osteoarthritis</label></td>
																	<td><form:checkbox path="question110"
																			value="Scoliosis" /><label for="question110">Scoliosis</label>
																	</td>
																</tr>
																<tr>
																	<td class="mh_style6"><form:checkbox
																			path="question110" value="Spondylolisthesis" /><label
																		for="question110">Spondylolisthesis</label></td>
																	<td><form:checkbox path="question110"
																			value="Other" /><label for="question110">Other</label>
																	</td>
																	<td class="mh_style1"><form:checkbox
																			path="question110" value="Don't Know" /><label
																		for="question110">Don't Know</label></td>
																</tr>
																<tr>
																	<td id="question110_error" class="mh_hide"><span
																		class="errors">Please select at least one</span></td>
																</tr>

																<tr>
																	<td colspan="1" id="question110_other_MH"
																		class="mh_hide"><form:textarea path="question111"
																			cols="20" rows="2"
																			cssStyle="height:69px;width:231px;" /></td>
																	<td id="question110_other_error" class="mh_hide">
																		<span class="errors">Please provide detail</span>
																	</td>
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
														4. <fmt:message key="question4" />
													</td>
												</tr>

												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:radiobutton path="question4" value="Yes" /><label
														for="question4">Yes</label> <form:radiobutton
															path="question4" value="No" /><label for="question4">No</label>
													</td>
												</tr>
												<tr>
												<td id="question4_message" class="mh_hide">
																		<span class="errors">Please Tick one or more of the items on the following list:</span>
												</td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question4"
															cssClass="errors" /></td>
												</tr>

												<tr>
													<td colspan="2">
														<table width="100%" id="question4_MH" class="mh_hide">
															<tbody>
																<tr>
																	<td colspan="1"><form:checkbox path="question112"
																			value="Reduced space between lower lumbar vetebrae" /><label
																		for="question112">Reduced space between lower
																			lumbar vetebrae</label></td>
																	<td><form:checkbox path="question112"
																			value="Osteoarthritis" /><label for="question112">Osteoarthritis</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question112"
																			value="Reduced space between vetebrae in mid back" /><label
																		for="question112">Reduced space between
																			vetebrae in mid back</label></td>
																	<td><form:checkbox path="question112"
																			value="Ankylosing spondylitis" /><label
																		for="question112">Ankylosing spondylitis</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question112"
																			value="Spondylolisthesis" /><label for="question112">Spondylolisthesis</label>
																	</td>
																	<td><form:checkbox path="question112"
																			value="Wedge-shaped vertebra" /><label
																		for="question112">Wedge-shaped vertebra</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question112"
																			value="Scoliosis" /><label for="question112">Scoliosis</label>
																	</td>
																	<td><form:checkbox path="question112"
																			value="Spondylosis" /><label for="question112">Spondylosis</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question112"
																			value="Spina bifida" /><label for="question112">Spina
																			bifida</label></td>
																	<td><form:checkbox path="question112"
																			value="Other" /><label for="question112">Other</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question112"
																			value="Don't know" /><label for="question112">Don't
																			know</label></td>
																	<td></td>
																</tr>
																<tr>
																	<td id="question112_error" class="mh_hide"><span
																		class="errors">Please select at least one</span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question112_other_MH"
																		class="mh_hide"><form:textarea path="question113"
																			cols="20" rows="2"
																			cssStyle="height:69px;width:231px;" /></td>
																	<td id="question112_other_error" class="mh_hide">
																		<span class="errors">Please provide detail</span>
																	</td>
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
														5. <fmt:message key="question5" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:radiobutton path="question5" value="Yes" /><label
														for="question5">Yes</label> <form:radiobutton
															path="question5" value="No" /><label for="question5">No</label>
													</td>
												</tr>
												<tr>
												<td id="question5_message" class="mh_hide">
																		<span class="errors">Please Tick one or more of the items on the following list:</span>
												</td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question5"
															cssClass="errors" /></td>
												</tr>


												<tr>
													<td colspan="2">
														<table width="100%" id="question5_MH" class="mh_hide">
															<tbody>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="No prolapsed or herniated disk" /> <label
																		for="question114">No prolapsed or herniated
																			disk</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Disk bulge without nerve trapping,in lower lumbar spine" />
																		<label for="question114">Disk bulge without
																			nerve trapping,in lower lumbar spine</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Prolapsed or herniated disk with nerve trapping in lower lumbar spine" />
																		<label for="question114">Prolapsed or
																			herniated disk with nerve trapping in lower lumbar
																			spine</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Osteoarthritis" /> <label for="question114">Osteoarthritis</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Scoliosis" /> <label for="question114">Scoliosis</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Spondylolisthesis" /> <label for="question114">Spondylolisthesis</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Other" /> <label for="question114">Other</label>
																	</td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question114"
																			value="Don't Know" /> <label for="question114">Don't
																			Know</label></td>
																	<td></td>
																</tr>
																<tr>
																	<td id="question114_error" class="mh_hide"><span
																		class="errors">Please select at least one</span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question114_other_MH"
																		class="mh_hide"><form:textarea path="question115"
																			cols="20" rows="2"
																			cssStyle="height:69px;width:231px;" /></td>
																	<td id="question114_other_error" class="mh_hide">
																		<span class="errors">Please provide detail</span>
																	</td>
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
														6. <fmt:message key="question6" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:radiobutton path="question6" value="Yes" /><label
														for="question6">Yes</label> <form:radiobutton
															path="question6" value="No" /><label for="question6">No</label>
													</td>
												</tr>
												<tr>
												<td id="question6_message" class="mh_hide">
																		<span class="errors">Please Tick one or more of the items on the following list:</span>
												</td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question6"
															cssClass="errors" /></td>
												</tr>

												<tr>
													<td colspan="2">
														<table width="100%" id="question6_MH" class="mh_hide">
															<tbody>
																<tr>
																	<td class="mh_style6"><form:checkbox
																			path="question116"
																			value="An injection into the spine" /> <label
																		for="question116">An injection into the spine</label>
																	</td>
																	<td><form:checkbox path="question116"
																			value="Keyhole surgery for prolapsed disc" /> <label
																		for="question116">Keyhole surgery for
																			prolapsed disc</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question116"
																			value="Diskectomy" /> <label for="question116">Diskectomy</label>
																	</td>
																	<td><form:checkbox path="question116"
																			value="Fusion of vertebrae" /> <label
																		for="question116">Fusion of vertebrae</label></td>
																</tr>
																<tr>
																	<td colspan="1"><form:checkbox path="question116"
																			value="Other" /> <label for="question116">Other</label>
																	</td>
																	<td colspan="1"></td>
																</tr>
																<tr>
																	<td id="question116_error" class="mh_hide"><span
																		class="errors">Please select at least one</span></td>
																</tr>
																<tr>
																	<td colspan="1" id="question116_other_MH"
																		class="mh_hide"><form:textarea path="question117"
																			cols="20" rows="2"
																			cssStyle="height:69px;width:231px;" /></td>
																	<td id="question116_other_error" class="mh_hide">
																		<span class="errors">Please provide detail</span>
																	</td>
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
														7.<fmt:message key="question7" />
													</td>
												</tr>
												
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:radiobutton path="question7" value="Yes"/><label
														for="question7">Yes</label> <form:radiobutton
															path="question7" value="No" /><label for="question7">No</label>
													</td>
												</tr>
												<tr>
												<td id="question7_message" class="mh_hide">
																		<span class="errors">Please Tick one or more of the items on the following list:</span>
												</td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question7"
															cssClass="errors" /></td>
												</tr>

												<tr>
													<td colspan="2">
														<table width="100%" id="question7_MH" class="mh_hide">
															<tbody>
																<tr>
																	<td class="mh_style6"><form:checkbox
																			path="question118" value="Motor accident" /> <label
																		for="question118">Motor accident</label></td>
																	<td><form:checkbox path="question118" value="Fall" />
																		<label for="question118">Fall</label></td>
																	<td><form:checkbox path="question118"
																			value="Horse riding accident" /> <label
																		for="question118">Horse riding accident</label></td>
																</tr>
																<tr>
																	<td class="mh_style6"><form:checkbox
																			path="question118" value="Gymnastic or dance injury" />
																		<label for="question118">Gymnastic or dance
																			injury</label></td>
																	<td><form:checkbox path="question118"
																			value="Some other sports injury" /> <label
																		for="question118">Some other sports injury</label></td>
																	<td><form:checkbox path="question118"
																			value="Other" /> <label for="question118">Other</label>
																	</td>
																</tr>
																<tr>
																	<td id="question118_error" class="mh_hide"><span
																		class="errors">Please select at least one</span></td>
																</tr>
																<tr>
																	<td colspan="2" id="question118_other_MH"
																		class="mh_hide"><form:textarea path="question119"
																			cols="20" rows="2"
																			cssStyle="height:69px;width:231px;" /></td>
																	<td id="question118_other_error" class="mh_hide">
																		<span class="errors">Please provide detail</span>
																	</td>
																</tr>
																<tr>
																	<td colspan="3"></td>
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
														8. <fmt:message key="question8" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:radiobutton path="question8" value="Yes" /><label
														for="">Yes</label> <form:radiobutton path="question8"
															value="No" /><label for="">No</label></td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question8"
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
													<td colspan="2" style="border-top: dotted 1px black;">
														9. <fmt:message key="question12" /> &nbsp; &nbsp;

													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td class="mh_style5">
																		<table>
																			<tbody>
																				<tr>
																					<td colspan="1"><form:checkbox
																							path="question12" value="Anti-Inflammatory Drugs" /><label
																						for="question12">Anti-Inflammatory Drugs</label></td>
																					<td><form:checkbox path="question12"
																							value="Pain Killers" /><label for="question12">Pain
																							Killers</label></td>
																				</tr>
																				<tr>
																					<td><form:checkbox path="question12"
																							value="None" /><label for="question12">None
																							of these</label></td>
																					<td></td>
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
													<td colspan="2"><form:errors path="question12"
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
													<td colspan="2" style="border-top: dotted 1px black;">
														10. <fmt:message key="question14" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="mh_style4"></td>
													<td><form:select path="question14"
															cssStyle="width:200px;">
															<form:option value="" />
															<form:option value="No" />
															<form:option value="Bladder Only" />
															<form:option value="Bowel Only" />
															<form:option value="Bladder & Bowel" />
														</form:select></td>
												</tr>
												<tr>
													<td colspan="2"><form:errors path="question14"
															cssClass="errors" /></td>
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
															<%--  <a href="#"> <fmt:message key="form.admin.link" /> </a> --%>
														</c:if> <c:if
															test="${loggedClient.roleId == 2 || loggedClient.clientStateId  != 4}">
															Click ‘Update’ to continue: <input type="submit" name="submit" value="Update" />
														</c:if>

													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														&nbsp;</td>
												</tr>
												<tr>
													<td class="mh_style4"><label> &nbsp;</label></td>
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
var yes ="Yes"
$(function() {
	
	function showMessage(){
		alert("hi");
	}
	
	$('input[name^="question"][type=radio]:checked').each(function( index ) {
		if ($(this).val() == yes) {
			var id = $(this).attr("name");
			$("#" + id  +"_MH").removeClass('mh_hide');
		}
	});
	
	$("input[value=Other]:checked").each(function( index ) {
		var id = $(this).attr("name");		
	   $('#' + id+ '_other_MH').removeClass('mh_hide');		
		
	});
	
	$('input[name^="question11"][type=checkbox]').click(function(){
		var name = $(this).attr("name");
		if ($("input:checkbox[name="+ name+ "]").is(':checked')) {	
			$("#"+ name +"_error").addClass('mh_hide');	
		}		
	
	});

	$('input:checkbox[name^="question"]').click(function(){
		var name = $(this).attr("name");
		var val = $(this).val();
		var none = $("input[value='None'][name="+ name +"]")
		if ($(this).is(':checked')) {	
			
			if (val == "None") {
				$("input:checkbox[name="+ name +"]").not(none).attr('checked',false);
			} else {
				none.attr('checked',false);
			}
				
		}			
	
	});
	
	
	$("input[value=Other]").change(function () {
		var id = $(this).attr("name");
		if ($(this).is(':checked')) {
		    $('#' + id+ '_other_MH').removeClass('mh_hide');		
		} else {
		    $('#' + id+ '_other_MH').addClass('mh_hide');
		    $("#"+ id +"_other_error").addClass('mh_hide');
		    id = id.replace("question", "");
		     ++id;
		    $("textarea[name=question"+ id + "]").val('');
		}
	});
	
	
	$("input[name=question3]").change(function () {
		if ($(this).val() == yes) {
			$("#question3_message").removeClass('mh_hide');
			$("#question3_MH").removeClass('mh_hide');
		} else {
			$("#question3_message").addClass('mh_hide');
			$("#question3_MH").addClass('mh_hide');
			$('input:checkbox[name=question110]').attr('checked',false);
			
			$("textarea[name=question111]").val('');
			$("[id^=question110]").not(':checkbox').addClass('mh_hide');
		}
			
		
	});
	
	
	
	$("input[name=question4]").change(function () {
		if ($(this).val() == yes) {
			$("#question4_message").removeClass('mh_hide');
			$("#question4_MH").removeClass('mh_hide');
		} else {
			$("#question4_message").addClass('mh_hide');
			$("#question4_MH").addClass('mh_hide');
			$('input:checkbox[name=question112]').attr('checked',false);
			
			$("textarea[name=question113]").val('');
			$("[id^=question112]").not(':checkbox').addClass('mh_hide');
		}
	});
	
	$("input[name=question5]").change(function () {
		if ($(this).val() == yes) {
			$("#question5_message").removeClass('mh_hide');
			$("#question5_MH").removeClass('mh_hide');
		} else {
			$("#question5_message").addClass('mh_hide');
			$("#question5_MH").addClass('mh_hide');
			$('input:checkbox[name=question114]').attr('checked',false);
			
			$("textarea[name=question115]").val('');
			$("[id^=question114]").not(':checkbox').addClass('mh_hide');
		}
	});
	
	$("input[name=question6]").change(function () {
		if ($(this).val() == yes) {
			$("#question6_message").removeClass('mh_hide');
			$("#question6_MH").removeClass('mh_hide');
		} else {
			$("#question6_message").addClass('mh_hide');
			$("#question6_MH").addClass('mh_hide');
			$('input:checkbox[name=question116]').attr('checked',false);
			
			$("textarea[name=question117]").val('');
			$("[id^=question116]").not(':checkbox').addClass('mh_hide');
		}
	});
	
	$("input[name=question7]").change(function () {
		if ($(this).val() == yes) {
			$("#question7_message").removeClass('mh_hide');
			$("#question7_MH").removeClass('mh_hide');
		} else {
			$("#question7_message").addClass('mh_hide');
			$("#question7_MH").addClass('mh_hide');
			$('input:checkbox[name=question118]').attr('checked',false);
			
			$("textarea[name=question119]").val('');
			$("[id^=question118]").not(':checkbox').addClass('mh_hide');
		}
	});	
	
	$('#form').submit(function(event){
		 var valid = true;
		 var q3 = $("input[name=question3]:checked").val();
		 var q4 = $("input[name=question4]:checked").val();
		 var q5 = $("input[name=question5]:checked").val();
		 var q6 = $("input[name=question6]:checked").val();
		 var q7 = $("input[name=question7]:checked").val();
		 
		 if (q3 == yes && !validateCheckBox('question110', 'question111')) {
			 valid = false;
			 $("input[name=question3]").focus();
			
		 }
		 
 		 if (q4 == yes && !validateCheckBox('question112', 'question113') && valid) {
			 valid = false;		
			 $("input[name=question4]").focus();
		 }
 		 
 		 if (q5 == yes && !validateCheckBox('question114', 'question115') && valid) {
			 valid = false;	
			 $("input[name=question5]").focus();
		 }
 		 
 		 if (q6 == yes && !validateCheckBox('question116', 'question117') && valid) {
			 valid = false;		
			 $("input[name=question6]").focus();
		 }
 		 
 		 
 		 if (q7 == yes && !validateCheckBox('question118', 'question119') && valid) {
			 valid = false;		
			 $("input[name=question7]").focus();
		 }
 
 
		 if(valid) {			
			 return true;
		 } else {			
			 event.preventDefault();
			 return false;	 
		 }
		
		 
		  
		
		 
	});
	
	
});

function validateCheckBox(name, other) {
	
	
	if ($("input:checkbox[name="+ name+ "][value=Other]").is(':checked')) {
		
		var other = $("textarea[name="+ other +"]").val();
		other = $.trim(other);
		if ( other == "") {
			$("#"+ name +"_other_error").removeClass('mh_hide');
			$("#"+ name +"_error").addClass('mh_hide');
			return false;
		} else {
			$("#"+ name +"_other_error").addClass('mh_hide');
		}
	}
	
	if ($("input:checkbox[name="+ name+ "]").is(':checked')) {
			$("#"+ name +"_error").addClass('mh_hide');	
		return true;
	} else {
		$("#"+ name +"_error").removeClass('mh_hide');
		return false;
	}


	
}

</script>

</body>
</html>