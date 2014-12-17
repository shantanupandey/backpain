<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="header.jsp" />
<body>

	<form:form method="post"
		action="${pageContext.request.contextPath}/weeklyUpdate.html"
		commandName="form">
		<form:hidden path="clientFormId" />


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

									<td width="238" align="left" valign="top"><jsp:include
											page="left.jsp" /></td>


									<td width="15">&nbsp;</td>
									<td width="727" align="left" valign="top">


										<table width="727px" border="0" cellpadding="3"
											cellspacing="0" class="tbl_Grid">
											<tbody>
												<tr>
													<td height="25" colspan="2" align="left" valign="middle"
														class="tbl_red"><strong style="margin-left: 10px;">Weekly
															Monitoring System</strong></td>
												</tr>
												<tr>
													<td class="wu_style1"><br /></td>
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


												<input type="hidden" name="setFlag" id="setFlag"
													value="${setFormVal}" />


												<input type="hidden" name="formVal" id="formVal"
													value="${setFormVal}" />

												<jsp:include page="formExtraQuestion.jsp" />

												<!-- Weekly Monitoring Form -->

												<jsp:include page="weeklyMonitoringSystem.jsp" />

												<!-- end Weekly Monitoring Form -->


												<!-- Weekly Fortnightly Form -->

												<jsp:include page="fortNightlyMonitoringSystem.jsp" />


												<!-- end Fortnightly Monitoring Form -->



												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														<c:if test="${setFlagWeekly  == 1}">
															<input type="submit" name="submit" value="Update Details"
																disabled="disabled" />
															<a href="#"> </a>
														</c:if> <c:if test="${setFlagWeekly  == 0}">
															<input type="submit" name="submit" value="Update Details" />
														</c:if> <br />

													</td>
												</tr>
												<tr>
													<td class="wu_style1"><label> &nbsp;</label></td>
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

	$(document).ready(function() {
		

		var q467 = $('input:radio[name=question467]:checked').val();
		
	    
		if(q467==1){
			
			$('#question_id_439').removeClass('mh_hide');
		}
		if(q467==2||q467==""){
			
			$('#question_id_439').addClass('mh_hide');
			
		}

	var q470 = $('input:radio[name=question470]:checked').val();
		

	    
		if(q470==1){
			
			$('#question_id_440').removeClass('mh_hide');
		}
		if(q470==2||q470==""){
			
			$('#question_id_440').addClass('mh_hide');
			
		}


		var q474 = $('input:radio[name=question474]:checked').val();
		
		if(q474==1){
			
			$('#question_id_441').removeClass('mh_hide');
		}
		
	    if(q474=="" ||q474==2){
			
			$('#question_id_441').addClass('mh_hide');
		}

	var q444 = $('input:radio[name=question444]:checked').val();
		
		if(q444==1){
			
			$('#yogaTime').removeClass('mh_hide');
		}
		
	    if(q444==""||q444==2){
			
			$('#yogaTime').addClass('mh_hide');
		}
		
	var q476 = $('input:radio[name=question476]:checked').val();
		

	    
		if(q476==1){
			
			$('#question_id_449').removeClass('mh_hide');
		}
		if(q476==2||q476==""){
			
			$('#question_id_449').addClass('mh_hide');
			
		}

	var q479 = $('input:radio[name=question479]:checked').val();
		
	    
		if(q479==1){
			
			$('#question_id_450').removeClass('mh_hide');
		}
		if(q479==2||q479==""){
			
			$('#question_id_450').addClass('mh_hide');
			
		}


		var q482 = $('input:radio[name=question482]:checked').val();
		
		if(q482==1){
			
			$('#question_id_451').removeClass('mh_hide');
		}
		
	    if(q482==""||q482==2){
			
			$('#question_id_451').addClass('mh_hide');
		}


		var q455 = $('input:radio[name=question455]:checked').val();
		
		
		if(q455==1){
			
			$('#yogaTimeWeekly').removeClass('mh_hide');
			$('#yogaSessionWeekly').removeClass('mh_hide');
			
		}
		
	    if(q455==""||q455==2){
			
			$('#yogaTimeWeekly').addClass('mh_hide');
			$('#yogaSessionWeekly').addClass('mh_hide');
		}


		var q484 = $('input:radio[name=question484]:checked').val();
		

	   
		if(q484==1){
			
			$('#question_id_458').removeClass('mh_hide');
		}
		
	    if(q484==2 || q484==""){
			
			$('#question_id_458').addClass('mh_hide');
		}

	var q487 = $('input:radio[name=question487]:checked').val();
		

	    
		if(q487==1){
			
			$('#question_id_459').removeClass('mh_hide');
		}
		if(q487==2||q487==""){
			
			$('#question_id_459').addClass('mh_hide');
			
		}
	 
	var q490 = $('input:radio[name=question490]:checked').val();
		
		if(q490==1){
			
			$('#question_id_460').removeClass('mh_hide');
		}
		
	    if(q490==""||q490==2){
			
			$('#question_id_460').addClass('mh_hide');
		}


	var q464 = $('input:radio[name=question464]:checked').val();
		
		if(q464==1){
			
			$('#yogaTimeFortnighly').removeClass('mh_hide');
		}
		
	    if(q464==""||q464==2){
			
			$('#yogaTimeFortnighly').addClass('mh_hide');
		}
	    
	    

		var newLegQuestion = $("#question443").val();
		if(newLegQuestion== 1){
			$('#subLegQuestion').removeClass('mh_hide');
			$('#subLegQuestion_answer').removeClass('mh_hide');
		}

		var newLegQuestion = $("#question448").val();
		if(newLegQuestion== 1){
			$('#subLegQuestion').removeClass('mh_hide');
			$('#subLegQuestion_answer').removeClass('mh_hide');
		}
		
	

		var newLegQuestion = $("#question457").val();
		if(newLegQuestion== 1){
			$('#subLegQuestion').removeClass('mh_hide');
			$('#subLegQuestion_answer').removeClass('mh_hide');
		}

		
	});
    
    function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : evt.keyCode;
       if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
          return false;

       return true;
    }

  function showQuestion(){
	
	var q467 = $('input:radio[name=question467]:checked').val();
	
    
	if(q467==1){
		
		$('#question_id_439').removeClass('mh_hide');
	}
	if(q467==2||q467==""){
		
		$('#question_id_439').addClass('mh_hide');
		
	}
 
 
}

  function newLegQuestion1(){
		
		
		var newLegQuestion = $("#question443").val();
		if(newLegQuestion== 1){
			$('#subLegQuestion').removeClass('mh_hide');
			$('#subLegQuestion_answer').removeClass('mh_hide');
		}else{
			$('#subLegQuestion').addClass('mh_hide');
			$('#subLegQuestion_answer').addClass('mh_hide');
		}
		
	}


  function newLegQuestion2(){
		
		
		var newLegQuestion = $("#question448").val();
		if(newLegQuestion== 1){
			$('#subLegQuestion').removeClass('mh_hide');
			$('#subLegQuestion_answer').removeClass('mh_hide');
		}else{
			$('#subLegQuestion').addClass('mh_hide');
			$('#subLegQuestion_answer').addClass('mh_hide');
		}
		
	}

