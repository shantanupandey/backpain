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

	<form:form method="post"
		action="${contextPath}/admin/hnpLookupValue.html" commandName="form">

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



										<table width="727"
											style="border-style: solid; background-color: Transparent;"
											cellpadding="3" cellspacing="0" class="tbl_Grid">
											<tbody>
												<tr>
													<td height="25" colspan="2" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;">HNP
															LOOKUP VALUES</strong></td>
												</tr>

												<tr>
													<td colspan="2"><br /></td>
												</tr>

												<input type="hidden" id="id" name="id" value="${form[0].id}" />

												<tr>
													<td colspan="1" style="width: 123px">Acute</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="acute" name="acute"
														value="${form[0].acute}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Early</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="early" name="early"
														value="${form[0].early}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Early Mid</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="early_mid" name="early_mid"
														value="${form[0].early_mid}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Late Mid</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="late_mid" name="late_mid"
														value="${form[0].late_mid}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Late</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="late" name="late" value="${form[0].late}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Recovered</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="recovered" name="recovered"
														value="${form[0].recovered}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Chronic</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="Chronic" name="Chronic"
														value="${form[0].chronic}" /></td>

												</tr>

												<tr>
													<td colspan="1" style="width: 123px">Consult Doctor</td>
													<td colspan="1" style="width: 123px"><input
														type="text" id="Consult" name="Consult"
														value="${form[0].consultme}" /></td>

												</tr>



												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														<input type="submit" name="submit" value="Update Record" />

														<br />

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

				<jsp:include page="adminFooter.jsp" />
			</tbody>
		</table>
	</form:form>

	<script>
$(function() {	


	$('#acute').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
	

	$('#early').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
	

	$('#early_mid').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
	

	$('#late_mid').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
	

	$('#late').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
	

	$('#recovered').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});

	$('#Chronic').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
	
	$('#Consult').keyup(function () { 
 	    this.value = this.value.replace(/[^.0-9]/g,'');
  	});
  
   
	
	$('#form').submit(function(event){
		 var valid = true;

		 var acute = $('#acute').val();
		 var early = $('#early').val();
		 
		 var early_mid = $('#early_mid').val();
		 var late_mid = $('#late_mid').val();
		 
		 var late = $('#late').val();
		 var recovered = $('#recovered').val();
		 
		 var Chronic = $('#Chronic').val();
		 var Consult = $('#Consult').val();
		 
		 var code= $('#code').val(); 
		 		
		if(acute==''){
			alert("Please insert the Acute data");
			valid= false;
		}
		
		if(early==''){
			alert("Please insert the Early data");
			valid= false;
		}
		
		if(early_mid==''){
			alert("Please insert the Early Mid data");
			valid= false;
		}
		
		if(late_mid==''){
			alert("Please insert the Late Mid data");
			valid= false;
		}
		
		if(late==''){
			alert("Please insert the Late data");
			valid= false;
		}
		
		if(recovered==''){
			alert("Please insert the Recovered data");
			valid= false;
		}
		
		if(Chronic==''){
			alert("Please insert the Chronic data");
			valid= false;
		}
		
		if(Consult==''){
			alert("Please insert the Consult Doctor data");
			valid= false;
		}
		
		
		
		 if(valid) {			
			 return true;
		 } else {			
			 event.preventDefault();
			 return false;	 
		 }
	
		 
	});



});


</script>
</body>
</html>