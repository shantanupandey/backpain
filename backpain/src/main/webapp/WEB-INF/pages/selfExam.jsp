<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<c:set var="url" value="${contextPath}/selfExam.html" />
<c:if test="${loggedClient.roleId == 2}">
	<c:set var="url" value="${contextPath}/admin/selfExam.html" />
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
													<td height="25" colspan="3" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;"><center style="margin-top: -13px;font-size:13px;">5. Self
															Examination</center></strong></td>
												</tr>

												<c:if test="${not empty message}">
													<tr>
														<td height="25" colspan="3" style="font-family: Calibri;">
															<div style="color: #4F8A10; font-weight: bold;">
																${message}</div>
														</td>
													</tr>
												</c:if>
												<c:if test="${not empty error}">
													<tr>
														<td height="25" colspan="3" style="font-family: Calibri;">
															<div style="color: red; font-weight: bold;">
																${error}</div>
														</td>
													</tr>
												</c:if>
												<tr>
													<td align="right" colspan="3"><br /></td>
												</tr>
												<c:if test="${loggedClient.roleId == 2}">
													<jsp:include page="admin/clientInfo.jsp" />
													<tr>
														<td colspan="3"><br /></td>
													</tr>
												</c:if>


												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
														1. <fmt:message key="question23" />
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
																					<td><form:radiobutton path="question23"
																							value="328" /><label for="question23">I
																							could touch my feet or ankles</label></td>
																				</tr>
																				<tr>
																					<td><form:radiobutton path="question23"
																							value="329" /><label for="question23">I
																							could touch my mid calf with the tips of my
																							fingers</label></td>
																				</tr>
																				<tr>
																					<td><form:radiobutton path="question23"
																							value="330" /><label for="question23">I
																							could touch my knees with the tips of my fingers</label></td>
																				</tr>
																				<tr>
																					<td><form:radiobutton path="question23"
																							value="331" /><label for="question23">I
																							couldn't bend forward at all</label></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																	<td><span></span></td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="3"><form:errors path="question23"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="3" id="question23_error" class="mh_hide">
														<span class="errors">Please provide answer</span>
													</td>
												</tr>

												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>

												<tr>
													<td colspan="3">2.<fmt:message
															key="question65.desc" /></td>
												</tr>
												<%-- <tr>
													<td colspan="3">2 A] <fmt:message
															key="question65.desc" />
													</td>
												</tr> --%>
												<tr>
													<td colspan="3"><fmt:message key="question65" /></td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question65"
															cssStyle="width:250px;">
															<form:option value="" />
															<form:option value="No significant difference" />
															<form:option value="Tighter on the right" />
															<form:option value="Tighter on the left" />
														</form:select></td>
												</tr>
												<tr>
													<td colspan="3"><form:errors path="question65"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>


												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
														3.</td>
												</tr>
												<tr>
													<td colspan="3">3 A]<fmt:message key="question67" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><input type="hidden" name="question67"
														id="question67" /> <input type="hidden" name="question434"
														id="question434" /> <form:radiobutton path="question432"
															value="0" onclick="checkSides();" /><label
														for="question432">Both sides are normal</label> <form:radiobutton
															path="question432" value="1" onclick="checkSides1();" /><label
														for="question432">Left is weak</label> <form:radiobutton
															path="question432" value="2" onclick="checkSides2();" /><label
														for="question432">Right is weak</label> <form:radiobutton
															path="question432" value="3" onclick="checkSides3();" /><label
														for="question432">Both are weak</label></td>
												</tr>
												<tr>
													<td colspan="3"><form:errors path="question67"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="3">3 B] <fmt:message key="question68" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><input type="hidden" name="question68"
														id="question68" /> <input type="hidden" name="question435"
														id="question435" /> <form:radiobutton path="question433"
															value="0" onclick="checkHeel();" /><label
														for="question433">Both sides are normal</label> <form:radiobutton
															path="question433" value="1" onclick="checkHeel1();" /><label
														for="question433">Left is weak</label> <form:radiobutton
															path="question433" value="2" onclick="checkHeel2();" /><label
														for="question433">Right is weak</label> <form:radiobutton
															path="question433" value="3" onclick="checkHeel3();" /><label
														for="question433">Both are weak</label></td>
												</tr>
												<tr>
													<td colspan="3"><form:errors path="question68"
															cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>

												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
														4.</td>

												</tr>

												<tr>

													<td class="style1" colspan="3">
														<table id="ctl00_ContentPlaceHolder1_TableLeftLeg">
															<tbody>

																<tr>
																	<td colspan="3">4 A] <fmt:message key="question72" />
																	</td>
																</tr>
															</tbody>
														</table>

													</td>
												</tr>
												<input type="hidden" name="question72" id="question72" />
												<input type="hidden" name="question71" id="question71" />

												<tr>
													<td colspan="1" class="style1"></td>
													<td colspan="3"><form:select path="question515"
															cssStyle="width:250px;">
															<form:option value="410" label="Could not raise leg at all" />
															<form:option value="411"
																label="Less than a quarter of the way up" />
															<form:option value="412"
																label="About a quarter of the way up" />
															<form:option value="413" label="About half way up" />
															<form:option value="414" label="More than half way up" />

														</form:select></td>
												</tr>
												<tr>
													<td colspan="3" id="question72_error"><form:errors
															path="question72" cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr class="mh_hide" id="question72_SE">
													<td class="style1" colspan="3">4 A[cont] <fmt:message
															key="question73" />
													</td>

												</tr>
												<tr class="mh_hide" id="question72_SE2">
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question73"
																			value="Yes" /> <label for="question73">Yes</label></td>
																	<td><form:radiobutton path="question73" value="No" />
																		<label for="question73">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>


												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>


												<tr>
													<td colspan="3">4 B] <fmt:message key="question71" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question516"
															cssStyle="width:250px;">
															<form:option value="410" label="Could not raise leg at all" />
															<form:option value="411"
																label="Less than a quarter of the way up" />
															<form:option value="412"
																label="About a quarter of the way up" />
															<form:option value="413" label="About half way up" />
															<form:option value="414" label="More than half way up" />

														</form:select></td>
												</tr>

												<tr>
													<td colspan="3" id="question71_error"><form:errors
															path="question71" cssClass="errors" /></td>
												</tr>

												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>


												<tr class="mh_hide" id="question71_SE">
													<td class="style1" colspan="3">4 B [cont] <fmt:message
															key="question74" />
													</td>

												</tr>
												<tr class="mh_hide" id="question71_SE2">
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question74"
																			value="Yes" /> <label for="question74">Yes</label></td>
																	<td><form:radiobutton path="question74" value="No" />
																		<label for="question74">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="3" id="question74_error" class="mh_hide">
														<span class="errors">Please provide answer</span>
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td></td>
												</tr>
												<tr>
													<td colspan="3" style="border-top: dotted 1px black;">
													</td>
												</tr>

												<tr>
													<td colspan="3" id="question73_error" class="mh_hide">
														<span class="errors">Please provide answer</span>
													</td>
												</tr>
												<tr>
													<td class="style1" colspan="3"
														style="border-top: dotted 1px black;"><c:if
															test="${loggedClient.roleId == 1 && loggedClient.clientStateId  == 4}">
															<input type="submit" name="submit" value="Update Details"
																disabled="disabled" style="width: 120px" />
															<input type="submit" name="submit"
																value="proceed" />
															<input type="hidden" id="sendMessage" name="sendMessage"
																value="Yes"></input>

														</c:if> <c:if
															test="${loggedClient.roleId == 2 || loggedClient.clientStateId  != 4}">
															Click ‘Update’ to continue: <input type="submit" name="submit" value="Update"
																style="width: 120px" />
														</c:if> <br /></td>
												</tr>
												<tr>
													<td class="style1" colspan="3">&nbsp;</td>
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

	$(document).ready(function() {
	   
		
	    if($('input[id=question4321]').attr('checked') == "checked"){
	    	
	    	 document.getElementById('question67').value = '426';
	    	 document.getElementById('question434').value = '426';
	    }else if($('input[id=question4322]').attr('checked') == "checked"){
	    	
	   	     document.getElementById('question67').value = '427';
        	 document.getElementById('question434').value = '426';
	    }else if($('input[id=question4323]').attr('checked') == "checked"){
	    	
	    	 document.getElementById('question67').value = '426';
	    	 document.getElementById('question434').value = '427';
	    }else if($('input[id=question4324]').attr('checked') == "checked"){
	    	
	    	 document.getElementById('question67').value = '427';
	    	 document.getElementById('question434').value = '427';
	    }
	    
	    if($('input[id=question4331]').attr('checked') == "checked"){
	    	
	    	 document.getElementById('question68').value = '430';
	    	 document.getElementById('question435').value = '430';
	    }else if($('input[id=question4332]').attr('checked') == "checked"){
	    	
	 	     document.getElementById('question68').value = '431';
	    	 document.getElementById('question435').value = '430';
	    }else if($('input[id=question4333]').attr('checked') == "checked"){
	    	
	    	 document.getElementById('question68').value = '430';
	    	 document.getElementById('question435').value = '431';
	    }else if($('input[id=question4334]').attr('checked') == "checked"){
	    	
	    	 document.getElementById('question68').value = '431';
	    	 document.getElementById('question435').value = '431';
	    }
	});
  
   function checkSides(){
	   document.getElementById('question67').value = '426';
	   document.getElementById('question434').value = '426';
   }
   
   function checkSides1(){
	   document.getElementById('question67').value = '427';
	   document.getElementById('question434').value = '426';
   } 
   
   function checkSides2(){
	   

		document.getElementById('question67').value = '426';
		document.getElementById('question434').value = '427';
	}

	function checkSides3() {

		document.getElementById('question67').value = '427';
		document.getElementById('question434').value = '427';
	}

	function checkHeel() {
		document.getElementById('question68').value = '430';
		document.getElementById('question435').value = '430';
	}
	function checkHeel1() {
		document.getElementById('question68').value = '431';
		document.getElementById('question435').value = '430';
	}

	function checkHeel2() {
		document.getElementById('question68').value = '430';
		document.getElementById('question435').value = '431';
		
	}

	function checkHeel3() {
		document.getElementById('question68').value = '431';
		document.getElementById('question435').value = '431';
	}

	var errMessage = '<span class="errors">Please provide answer</span>';

	$(function() {

		$('select[name^="question5"]').each(function() {
			var id = $(this).attr("name");
			var val = $(this).val();
			val = $.trim(val);
			if (id == "question516") {
				if (val != "" && parseInt(val) != 4) {
					$("[id^='question71_SE']").removeClass('mh_hide');
					
				}
			}
			if (id == "question515") {
				if (val != "" && parseInt(val) != 4) {
					$("[id^='question72_SE']").removeClass('mh_hide');
					
				}
			}

		});

		$("select[name=question516]").change(function() {

			var val = $(this).val();
			val = $.trim(val);

			if (isNaN(val) || val == "") {
				$("#question71_error").html(errMessage);
			} else {
				$("#question71_error").html('');
			}

			if (val == "" || parseInt(val) == 4) {
				$("[id^='question71_SE']").addClass('mh_hide');
				$('input[type=radio][name=question74]').attr('checked', false);
				$("#question74_error").addClass('mh_hide');
			} else {
				$("[id^='question71_SE']").removeClass('mh_hide');

			}

		});

		$("select[name=question515]").change(function() {

			var val = $(this).val();
			val = $.trim(val);

			if (isNaN(val) || val == "") {
				$("#question72_error").html(errMessage);
			} else {
				$("#question72_error").html('');
			}

			if (val == "" || parseInt(val) == 4) {
				$("[id^='question72_SE']").addClass('mh_hide');
				$('input[type=radio][name=question73]').attr('checked', false);
				$("#question73_error").addClass('mh_hide');
			} else {
				$("[id^='question72_SE']").removeClass('mh_hide');
			}

		});
		$("input[id=question742]").change(function() {
			if($("input[type=radio][id=question742]").is(':checked')){
				document.getElementById('question71').value = '410';
			}
		});
		
				$("input[id=question732]").change(function() {
					if($("input[type=radio][id=question732]").is(':checked')){
						document.getElementById('question72').value = '410';
					}
				});
		$('#form').submit(
				function(event) {
					var valid = true;
					var q516 = $("select[name=question516]").val();
					var q515 = $("select[name=question515]").val();
					var q73 = $('input[name=question73]:checked').val();
					var q74 = $('input[name=question74]:checked').val();
					q516 = $.trim(q516);
					q515 = $.trim(q515);
					

				
					
					if(q73=="No"){
						
						document.getElementById('question72').value = '410';
					}else{
						

						document.getElementById('question72').value = q515;
					}
					
					if(q74=="No"){
						
						document.getElementById('question71').value = '430';

					}else{
						
						document.getElementById('question71').value = q516;
					}
					
					if (q516 == "") {
						valid = false;
						$("#question71_error").html(errMessage);
						$("select[name=question516]").focus();
					} else {
						$("#question71_error").html('');
						if (parseInt(q516) != 4 && !validateRadio('question74')
								&& valid) {
							valid = false;
							$("input[name=question74]").focus();
						}
					}

					if (q515 == "") {
						$("#question72_error").html(errMessage);
						if (valid)
							$("select[name=question515]").focus();
						valid = false;
					} else {
						$("#question72_error").html('');
						if (parseInt(q515) != 4 && !validateRadio('question73')
								&& valid) {
							valid = false;
							$("input[name=question73]").focus();
						}
					}
					

					if (valid) {
						return true;
					} else {
						event.preventDefault();
						return false;
					}

				});

		function validateRadio(name) {

			if ($("input[type=radio][name=" + name + "]").is(':checked')) {
				$("#" + name + "_error").addClass('mh_hide');
				return true;
				
			} else {
				$("#" + name + "_error").removeClass('mh_hide');
				return false;
				
			}

		}

	});
</script>

</body>
</html>