function newLegQuestion3(){
	
	
	var newLegQuestion = $("#question457").val();
	if(newLegQuestion== 1){
		$('#subLegQuestion').removeClass('mh_hide');
		$('#subLegQuestion_answer').removeClass('mh_hide');
	}else{
		$('#subLegQuestion').addClass('mh_hide');
		$('#subLegQuestion_answer').addClass('mh_hide');
	}
	
}

function showQuestion1(){
	
	var q470 = $('input:radio[name=question470]:checked').val();
	

    
	if(q470==1){
		
		$('#question_id_440').removeClass('mh_hide');
	}
	if(q470==2||q470==""){
		
		$('#question_id_440').addClass('mh_hide');
		
	}
  
 
}


function showQuestion2(){
	
	var q474 = $('input:radio[name=question474]:checked').val();
	
	if(q474==1){
		
		$('#question_id_441').removeClass('mh_hide');
	}
	
    if(q474=="" ||q474==2){
		
		$('#question_id_441').addClass('mh_hide');
	}
	
}

function showQuestion3(){
	
	var q444 = $('input:radio[name=question444]:checked').val();
	
	if(q444==1){
		
		$('#yogaTime').removeClass('mh_hide');
	}
	
    if(q444==""||q444==2){
		
		$('#yogaTime').addClass('mh_hide');
	}
	
}






