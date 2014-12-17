<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<c:set var="url" value="${contextPath}/backPain2.html"/>
<c:if test="${loggedClient.roleId == 2}">
	<c:set var="url" value="${contextPath}/admin/backPain2.html"/>
</c:if>
<body>

	<form:form method="post"
		action="${url}"
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
									<td width="238" align="left" valign="top">
									<c:if test="${loggedClient.roleId == 1}">
										<jsp:include page="left.jsp" />
									</c:if>
									<c:if test="${loggedClient.roleId == 2}">
										<jsp:include page="admin/adminLeft.jsp" />
									</c:if>	</td>
									<td width="15">&nbsp;</td>
									<td width="727" align="left" valign="top">


										<table width="727px" border="0" cellpadding="3"
											cellspacing="0" class="tbl_Grid">
											<tbody>
												<tr>
													<td height="25" colspan="2" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;"><center style="margin-top: -13px;font-size:13px;">4. About
															Back Pain(2)</center></strong></td>
												</tr>
												<tr>
													<td align="right" colspan="2"><span></span></td>
												</tr>
											 <c:if test="${not empty message}">
													<tr>
												      <td height="25" colspan="2" style="font-family: Calibri;">               
													      	<div style="color: #4F8A10;font-weight: bold;"><font size="4">${message}</font></div>      								    			
													  </td>
													</tr>
											</c:if>
											<c:if test="${not empty error}">
													<tr>
												      <td height="25" colspan="2" style="font-family: Calibri;">               
													      	<div style="color: red;font-weight: bold;"> ${error}  </div>      								    			
													  </td>
													</tr>
											</c:if>
											<c:if test="${loggedClient.roleId == 2}">												
												<jsp:include page="admin/clientInfo.jsp" />		   
												<tr>
													<td colspan="2"><br/></td>
												</tr>
											</c:if>
											
												
												<tr>
																	<td colspan="2">
																		1. <fmt:message key="question25" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table id="question25_RadioButton" border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="322" /><label for="question25">I
																											was able to sit in any chair for as long as I
																											liked</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="323" /><label for="question25">I
																											could only sit in my favorite chair as long
																											as I liked</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="324" /><label for="question25">Pain
																											prevented me from sitting more than 1 hour</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="325" /><label for="question25">Pain
																											prevented me from sitting more than 30
																											minutes</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="326" /><label for="question25">Pain
																											prevented me from sitting more than 15
																											minutes</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="327" /><label for="question25">Pain
																											prevented me from sitting at all</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question25"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question25_error" class="mh_hide">
																		<span class="errors">Please provide answer</span>
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
																		2. <fmt:message key="question26" />
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
																									<td><form:radiobutton path="question26"
																											value="0" /><label for="question26">I
																											could stand as long as I wanted without extra
																											pain</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question26"
																											value="20" /><label for="question26">I
																											could stand as long as I wanted but it gave
																											me extra pain</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question26"
																											value="40" /><label for="question26">Pain
																											prevented me from standing more than 1 hour</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question26"
																											value="60" /><label for="question26">Pain
																											prevented me from standing more than 30
																											minutes</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question26"
																											value="80" /><label for="question26">Pain
																											prevented me from standing more than 15
																											minutes</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question26"
																											value="100" /><label for="question26">Pain
																											prevented me from standing at all</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><form:errors path="question26"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question26_error" class="mh_hide">
																		<span class="errors">Please provide answer</span>
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
																		3. <fmt:message key="question27" />
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
																									<td><form:radiobutton path="question27"
																											value="340" onclick="updateTextValue();"/><label for="question27">Pain
																											did not prevent me walking any distance</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="341" onclick="updateTextValue();"/><label for="question27">Pain
																											did not prevent me walking more than 1 mile</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="342" onclick="updateTextValue();"/><label for="question27">Pain
																											did not prevent me walking more than 1/2 mile</label></td>
																								</tr>
																								
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="343" onclick="updateTextValue();"/><label for="question27">Pain did not prevent me from walking up to 1/2 mile</label></td>
																								</tr>
																								
																								
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="344" onclick="updateTextValue();"/><label for="question27">I
																											could walk but less than 1/4 of a mile</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="512" onclick="updateTextValue();"/><label for="question27">I
																											was unable to walk at all</label></td>
																								</tr>
																								 <input type="hidden" id="question505" name="question505" value=""/>
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
																	<td colspan="2"><form:errors path="question27"
																			cssClass="errors" /></td>
																</tr>
																<tr>
																	<td colspan="2" id="question27_error" class="mh_hide">
																		<span class="errors">Please provide answer</span>
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
																	</td>
																</tr>
												
												
												
												
												   
												<tr>
													<td colspan="2"><br/></td>
												</tr>
											
											
											
											    
												<tr>
													<td colspan="2">4. <fmt:message key="question50" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question50">
															<form:option value="" />
															<form:option value="315"
																label="I can lift weights without pain" />
															<form:option value="316"
																label="I can lift weights without additional pain" />
															<form:option value="317"
																label="I can lift heavy weights but it causes extra pain" />
															<form:option value="318"
																label="Pain stops me lifting heavy weights off the floor but I can manage if they are conveniently positioned" />
															<form:option value="319"
																label="Pain stops me lifting heavy weights but I can manage light to medium weights if they are conveniently positioned" />
															<form:option value="320"
																label="I can lift only very light weights" />
															<form:option value="321"
																label="I cannot left or carry anything" />
														</form:select></td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question50" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														5. <fmt:message key="question51" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question51"
																			value="Yes" /> <label for="question51">Yes</label></td>
																	<td><form:radiobutton path="question51" value="No" />
																		<label for="question51">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question51" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td></td>
												</tr>
												<tr id="question51_BP2" class="mh_hide">
													<td colspan="2"><span>5[A].
															<fmt:message key="question52" />
													</span></td>
												</tr>
												<tr id="question51_BP22" class="mh_hide">
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>

																	<td><form:checkbox path="question52"
																			value="Less than 10 minutes" onmouseup="onlyOne();"/><label
																		for="question52">Less than 10 minutes</label></td>
																	<td><form:checkbox path="question52"
																			value="10-30 minutes" onmouseup="onlyOne();"/><label for="question52">10-30
																			minutes</label></td>
																	<td><form:checkbox path="question52"
																			value="30-60 minutes" onmouseup="onlyOne();"/><label for="question52">30-60
																			minutes</label></td>
																	<td><form:checkbox path="question52"
																			value="More than 60 minutes" onmouseup="onlyOne();" /><label
																		for="question52">More than 60 minutes</label></td>

																</tr>
															</tbody>
														</table>

													</td>
												</tr>
												<tr>
													<td colspan="2" id="question52_error" class="mh_hide"> <span class="errors">Please select at least one</span>
											 	    </td>
												</tr>
												<tr> 
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														6. <fmt:message key="question53" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question53">
															<form:option value="" />
															<form:option value="312" label="Remains about the same" />
															<form:option value="313"
																label="Remains about the same unless I do something that exacerbates it(e.g carrying, shopping etc)" />
															<form:option value="314" label="Get worse" />
														</form:select></td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question53" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														7. <fmt:message key="question56" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question56"
																			value="333" /> <label for="question56">Yes</label></td>
																	<td><form:radiobutton path="question56" value="332" />
																		<label for="question56">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question56" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														8. <fmt:message key="question57" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question57"
																			value="407" /> <label for="question57">Yes</label></td>
																	<td><form:radiobutton path="question57" value="406" />
																		<label for="question57">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question57" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														9. <fmt:message key="question58" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question58">
															<form:option value="" />
															<form:option value="418"
																label="Gradual onset over several weeks or months" />
															<form:option value="419"
																label="Gradual onset over several years" />
															<form:option value="420"
																label="Sudden onset in a traumatic accident" />
															<form:option value="421"
																label="Sudden onset at the time of strenuous activity" />
															<form:option value="422"
																label="Sudden onset a few hours after strenuous activity or at the time of normal activity(e.g bending over)" />
															<form:option value="423" label="Onset overnight" />
														</form:select></td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question58" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													
													<!-- start here question 9 -->
													10. <fmt:message key="question417" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td>
													<form:radiobutton path="question417"
																			value="424" /> <label for="question417">Yes</label>
													<form:radiobutton path="question417" value="425" />
																		<label for="question417">No</label>
													</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question59" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													<!-- End question 9 -->
													
													
													
														11. <fmt:message key="question59" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question59">
															<form:option value="" />
															<form:option value="No" />
															<form:option value="Sudden onset, Gradual relief" />
															<form:option
																value="Sudden onset, sometimes sudden relief" />
														</form:select></td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question59" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														12. <fmt:message key="question60" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question60"
																			value="339" /> <label for="question60">Yes</label></td>
																	<td><form:radiobutton path="question60" value="338" />
																		<label for="question60">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question60" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														13. <fmt:message key="question61" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question61"
															cssStyle="width:250px;">

															<form:option value="" label="" />
															<form:option value="1" label="No Change" />
															<form:option value="2"
																label="Worse, over the past few months" />
															<form:option value="3" label="Worse, over the last year" />
															<form:option value="4"
																label="Worse, over the last 2 years" />>
															<form:option value="5" label="Worse, over the last 5 years" />
															<form:option value="6"
																label="Worse, over the last 10 years" />
															<form:option value="7"
																label="Better, over the past few months" />
															<form:option value="8" label="Better, over the last year" />
															<form:option value="9"
																label="Better, over the last 2 years" />
															<form:option value="10"
																label="Better, over the last 5 years" />
															<form:option value="11"
																label="Better, over the last 10 years" />

														</form:select></td>
												</tr>
												<tr>
								                    <td colspan="2">
								                    	<form:errors path="question61" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
											<c:if test="${loggedClient.roleId == 1 && loggedClient.clientStateId  == 4}">
						                         <input type="submit" name="submit" value="Update Details"  disabled="disabled"/>
						                         <input type="submit" name="submit" value="proceed"/>
									               <input type="hidden" id="sendMessage" name="sendMessage" value="Yes"></input>
						                        <%--  <a href="#"> <fmt:message key="form.admin.link" /> </a> --%>                         
						                    </c:if>
						                    
						                    <c:if test="${loggedClient.roleId == 2 || loggedClient.clientStateId  != 4}"> 
						                         Click ‘Update’ to continue: <input type="submit" name="submit" value="Update" />                   
						                    </c:if>
						                    <br />  

													</td>
												</tr>
												<tr>
													<td class="style1"><label> &nbsp;</label></td>
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
	
	$( document ).ready(function() {
		var setVal="";
		 var value=$('input[name=question27]:checked').val();
		 if(value== 340){
			 setVal=506; 
		 }if(value== 341){
			 setVal=507; 
		 }if(value== 342){
			 setVal=508; 
		 }
		 if(value== 343){
			 setVal=509; 
		 }if(value== 344){
			 setVal=510; 
		 }if(value== 512){
			 setVal=513; 
		 }
		 document.getElementById('question505').value= setVal;
	});
	//var queslen = question52.length;
	function onlyOne(){
		  for(var i = 1; i < 5; i++){
			  document.getElementById("question52"+i).checked = false;
		    }
		    this.checked = true;
		  }
	function updateTextValue(){
		 var value=$('input[name=question27]:checked').val();
		 var setVal;
		 if(value== 340){
			 setVal=506; 
		 }if(value== 341){
			 setVal=507; 
		 }if(value== 342){
			 setVal=508; 
		 }
		 if(value== 343){
			 setVal=509; 
		 }if(value== 344){
			 setVal=510; 
		 }if(value== 512){
			 setVal=513; 
		 }
		 document.getElementById('question505').value= setVal;
		
	}
	
	
	
