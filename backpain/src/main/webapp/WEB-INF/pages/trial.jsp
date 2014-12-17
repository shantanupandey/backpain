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



<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
     	 <jsp:include page="banner.jsp" />
        <tr>
            <td align="center" valign="top">
                <table width="980" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="727" align="center" valign="top">
                            <div id="TabbedPanels1" class="TabbedPanels">
                                <ul class="TabbedPanelsTabGroup">
                                    <li class="TabbedPanelsTab">${project.projectName}</li>
                                    <li class="TabbedPanelsTab"><a href="home.html">CALBA Home</a></li>
                                </ul>
                                <div class="TabbedPanelsContentGroup">
                                    <div class="TabbedPanelsContent">
                                        <table width="720" height="430" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="720" align="left" valign="top">
                                                    <div align="justify">
                                                        <br />
                                                        <table width="720" height="430" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="center">
                                                                    <br />
                                                                    <b style="text-align: center;">TRIAL of YOGA THERAPY for Low Bak Pain: </b>
                                                                    <br />
                                                                    <b style="text-align: center;">Initial Assesment </b>
                                                                    <br />
                                                                    <b style="text-align: center;">(${project.projectName}, <fmt:formatDate pattern="MMMM yyyy" value="${project.projectStartDate}"/>)</b><br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="720" valign="top" align="left">
                                                                    <div style="padding-left: 20px;">
                                                                       ${project.projectDesc}
                                                                        <br />
                                                                        <br />
                                                                        If you want to join the trial and be assessed for herniated disc, click below:
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                
															<form:form method="post" id="projectForm"
																action="${pageContext.request.contextPath}/trialRegister.html"
																commandName="form">
                                                                    <a href="javascript:;" id="formLink"><b>[I agree to the above terms and wish to apply for
                                                                        acceptance on the trial] </b>.</a>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                           		<input type="hidden"  name="projectId"  id="projectId"  value="${project.projectId}" />        
                                                           </form:form>         
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>                                   
                                </div>
                            </div>
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td width="238" align="right" valign="top">
                            <jsp:include page="contactUs.jsp" />       
                          
                            <img src="images/spacer.gif" width="1" height="5" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <jsp:include page="footer.jsp" />
    </table>	
<script>

$(function(){
	$('#formLink').click(function() {
		$('#projectForm').submit();
	});
});

</script>
		
		
</body>
</html>