function weekQuestion(){
	
	var q476 = $('input:radio[name=question476]:checked').val();
	

    
	if(q476==1){
		
		$('#question_id_449').removeClass('mh_hide');
	}
	if(q476==2||q476==""){
		
		$('#question_id_449').addClass('mh_hide');
		
	}
   
 
}


function weekQuestion1(){
	
	var q479 = $('input:radio[name=question479]:checked').val();
	
    
	if(q479==1){
		
		$('#question_id_450').removeClass('mh_hide');
	}
	if(q479==2||q479==""){
		
		$('#question_id_450').addClass('mh_hide');
		
	}
  
 
}


function weekQuestion2(){
	
	var q482 = $('input:radio[name=question482]:checked').val();
	
	if(q482==1){
		
		$('#question_id_451').removeClass('mh_hide');
	}
	
    if(q482==""||q482==2){
		
		$('#question_id_451').addClass('mh_hide');
	}
	
}

function weekQuestion3(){
	
	var q455 = $('input:radio[name=question455]:checked').val();
	
	
	if(q455==1){
		
		$('#yogaTimeWeekly').removeClass('mh_hide');
		$('#yogaSessionWeekly').removeClass('mh_hide');
	}
	
    if(q455==""||q455==2){
		
		$('#yogaTimeWeekly').addClass('mh_hide');
		$('#yogaSessionWeekly').addClass('mh_hide');
	}
	
}



function fortNightQuestion(){
	
	
	var q484 = $('input:radio[name=question484]:checked').val();
	

   
	if(q484==1){
		
		$('#question_id_458').removeClass('mh_hide');
	}
	
    if(q484==2 || q484==""){
		
		$('#question_id_458').addClass('mh_hide');
	}
	
 
}


function fortNightQuestion1(){
	
	var q487 = $('input:radio[name=question487]:checked').val();
	

    
	if(q487==1){
		
		$('#question_id_459').removeClass('mh_hide');
	}
	if(q487==2||q487==""){
		
		$('#question_id_459').addClass('mh_hide');
		
	}
 
}


function fortNightQuestion2(){
	
	var q490 = $('input:radio[name=question490]:checked').val();
	
	if(q490==1){
		
		$('#question_id_460').removeClass('mh_hide');
	}
	
    if(q490==""||q490==2){
		
		$('#question_id_460').addClass('mh_hide');
	}
	
}

function fortNightQuestion3(){
	
	var q464 = $('input:radio[name=question464]:checked').val();
	
	if(q464==1){
		
		$('#yogaTimeFortnighly').removeClass('mh_hide');
	}
	
    if(q464==""||q464==2){
		
		$('#yogaTimeFortnighly').addClass('mh_hide');
	}
	
}

