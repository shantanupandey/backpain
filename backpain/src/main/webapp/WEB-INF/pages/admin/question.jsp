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

	<form:form method="post" action="${contextPath}/admin/question.html"
		commandName="form">

		<form:hidden path="questionId" />
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
														class="tbl_red"><strong style="margin-left: 10px;">About
															you</strong></td>
												</tr>
												<tr>
													<td colspan="2"><br /></td>
												</tr>
												<c:if test="${not empty message}">
													<tr>
														<td height="25" colspan="2" style="font-family: Calibri;">
															<div style="color: #4F8A10; font-weight: bold;">
																${message}</div>
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
													<td colspan="1" style="width: 123px">Question Text</td>
													<td><form:input path="questionText"
															cssStyle="width:300px;" /> <form:errors
															path="questionText" cssClass="errors" /></td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<%-- <tr>
													<td colspan="1" style="width: 123px">Minimum Score</td>
													<td><form:input path="minScore" cssStyle="width:148px;" />
													 <form:errors path="minScore"  cssClass="errors"/>
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													</td>
												</tr> --%>

												<tr>
													<td colspan="1" style="width: 123px">Score</td>
													<td><form:input path="maxScore"
															cssStyle="width:148px;" /> <form:errors path="maxScore"
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
													<td colspan="2"><br /></td>
												</tr>

												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														<input type="submit" name="submit" value="Update Question" />

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


	$('#minScore').keyup(function () { 
 	    this.value = this.value.replace(/[^0-9]/g,'');
  	});
  
   $('#maxScore').keyup(function () { 
		    this.value = this.value.replace(/[^0-9]/g,'');
   });
	
	$('#form').submit(function(event){
		 var valid = true;

		 var maxScore = $('#maxScore').val();
		 var minScore = $('#minScore').val();
		 		
		
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