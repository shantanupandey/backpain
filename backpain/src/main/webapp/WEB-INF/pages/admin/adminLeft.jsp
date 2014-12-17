<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table width="238" border="0" cellpadding="0" cellspacing="0" class="tbl_Grid">
                                <tbody><tr>
                                    <td height="25" align="left" valign="middle" class="tbl_red">
                                        <strong>&nbsp;Menu</strong>
                                    </td>
                                </tr>

<tr>
	<td height="430" align="center" valign="top" class="tbl_fff4d1"><br>
		<table width="211" border="0" cellpadding="0" cellspacing="0" class="main_link">
			<tbody>
				<tr>
					<td height="20" align="left" valign="middle">&nbsp;</td>
					<td align="left" valign="middle">
						<ul id="browser" class="treeview-famfamfam">						
							<li><span><a href="${contextPath}/admin/welcome.html">Home</a></span></li>
							<li><span><a href="${contextPath}/admin/updateScore.html">Check Updated Score</a></span></li>
							<li><span><a href="${contextPath}/admin/userListing.html">User Listing</a> </span></li>							
							<li><span><a href="${contextPath}/admin/welcome.html">Payment Details</a> </span></li>
							<li><span><a href="${contextPath}/admin/welcome.html">Request Details</a> </span></li>
							<li><span><a href="${contextPath}/admin/monitoringForms.html">Monitoring forms</a> </span></li>
							<li><span><a href="${contextPath}/admin/adminRegister.html">Create User</a> </span></li>
							<li class="open"><span>Edit Reports</span>
								<ul style="background-color: #FFF4D1;">
										<li><span><a href="${contextPath}/admin/1/questionListing.html">NON-SPECIFIC SYMPTOMS &amp; SIGNS</a></span></li>	
										<li><span><a href="${contextPath}/admin/2/questionListing.html">TOTAL RADICULAR SYMPTOMS &amp; SIGNS</a></span></li>
										<li><span><a href="${contextPath}/admin/3/questionListing.html">PAIN ANALYSIS</a></span></li>
										<li><span><a href="${contextPath}/admin/4/questionListing.html">SELF-EXAMINATION RESULTS</a></span></li>
										<%-- <li><span><a href="${contextPath}/admin/5/questionListing.html">HNP PHASES</a></span></li> --%>
										<li><span><a href="${contextPath}/admin/8/hnpLookupPhase.html">HNP PHASES</a></span></li>
										<li><span><a href="${contextPath}/admin/5/hnpPhaseHistory.html">HISTORY TABLE</a></span></li>
										<li><span><a href="${contextPath}/admin/6/questionListing.html">CANCER</a></span></li>
										<li><span><a href="${contextPath}/admin/7/questionListing.html">CCS</a></span></li>								
								</ul></li>
							
																							
						</ul>


					</td>
				</tr>				
				
			</tbody>
		</table></td>
</tr>
</tbody></table>
<script type="text/javascript">
	$(document).ready(function(){
		$("#browser").treeview({
			toggle: function() {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
	});
</script>