$(function() {
	
	
	
	$('input[name^="question"][type=radio]:checked').each(function( index ) {
		var id = $(this).attr("name");		
		if (id == "question84" || id == "question96") {
			if ($(this).val() == yes) {
				var id = $(this).attr("name");
				$("[id^='" + id  +"_WU']").removeClass('mh_hide');
			}
		}		
	});

	$('input:checkbox[name="question87"]').click(function(){
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
	

	$("input[name=question84]").change(function () {
		if ($(this).val() == yes) {			
			$("[id^='question84_WU']").removeClass('mh_hide');			
		} else {
			$("[id^='question84_WU']").addClass('mh_hide');
			$("textarea[name=question125]").val('');	
			$('#question125_error').addClass('mh_hide');
		}s
		
	});

	$("input[name=question96]").change(function () {
		if ($(this).val() == yes) {		
			$("[id^='question96_WU']").removeClass('mh_hide');
		} else {
			$("[id^='question96_WU']").addClass('mh_hide');
			$("textarea[name=question126]").val('');
			$('#question126_error').addClass('mh_hide');
			
		}
	});
	
	
	
	$('#form').submit(function(event){
		
		 var valid = true;
		 
		 var setVal= $("#formVal").val();
			
		
		 var q84 = $("input[name=question84]:checked").val();
		 var q96 = $("input[name=question96]:checked").val();
		 var q125 = $("textarea[name=question125]").val();
		 var q126 = $("textarea[name=question126]").val();
		 
		 var q439 = $( "#question439" ).val();
		 var q440 = $( "#question440" ).val();
		 var q441 = $( "#question441" ).val();
		 var q442 = $( "#question442" ).val();
		 var q446 = $( "#question446" ).val();
		 var q443 = $( "#question443" ).val();
		 var q444 = $( "#question444" ).val();
		 var q445 = $( "#question445").val();
		 var q447 = $( "#question447" ).val();
		 var q491 = $( "#question491" ).val();
		 
		 var q448 = $( "#question448" ).val();
		 var q449 = $( "#question449" ).val();
		 var q450 = $( "#question450" ).val();
		 var q451 = $( "#question451" ).val();
		 var q452 = $( "#question452" ).val();
		 var q453 = $( "#question453" ).val();
		 var q454 = $( "#question454" ).val();
		 var q455 = $( "#question455").val();
		 var q456 = $( "#question456" ).val();
		 var q492 = $( "#question492" ).val();
		 
		 var q457 = $( "#question457" ).val();
		 var q458 = $( "#question458" ).val();
		 var q459 = $( "#question459" ).val();
		 var q460 = $( "#question460" ).val();
		 var q461 = $( "#question461" ).val();
		 var q462 = $( "#question462" ).val();
		 var q463 = $( "#question463" ).val();
		 var q464 = $( "#question464").val();
		 var q465 = $( "#question465" ).val();
		 
		 var q466 = $( "#question466" ).val();
		 var q467 = $( "#question467" ).val();
		 var q468 = $( "#question468" ).val();
		 var q469 = $( "#question469" ).val();
		 var q470 = $( "#question470" ).val();
		 var q472 = $( "#question472" ).val();
		 var q473 = $( "#question473" ).val();
		 var q474 = $( "#question474" ).val();
		 
		 var q475 = $( "#question475" ).val();
		 var q476 = $( "#question476" ).val();
		 var q477 = $( "#question477" ).val();
		 var q478 = $( "#question478" ).val();
		 var q479 = $( "#question479" ).val();
		 var q480 = $( "#question480" ).val();
		 var q481 = $( "#question481" ).val();
		 var q482 = $( "#question482" ).val();
		 
		 var q483 = $( "#question483" ).val();
		 var q484 = $( "#question484" ).val();
		 var q485 = $( "#question485" ).val();
		 var q486 = $( "#question486" ).val();
		 var q487 = $( "#question487" ).val();
		 var q488 = $( "#question488" ).val();
		 var q489 = $( "#question489" ).val();
		 var q490 = $( "#question490" ).val();
		 var q493 = $( "#question493" ).val();
		 
		
		 
		 
		 q125 = $.trim(q125);
		 q126 = $.trim(q126);
		 
		 if (q84 == yes) {
			 if(q125 == "") {
				 valid = false;
				 $("input[name=question84]").focus();
				 $('#question125_error').removeClass('mh_hide');	
			 } else {
				 $('#question125_error').addClass('mh_hide');
			 }
		 }
		 
		 if (q96 == yes) {
			 if(q125 == "") {
				if(valid) {
				 	$("input[name=question96]").focus();
				 	 valid = false;
				}
				$('#question126_error').removeClass('mh_hide');		
			 } else {
				$('#question126_error').addClass('mh_hide');	
			 }
		 }
		 
		 if(valid) {			
			 return true;
		 } else {			 
			 event.preventDefault();
			 return true;	 
		 }
	
	});

	
});


</script>

</body>
</html>