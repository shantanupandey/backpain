<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="request" value="${pageContext.request.contextPath}" />
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="favicon.ico" rel="Shortcut Icon">
<title>
	Yoga Biomedical Trust - CALBA - Administrator Page
</title>
	<link href="${contextPath}/css/common.css" rel="stylesheet" type="text/css">
	<link href="${contextPath}/spryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/spryAssets/SpryTabbedPanels.js" type="text/javascript"></script>  
    
    <link rel="stylesheet" href="${contextPath}/jquery.treeview.css" />
    
    <link rel="stylesheet" href="${contextPath}/red-treeview.css" />

	<script src="${contextPath}/js/lib/jquery.js" type="text/javascript"></script>
	
	<script src="${contextPath}/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${contextPath}/js/jquery-freezeheader.js" type="text/javascript"></script>
	<script src="//cdn.ckeditor.com/4.4.6/standard/ckeditor.js"></script>
		<script src="//cdn.ckeditor.com/4.4.6/standard/config.js"></script>
	
	
	
	<script type="text/javascript">
	
	
	function printDiv(divName) {
		
		$("#print").removeClass('mh_hide');
		
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;

		document.body.innerHTML = printContents;

		window.print();

		document.body.innerHTML = originalContents;
		$("#print").addClass('mh_hide');
	}

	jQuery(function() {
		
		jQuery('#myDate').datepicker({
			
			maxDate: new Date(),
			dateFormat:"yy-MM-dd",
			changeMonth: true,
			changeYear: true,
			duration: '',  
        showTime: true,  
        constrainInput: false,  
        stepMinutes: 1,  
        stepHours: 1,  
        altTimeField: '',  
        time24h: false 
    
        
		});
		

	});
	
	function pickDate(){
		var val=document.getElementById('myDate').value;
		
		document.getElementById("userList").innerHTML = "";
		
		var temp =jQuery.ajax(
				{
					url :"getUser.html?selectedDate="+val,
					dataType: "text",
					success: function(data){						
						
						document.getElementById("userList").innerHTML = data;
					}
				}).responseText;
	}
	
	function dryRun(){
		
		var user=document.getElementById('user').value;
		
		//document.getElementById("message").value = "";
		
		var temp =jQuery.ajax(
				{
					url :"updateReport.html?userId="+user,
					dataType: "text",
					success: function(data){
						
						
						
						message.style.display="";
	  						setTimeout("jQuery('#message').hide();Modalbox.resizeToContent();",1000)
					
					}
				}).responseText;
		
	}
	
	function assignForm(){
		
		var user=document.getElementById('user').value;
		var formset=document.getElementById('set').value;
		
		
		//document.getElementById("message").value = "";
		document.getElementById("waitImage").style.display = "block";
		
		var temp =jQuery.ajax(
				{
					url :"assignFormValues.html?userId="+user+"&formSet="+formset,
					dataType: "text",
					success: function(data){
						document.getElementById("waitImage").style.display = "none";
						message.style.display="";
	  				    setTimeout("jQuery('#message').hide();Modalbox.resizeToContent();",1000)
					
					}
				}).responseText;
		
	}

