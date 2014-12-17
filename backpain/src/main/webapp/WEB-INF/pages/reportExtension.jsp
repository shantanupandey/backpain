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

									
											<td colspan="2" align="left" style="width: 86px;" bgcolor="#fff4d1"><b><p align="center">Monitoring System</upper></p></b>
											<p>CALBA includes a system for monitoring changes in low back pain and sciatica.  This could help  in the management of your condition.</P>
											<p>A herniated disc takes many months to heal.   During healing, the condition gradually becomes more robust; but even in the later stages, when there is little or no pain, the condition is more vulnerable than normal and can undergo relapse if challenged too strongly.  This may lead to recurring episodes.   As healing progresses you can reduce the precautions and increase the exercises but should do the opposite at times of worsening.</P>
											<p>Keeping a record of your back condition helps detect such changes, and respond appropriately.   It also facilitates reviewing past changes and judging whether the therapeutic treatments you’ve tried have been effective.</p>
											<p>We provide a weekly report with the monitoring, which assesses the progress of your condition and advises you on what to do when changes take place.</p>
											<p>In the early stages of recovery from herniated disc the condition is particularly vulnerable and liable to sudden changes, so we recommend daily record-keeping.  In the later stages the condition is relatively stable, so we recommend weekly monitoring.  CALBA offers both these options.  We recommend that you start with daily monitoring for two weeks, after which we advise you on whether or not to change to weekly monitoring.</p>
											<p>There is not a fixed charge for monitoring but after the first two weeks we provide the opportunity for you to donate towards the cost of this service and the funding of our research on low back pain and sciatica.</p>
											<p><b>To register for monitoring, <a href="${pageContext.request.contextPath}/assignMonitoringForm.html"> Click here</a></b></p>
											
											<p><b><center>Precautions</center></b></p>
											<P>[To follow]</p>
											
											<p><b><center>Therapeutic exercises</center></b></p>
											<p>[To follow]</p>
											
											<p><b><center>Research</center></b></p>
											<p>[To follow]</p>
											
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