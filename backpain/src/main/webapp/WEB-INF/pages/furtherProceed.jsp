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
          <td style="padding-left: 10px;height: 429px;">
        
        <p><center><a href="${pageContext.request.contextPath}/extensionReport.html">Click here to go to next page</a></center></p>
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