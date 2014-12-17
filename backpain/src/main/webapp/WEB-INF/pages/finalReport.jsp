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
	<script>
		function printDiv(divName) {
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			window.print();

			document.body.innerHTML = originalContents;
		}
	</script>

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

									<table width="727" border="0" cellpadding="0" cellspacing="0"
										class="tbl_Grid">
										<tbody>
											<tr>
												<td height="25" align="left" valign="middle" class="tbl_red">
													<strong style="margin-left: 10px;">Assessment Report</strong>

												</td>
											</tr>
											<tr>
												<td align="left" valign="top" class="tbl_fff4d1"></td>
											</tr>

											<%-- <tr>
												<!-- New Strucutre For Radicular & Non Radicular table -->
												<tr>
													<%@ include file="clientCalculation.jsp"%>
												</tr>
												<!-- End New Strucutre For Radicular & Non Radicular table-->
												<td>
													<div id="printableArea">
														<table cellspacing="0" cellpadding="4" rules="rows"
															border="1"
															style="color: #333333; height: 95px; width: 725px; border-collapse: collapse;">

															<tr
																style="color: White; background-color: #990000; font-weight: bold;">

																<th scope="col" style="border: 1px solid black">Type
																	of Condition</th>
																<th scope="col" style="border: 1px solid black;">Type
																	of Condition</th>
																<th scope="col" style="border: 1px solid black;">Likelihood
																	on scale of 1 to 10 (1= very unlikely, 10= very likely)</th>
															</tr>
															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Acute</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="AcuteFinal"></div></td>
															</tr>


															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Early
																	stage of recovery</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="EarlyFinal"></div></td>
															</tr>

															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Early
																	Mid-stage of recovery</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="EarlyMidFinal"></div></td>
															</tr>

															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Late
																	Mid-stage of recovery</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="LateMidFinal"></div></td>
															</tr>

															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Late
																	stage of recovery</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="LateFinal"></div></td>
															</tr>

															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Recovered</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="RecoveredFinal"></div></td>
															</tr>

															<tr style="background-color: #FFFBD6;">
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Herniated
																	disc</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black">Chronic</td>
																<td
																	style="width: 50px; height: 40px; border: 1px solid black"><div
																		id="ChronicFinal"></div></td>
															</tr>
															
															<tr style="background-color: #FFFBD6;">
																<td style="width: 50px; height: 40px; border: 1px solid black">Please check your comments</td>
															
																<td colspan="2" style="width: 50px; height: 40px; border: 1px solid black">${careComment}</td>
															</tr>
															
															
														</table>
														
													</div> &nbsp; <input type="button"
													onclick="printDiv('printableArea')" value="Print Report"
													align="middle" style="margin-left: 311px;" />
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
												</td>

											</tr> --%>
											<td colspan="2" align="left" style="width: 86px;" bgcolor="#fff4d1"><b><p align="center">ASSESSMENT REPORT FOR &nbsp<upper>${fname}&nbsp;${lname}</upper></p></b>
											<p>${comment1}</P>
											
											<p><b><center>Precautions</center></b></p>
											<P>${comment2}</p>
											
											<p><b><center>Exercises</center></b></p>
											<p>${comment3}</p>
											
											<p><b><center>Tracking</center></b></p>
											<p>${comment4}</p>
											
											
											<p><b><center>CALBA</center></b></p>
											<p>We hope that this assessment, and advice on what to do, is useful to you.  Only CALBA provides this service.<br>CALBA is based on many years of clinical experience and research, and has been created largely by voluntary work without external funding. The continuation and further development of this service are dependent upon donations. We invite you to help support this work. </p>
											<br>
											<!-- <p>With best wishes</p> -->
											
											<%-- <p><center>The CALBA Team</center> --%>
											</p>
											
											<%-- <p>Email: ${comment5}</p>
											<a href="www.CALBA.net">www.CALBA.net</a></td> --%>
											<p><center><a href="${pageContext.request.contextPath}/donation.html">Click here to make a Donation</a></center></p>
											<p>If you prefer not to make a donation just now, then: </p>
											<p><center><a href="${pageContext.request.contextPath}/furtherProceed.html">Click here to skip Donations page</a></center></p>											
											</td>
											
											
										</tbody>
									</table> <span id="ctl00_labelFreeMessage"></span>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<jsp:include page="footer.jsp" />
		</tbody>
	</table>

</body>
</html>