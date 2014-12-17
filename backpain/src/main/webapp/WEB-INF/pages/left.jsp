<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table width="238" border="0" cellpadding="0" cellspacing="0"
	class="tbl_Grid">
	<tbody>
		<tr>
			<td height="25" align="left" valign="middle" class="tbl_red"><strong>&nbsp;
			<c:if test="${loggedClient.clientStateId  == 4 && loginVal eq 'Nologin'}">
			Data Capture
			</c:if>
			</strong></td>
		</tr>

		<tr>
			<td height="430" align="center" valign="top" class="tbl_fff4d1"><br>
				<table width="211" border="0" cellpadding="0" cellspacing="0"
					class="main_link">
					<tbody>
						<tr>
							<td height="20" align="left" valign="middle">&nbsp;</td>
							<td align="left" valign="middle">
								<ul id="browser" class="treeview-famfamfam">
									<c:if test="${loggedClient.clientStateId  == 4}">
										<li><span><a
												href="${pageContext.request.contextPath}/welcome.html">Home</a>
										</span></li>
										<li></li>
										<li><span><a
												href="${pageContext.request.contextPath}/aboutYou.html">1. About
													You <font color="green">(Completed)</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/medicalHistory.html">2. Medical
													History <font color="green">(Completed)</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/backPain.html">3. Back
													Pain(1) <font color="green">(Completed)</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/backPain2.html">4. Back
													Pain(2) <font color="green">(Completed)</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/selfExam.html">5. Self
													Examination <font color="green"> (Completed)</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/selfExamine.html">6. Disability
													<font color="green">(Completed)</font>
											</a></span></li>
									
										<c:if test="${AssesmentFlag  == 1}">	
										<li><span><a
												href="${pageContext.request.contextPath}/finalReport.html">Assessment
													Report</a></span></li>
										</c:if>
													
									
													
										<c:if test="${setFlag  == 0}">
											<li class="open"><span>Monitoring System</span>
												<ul style="background-color: #FFF4D1;">
													<li><span><a
															href="${pageContext.request.contextPath}/weeklyUpdate.html">Monitoring Form</a></span></li>
												</ul>
												<ul style="background-color: #FFF4D1;">
													<li><span><a
															href="${pageContext.request.contextPath}/monitoringReport.html">Monitoring Record and Report</a></span></li>
												</ul>
												
												</li>
												
										</c:if>
										<c:if test="${setFlagWeekly  == 1}">
											<li class="open"><span>Monitoring System</span>
												
												<ul style="background-color: #FFF4D1;">
													<li><span><a
															href="${pageContext.request.contextPath}/monitoringReport.html">Monitoring Record and Report</a></span></li>
												</ul>
												
												</li>
												
										</c:if>
										
										

									</c:if>

									<c:if test="${formStatusAboutYou eq 'Active'}">
										<c:set var="formStatusAboutYou" value=""></c:set>
									</c:if>

									<c:if test="${formStatusMedicalHistory eq 'Active'}">
										<c:set var="formStatusMedicalHistory" value=""></c:set>
									</c:if>

									<c:if test="${formStatusbackPain eq 'Active'}">
										<c:set var="formStatusbackPain" value=""></c:set>
									</c:if>

									<c:if test="${formStatusbackPain eq 'Active'}">
										<c:set var="formStatusbackPain" value=""></c:set>
									</c:if>

									<c:if test="${formStatusbackPain2 eq 'Active'}">
										<c:set var="formStatusbackPain2" value=""></c:set>
									</c:if>

									<c:if test="${formStatusSelfExam eq 'Active'}">
										<c:set var="formStatusSelfExam" value=""></c:set>
									</c:if>
									<c:if test="${formStatusDisability eq 'Active'}">
										<c:set var="formStatusDisability" value=""></c:set>
									</c:if>

									<c:if test="${loggedClient.clientStateId  != 4}">
										<li><span><a
												href="${pageContext.request.contextPath}/welcome.html">Home
											</a> </span></li>
										<li></li>
										<li><span><a
												href="${pageContext.request.contextPath}/aboutYou.html">1. About
													You <font color="green">${formStatusAboutYou}</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/medicalHistory.html">2. Medical
													History <font color="green">${formStatusMedicalHistory}</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/backPain.html">3. Back
													Pain(1) <font color="green">${formStatusbackPain}</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/backPain2.html">4. Back
													Pain(2) <font color="green">${formStatusbackPain2}</font>
											</a></span></li>
										<li><span><a
												href="${pageContext.request.contextPath}/selfExam.html">5. Self
													Examination <font color="green">${formStatusSelfExam}</font>
											</a></span></li>
										<c:if test="${status eq 1}">
											<li><span><a
													href="${pageContext.request.contextPath}/selfExamine.html">6. Disability
														<font color="green">Completed</font>
												</a></span></li>
										</c:if>
										<c:if test="${status eq null }">
											<li><span><a
													href="${pageContext.request.contextPath}/selfExamine.html">6. Disability
														<font color="green">${formStatusDisability}</font>
												</a></span></li>
										</c:if >
										<%-- <li class="open"><span>Monitoring System</span>
											<ul style="background-color: #FFF4D1;">
												<li><span><a
														href="${pageContext.request.contextPath}/weeklyUpdate.html">Update</a></span></li>
											</ul></li> --%>
									</c:if>
								</ul>


							</td>
						</tr>

						<tr>
							<td height="20" align="left" valign="middle">&nbsp;</td>
							<td align="left" valign="middle">&nbsp;</td>
						</tr>
						<tr>
							<td height="20" align="left" valign="middle">&nbsp;</td>
							<td align="left" valign="middle">
								<%-- After completion of all
								forms, please click on Sign-out button (top right hand corner)
								to exit from the website. We will get back to you within 3 days.<br>
								<br> During the process if you exit from the website,
								please go back to www.calba.net and use the Username and
								password you have received at the time of registration to log
								into the system again.<br> <br> If you are having
								problems and need help, please send a message to <our calba=""
									email="" address=""> support@calba.net </our><br> <span><a
									href="${pageContext.request.contextPath}/SendMessage.html"><font
										color="green">SendMessage</font></a> </span>  --%> 
										
									<%-- 	<c:if test="${loggedClient.clientStateId  == 4 && loginVal eq 'Nologin'}">
										You have successfully completed all the forms.  If you would like to check your answers on any of the forms and want to make changes, please do so now.  Otherwise Click the Proceed button, below <br>
										</c:if> --%>
										
										
										
										
							
							<!-- <br>After completing all the forms, click on the Sign Out
								button (top right hand corner) to exit from the site. We will
								email you the assessment results and advice within a day or two. 
							 -->	
								
								
								<br> <br> Please contact us if you have difficulty
								responding and need help: >Email: <our calba="" email=""
									address=""> enquiries@calba.net </our><br>
							<span><a
									href="${pageContext.request.contextPath}/SendMessage.html"><font
										color="green">Tel: 020-8245 6420</font></a> </span>

							</td>
						</tr>
						<tr>
							<td height="80" align="left" valign="middle">&nbsp;</td>
							<td align="left" valign="middle">&nbsp;</td>
						</tr>

					</tbody>
				</table></td>
		</tr>
	</tbody>
</table>
<script type="text/javascript">
	$(document).ready(function() {
		$("#browser").treeview({
			toggle : function() {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
	});
</script>