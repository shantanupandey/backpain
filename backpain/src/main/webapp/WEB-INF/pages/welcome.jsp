<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- HEADER INCLUDE   -->
	<jsp:include page="header.jsp" />
<body>  

    <table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
        <tbody>
        
        <jsp:include page="banner.jsp" />
        
        <jsp:include page="userInfo.jsp" />
        
         <tr>
            <td align="center" valign="top">
                <table width="980" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                         <td width="238" align="left" valign="top">                            
                               <jsp:include page="left.jsp" />                           
                        </td>
                        <td width="15">
                            &nbsp;
                        </td>
                        <td width="727" align="left" valign="top">

    <table width="727" border="0" cellpadding="0" cellspacing="0" class="tbl_Grid">
        <tbody><tr>
            <td height="25" align="left" valign="middle" class="tbl_red">
                <strong style="margin-left: 10px;">Welcome to Yoga Biomedical Trust - CALBA</strong>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" class="tbl_fff4d1">
            </td>
        </tr>
        <tr>
          <td style="padding-left: 10px;">
        <c:choose>
        
        	
        	<c:when test="${loggedClient.clientStateId  == 4 && loginVal eq 'login'}">
        	
        	<c:if test="${AssesmentFlag  == 1}">
        	<p><h3 align="center">LOW BACK PAIN REPORT</h3></p>

			<p>Your Assessment Report is now ready.   You can view it any time by Clicking on ‘Assessment Report’ in the left hand panel.</p><br>
			<p><b>To exit, click “Sign out” at the top right hand corner of the screen.</b></p> <br>
			
        	</c:if>
        	
        	<c:if test="${AssesmentFlag  ne 1}">
        	<p><h3 align="center">FORMS SUCCESSFULLY COMPLETED</h3></p>
										<p>Thank you for providing the data for your low back pain assessment.  CALBA will now process the data, and a Low Back Pain expert will carefully consider your case and prepare a report.   When the Report is ready, we will notify you by email.  This may take one or two working days.</p>

										<p>You can view your completed forms by clicking on the headings in the left hand panel.   If you should want to change any of the answers, please notify us by email or telephone.</p><br>
										
										<p><b>To exit, click “Sign out” at the top right hand corner of the screen.</b></p> <br>
			</br></br>
			</c:if>
			
			</c:when>
        	<c:otherwise>
          
                <br>
                <br>
                <b>You now fill in six simple forms.</b> The titles of the forms are listed on the left hand panel.<b> To reach a form, click on the title.</b>
                <br>
                <br>
                <br>
<b>When you have completed a form, click on the Submit/Update button at the bottom of the form to save it.</b> You will then be taken to the top of the page with a message that the form has been successfully completed, together with instructions on how to proceed. If there is missing data you will be asked to complete this before the form can be saved.                 <br>
                <br>
                <br>
                <b>You will need to answer all the questions</b> on the form you are working on before you can save it. If you are not sure about the answer to a question, put in the answer which fits most closely with your condition, even though it may not be exactly right. 
                <br>
                <br>
                <br>
              <b> It will take about 20 minutes</b> to complete all the forms. If you are interrupted, you can resume from where you left off by logging onto www.calba.net and entering your User ID and your password. 
                <br>
                <br>
                <br>
               When you have completed all six forms, a message will appear, saying that the forms have been successfully completed and that we will report to you within 2 working days. You can then click on Sign out (top right hand corner), to exit the website. 
                <br>
                <br>
                <br>
              If you have any questions or comments at this stage, please feel free to contact us at the following email address: support@calba.net
                <br>
                <br>
                <br>
            
            </c:otherwise>
            </c:choose>
            
            <c:if test="${setFlag  == 0}">
            <p><h3 align="center">KEEPING YOUR MONITORING DIARY</h3></p>
            <p><h3>Monitoring Form</h3></p>
            
										<p>To record your data for today, Click on ‘Monitoring Form’ in the left hand panel.  A form will appear in the right hand panel with a few simple questions.  When you have completed the form, there will be no form available until the next day, when CALBA will automatically re-issue the form early in the morning.   Try to get into the habit of completing the form at the same time each day.  This will take less than 5 minutes once you get used to it.</p>
			<p><h3>Monitoring Record and Report</h3></p>

										<p>To look back on data you provided in the past, click on ‘Monitoring Record’ in the left hand panel.  A record of your past entries will appear in the right hand panel.</p>
										
										<p>Once a week, a back pain specialist will review your record and prepare a report.  If there have been significant changes, the report will note these and make recommendations, when appropriate.  You access these reports by clicking on headings which appear in the Monitoring Record.</p>
			</br></br>
			</c:if>
            </td>
        </tr>
    </tbody></table>

                            <span id="ctl00_labelFreeMessage"></span>
                        </td>
                    </tr>
                </tbody></table>
            </td>
        </tr>
       
       <jsp:include page="footer.jsp" />
    </tbody></table>
 
</body></html>