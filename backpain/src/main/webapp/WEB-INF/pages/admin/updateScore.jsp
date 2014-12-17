<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="UpdateScoreHeader.jsp" />
 
<body>

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
									<table width="727" border="0" cellpadding="0" cellspacing="0" class="tbl_Grid">
										<tr>
											<td height="25" align="left" valign="middle" class="tbl_red">
												 <strong style="margin-left: 10px;">User List</strong>
											</td>
										</tr>
										<table>
										<tr>
										
											<!-- Write content here -->
											
											<%-- <select id="date" name="date"> 
											  <c:forEach items="${result.result}" var="client" varStatus="counter">
											  <option value="<fmt:formatDate type="date" value="${client.createdDate}"/>"><fmt:formatDate type="date" value="${client.createdDate}"/></option>
										      </c:forEach>
											</select> --%>
											
											<input type="text" name="myDate" id="myDate" readonly="readonly" class="text-box"/>
											<input type="button" value="select Date" onclick="pickDate()"/>
											
											
											<div id="userList"></div>
											
											
											<div id="message" style="display:none"><font color="red" size="3px">Updated Successfully.</font></div>
											
											
											
											
											<!--End write content here  -->
											
											
											
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table></table>

</body>
</html>