function assignDisabilityForm(){		
		var user=document.getElementById('user').value;
		//document.getElementById("message").value = "";
		document.getElementById("waitImage").style.display = "block";
		
		var temp =jQuery.ajax(
				{
					url :"assignDisabilityFormValues.html?userId="+user,
					dataType: "text",
					success: function(data){
						document.getElementById("waitImage").style.display = "none";
						message.style.display="";
	  				    setTimeout("jQuery('#message').hide();Modalbox.resizeToContent();",1000)
					
					}
				}).responseText;
		
	}
	
	function checkPreview(){
		    var result;
			var comment1 = CKEDITOR.instances.comment1.getData();
			comment1 = comment1.replace("<p>","");
			comment1 = comment1.replace("</p>","");
			var comment2 = CKEDITOR.instances.comment2.getData();
			comment2 = comment2.replace("<p>","");
			comment2 = comment2.replace("</p>","");
			var comment3 = CKEDITOR.instances.comment3.getData();
			comment3 = comment3.replace("<p>","");
			comment3 = comment3.replace("</p>","");
			var comment4 = CKEDITOR.instances.comment4.getData();
			comment4 = comment4.replace("<p>","");
			comment4 = comment4.replace("</p>","");
			
			
			document.getElementById("hidecomment1").innerHTML = comment1;
			document.getElementById("hidecomment2").innerHTML = comment2;
			document.getElementById("hidecomment3").innerHTML = comment3;
			document.getElementById("hidecomment4").innerHTML = comment4;

			$("#printView").removeClass('mh_hide');
			$("#printView").addClass('tbl_Grid');
			$("#orignal").addClass('mh_hide');

		}
		function backOriginal() {
			$("#printView").addClass('mh_hide');
			$("#orignal").removeClass('mh_hide');

		}

		function assignAssessmentSystem() {
			var user = document.getElementById("user").value;
			/* var comments=document.getElementById("careComments").value; */
			var comment1 = CKEDITOR.instances.comment1.getData();
			comment1 = comment1.replace("<p>","");
			comment1 = comment1.replace("</p>","");
			var comment2 = CKEDITOR.instances.comment2.getData();
			comment2 = comment2.replace("<p>","");
			comment2 = comment2.replace("</p>","");
			var comment3 = CKEDITOR.instances.comment3.getData();
			comment3 = comment3.replace("<p>","");
			comment3 = comment3.replace("</p>","");
			var comment4 = CKEDITOR.instances.comment4.getData();
			comment4 = comment4.replace("<p>","");
			comment4 = comment4.replace("</p>","");
			var comment5 = "";

			
			document.getElementById("waitImage").style.display = "block";

			
			var temp = jQuery
					.ajax({
						type: "GET",
						url : "assignAssessmentFormValues.html",
						data:  {"userId":user,"comment1":comment1,"comment2":comment2,"comment3":comment3,"comment4":comment4,"comment5":comment5},
						dataType : "text",
						success : function(data) {
							document.getElementById("waitImage").style.display = "none";
							message.style.display = "";
							setTimeout(
									"jQuery('#message').hide();Modalbox.resizeToContent();",
									1000)

						}
					}).responseText;

		}

		window.addEventListener('load', function() {
			var rotates = document.getElementsByClassName('rotate');
			for ( var i = 0; i < rotates.length; i++) {
				rotates[i].style.height = rotates[i].offsetWidth + 'px';
			}
		});
	</script>
	<script src="${contextPath}/js/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="${contextPath}/js/jquery.treeview.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${contextPath}/css/jquery-ui.css" />
    <script src="${contextPath}/js/jquery-ui-1.9.0.min.js"></script>
    <style>
    
    upper {
      text-transform: uppercase;
     }
      
      

.rotate {
             filter:  progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083);  /* IE6,IE7 */
         -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083)"; /* IE8 */
     -moz-transform: rotate(-90.0deg);  /* FF3.5+ */
      -ms-transform: rotate(-90.0deg);  /* IE9+ */
       -o-transform: rotate(-90.0deg);  /* Opera 10.5 */
  -webkit-transform: rotate(-90.0deg);  /* Safari 3.1+, Chrome */
          transform: rotate(-90.0deg);  /* Standard */
}


.data-table, .data-table td, .data-table th {
    border-color: black;
    border-style: solid;
}

.data-table {
    border-width: 0 0 0px 0px;  
    border-spacing: 0;
    border-collapse: collapse; 
    margin: 0;
}

.data-table td, .data-table th {
    margin: 0px;
    padding: 6px;
    border-width: 1px;
    vertical-align: top;
}

.data-table th {
    background-color:#990000; 
}

 @media print
    {
        #printableArea
        {
            background:#fff4d1;
            border-color:#ffffff;
            border-style:none;
            width:183px;
            height:23px;
            padding:0px 4px 0px 4px;
            color:#0099F9;
            font-size:1.0em;
            font-family:Courier New;
        }
    }

	</style>
</head>