var yes ="Yes"
$(function() {

	
	
	
	$('input[name^="question51"][type=radio]:checked').each(function( index ) {
		if ($(this).val() == yes) {
			var id = $(this).attr("name");
			$("[id^='" + id  +"_BP2']").removeClass('mh_hide');
		}
	});
	
	
	$("input[name=question51]").change(function () {
		if ($(this).val() == yes) {	
			$("[id^='question51_BP2']").removeClass('mh_hide');			
		} else {
			$("[id^='question51_BP2']").addClass('mh_hide');
			$('input[name=question52]').attr('checked', false);
							
		}
			
		
	});	

	
	$('#form').submit(function(event){
		 var valid = true;
		 var q51 = $("input[name=question51]:checked").val();
 
		 if (q51 == yes && !validateCheckBox('question52')) {
			 valid = false;
			 $("input[name=question52]").focus();
		 }
			 
		 if(valid) {				
			 return true;
		 } else {			
			 event.preventDefault();
			 return false;	 
		 }
	
	});
	
	function validateCheckBox(name) {
	
		if ($("input[name="+ name+ "]").is(':checked')) {
				$("#"+ name +"_error").addClass('mh_hide');	
			return true;
		} else {
				$("#"+ name +"_error").removeClass('mh_hide');
			return false;
		}
	
	}
	
});


</script>


</body>
</html>