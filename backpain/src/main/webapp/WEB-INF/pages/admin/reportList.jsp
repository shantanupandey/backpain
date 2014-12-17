<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- HEADER INCLUDE   -->
<jsp:include page="adminHeader.jsp" />
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
									<table width="727" border="0" cellpadding="0" cellspacing="0"
										class="tbl_Grid">
										<tr>
											<td height="25" align="left" valign="middle" class="tbl_red">
												<strong style="margin-left: 10px;">Report List</strong>
											</td>
										</tr>
										<tr>
											<td  style="height: 496px"  align="left" valign="top">
											
											 <br/>
                <table width="100%">
                    <tbody><tr>
                        <td>
                        <fieldset>
							<table>
								<tbody>
									<tr>
										<td width="100px"><b>Full Name :</b></td>
										<td><span>${client.foreName} ${client.surName}</span></td>
									</tr>
									<tr>
										<td><b>User Name :</b></td>
										<td><span>${client.userId}</span></td>
									</tr>
									<tr>
										<td><b>City :</b></td>
										<td><span>${client.city}</span></td>
									</tr>
								</tbody>
							</table>
						</fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="${contextPath}/admin/${client.clientId}/monitoringSystem.html">Monitoring System</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="${contextPath}/admin/${client.clientId}/disabilitySystem.html?userId=${client.userId}">Disability Form System</a>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <a href="${contextPath}/admin/${client.clientId}/assesSystem.html?userId=${client.userId}&fname=${client.foreName}&lname=${client.surName}">Assessment Report System</a>
                            
                        </td>
                    </tr>
                     <!-- <tr>
                        <td>
                            <a href="#">Assign Categories</a>
                        </td>
                    </tr> -->
                </tbody></table>
                <br/>
                <fieldset>
                    <table>
                        <tbody><tr>
                            <td colspan="1" class="style3">
                                1.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/nonRadScore.html">NON-SPECIFIC SYMPTOMS &amp; SIGNS</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                2.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/radSScore.html">TOTAL RADICULAR SYMPTOMS &amp; SIGNS</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                3.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/painAnalysisScore.html">PAIN ANALYSIS</a>
                            </td>
                        </tr>
                         <tr>
                            <td colspan="1" class="style3">
                                3.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/painHistory.html?redirect=no">PAIN HISTORY</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                4.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/selfExamScore.html">SELF-EXAMINATION RESULTS</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                5.
                            </td>
                            <td colspan="2">
                               <a href="${contextPath}/admin/${client.clientId}/painHistory.html?redirect=yes">HNP PHASES</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                6.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/cancerScore.html">CANCER</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                7.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/ccsScore.html">CCS</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="style3">
                                8.
                            </td>
                            <td colspan="2">
                                <a href="${contextPath}/admin/${client.clientId}/finalReport.html">ASSESSMENT REPORT</a>
                            </td>
                        </tr>
                    </tbody></table>
                </fieldset>
											
											
											
											
											</td>
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
	</table>

</body>
</html>