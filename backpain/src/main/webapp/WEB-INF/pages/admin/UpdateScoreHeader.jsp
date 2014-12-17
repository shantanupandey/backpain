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
	
	
	<script type="text/javascript">
	
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
		
		var temp =jQuery.ajax(
				{
					url :"assignFormValues.html?userId="+user+"&formSet="+formset,
					dataType: "text",
					success: function(data){
						message.style.display="";
	  				    setTimeout("jQuery('#message').hide();Modalbox.resizeToContent();",1000)
					
					}
				}).responseText;
		
	}

	window.addEventListener('load', function () {
	    var rotates = document.getElementsByClassName('rotate');
	    for (var i = 0; i < rotates.length; i++) {
	        rotates[i].style.height = rotates[i].offsetWidth + 'px';
	    }
	});
    </script>
	<script src="${contextPath}/js/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="${contextPath}/js/jquery.treeview.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${contextPath}/css/jquery-ui.css" />
    <script src="${contextPath}/js/jquery-ui-1.9.0.min.js"></script>
    <style>
      
      

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

	</style>
</head>
