<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
										<tbody>
											<tr>
												<td class="tbl_red" align="left" height="25" valign="middle">
													<strong style="margin-left: 10px;">Record List</strong>
												</td>
											</tr>
											<tr>
												<td style="height: 213px" valign="top"><br />
													<table width="100%">
														<tbody>
															<tr>
																<td>
																	<fieldset>
																		<table>
																			<tbody>
																				<tr>
																					<td width="100px"><b>Full Name :</b></td>
																					<td><span>${client.foreName}
																							${client.surName}</span></td>
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
																<td><br />
																	<fieldset>
																		<table width="100%">
																			<tbody>
																				<tr>
																					<td align="right"><input type="button"
																						onclick="window.location='${contextPath}/admin/${client.clientId}/reportList.html';"
																						style="width: 157px;" id="reportList"
																						value="Go to Report Listing" /></td>
																				</tr>
																			</tbody>
																		</table>
																	</fieldset></td>
															</tr>
														</tbody>
													</table></td>
											</tr>
											<br />

											<tr>
												<!-- New Strucutre For Radicular & Non Radicular table -->
												<%@ include file="CalculationReportPage.jsp"%>
												<!-- End New Strucutre For Radicular & Non Radicular table-->
											</tr>
											<td colspan="3">

												<table cellspacing="0" cellpadding="4" rules="rows"
													border="1"
													style="color: #333333; height: 95px; width: 725px; border-collapse: collapse;">
													<tr
														style="color: White; background-color: #990000; font-weight: bold;">
														<th scope="col"
															style="width: 50px; border: 1px solid black" colspan="2">Site</th>

														<th scope="col"
															style="width: 50px; border: 1px solid black" colspan="8"><center>From
																Lookup Table, below</center></th>

													</tr>
													<tr
														style="color: White; background-color: #990000; font-weight: bold;">
														<th scope="col"
															style="width: 50px; border: 1px solid black">Non Rad</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Rad</th>

														<th scope="col"
															style="width: 50px; border: 1px solid black">Acute</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Early</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Early
															Mid</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Late
															Mid</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Late</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Re-covered</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Chronic</th>
														<th scope="col"
															style="width: 50px; border: 1px solid black">Consult
															Dr</th>

													</tr>
													<tr id="${boldRowCounter}"
														style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="HNPphaseNonRadScore">${TotalNonRadSum}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="HNPphaseRadScore"></div>
															<input type="hidden" value="" id="HNPphaseRadScore" /></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="acuteRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="earlyRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="earlyMidRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="lateMidRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="lateRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="recoveredRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="chronicRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="consultDrRow"></div></td>

													</tr>


													<!-- History table -->

													<tr id="${boldRowCounter}"
														style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
														<td
															style="width: 50px; height: 50px; border: 1px solid black"
															colspan="2">Adjustment factors from History lookup
															table</td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historyacuteRow">${historyValueHnp[0].acute}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historyearlyRow">${historyValueHnp[0].early}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historyearlyMidRow">${historyValueHnp[0].early_mid}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historylateMidRow">${historyValueHnp[0].late_mid}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historylateRow">${historyValueHnp[0].late}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historyrecoveredRow">${historyValueHnp[0].recovered}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historychronicRow">${historyValueHnp[0].dd1}</div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="historyconsultDrRow">${historyValueHnp[0].dd2}</div></td>
													</tr>


													<tr id="${boldRowCounter}"
														style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };">
														<td
															style="width: 50px; height: 50px; border: 1px solid black"
															colspan="2">Final Likelihood values (Likelihood *
															Adjustment factor)</td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finalacuteRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finalearlyRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finalearlyMidRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finallateMidRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finallateRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finalrecoveredRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finalchronicRow"></div></td>
														<td
															style="width: 50px; height: 50px; border: 1px solid black"><div
																id="finalconsultDrRow"></div></td>
													</tr>
													<!-- End history table -->
												</table>



											</td>

											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>&nbsp;
											</tr>
											<tr>
												<td colspan="3">

													<table cellspacing="0" cellpadding="4" rules="rows"
														border="1"
														style="color: #333333; height: 95px; width: 725px; border-collapse: collapse;">

														<tr
															style="color: White; background-color: #990000; font-weight: bold;">
															<th scope="col"
																style="width: 50px; border: 1px solid black"
																colspan="10"><center>LOOKUP TABLE</center></th>

														</tr>
														<tr
															style="color: White; background-color: #990000; font-weight: bold;">
															<th scope="col"
																style="width: 50px; border: 1px solid black" colspan="2">Input
																(from table, above)</th>

															<th scope="col"
																style="width: 50px; border: 1px solid black" colspan="8"><center>Output
																	(to table, above)</center></th>

														</tr>
														<tr
															style="color: White; background-color: #990000; font-weight: bold;">
															<th scope="col"
																style="width: 50px; border: 1px solid black">Non
																Rad</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Rad</th>

															<th scope="col"
																style="width: 50px; border: 1px solid black">Acute</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Early</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Early
																Mid</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Late
																Mid</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Late</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Re-covered</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Chronic</th>
															<th scope="col"
																style="width: 50px; border: 1px solid black">Consult
																Dr</th>

														</tr>

														<c:set var="boldRowCounter" value="1" />


														<c:forEach items="${hnpPhaseValue}" var="hnpPhaseVal"
															varStatus="counter">
															
															<c:choose>
																<c:when
																	test="${(boldRowCounter eq 6) || (boldRowCounter eq 12) || (boldRowCounter eq 18)|| (boldRowCounter eq 24) }">
																	<c:set var="boldRowStyle"
																		value="border: 3px solid black" />

																	<tr id="${boldRowCounter}"
																		style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border-bottom: 3px solid black;">
																</c:when>

																<c:otherwise>
																	<tr id="${boldRowCounter}"
																		style="background-color:${count % 2 == 0 ? '#FFFBD6;' : 'White;' };border-bottom: 1px solid black;">
																</c:otherwise>
															</c:choose>

															<script>
																 var flag = false;
																  $(document).ready(function () {
																	
																	 var rad= document.getElementById('HNPphaseRadScore').innerHTML;
																     var nonRad= document.getElementById('HNPphaseNonRadScore').innerHTML;
																    
																     if(rad<2 && rad>1){
																    	 rad=2;
																      }
																     
																     if(rad<1 && rad>0){
																    	 rad=2;
																      }
																     
																     if(rad==0 || rad==1){
																    	 rad=2;
																      }
																    
																     
																      if((nonRad>=${hnpPhaseVal.non_rad}) && (flag==false) && (rad>=${hnpPhaseVal.rad})){
																          
																    	 flag = true;
																    	 document.getElementById(
																    	 ${boldRowCounter}).style.backgroundColor='#FFFF00';
																    	 document.getElementById('acuteRow').innerHTML=${hnpPhaseVal.acute};
																    	 document.getElementById('earlyRow').innerHTML=${hnpPhaseVal.early};
																    	 document.getElementById('earlyMidRow').innerHTML=${hnpPhaseVal.early_mid};
																    	 document.getElementById('lateMidRow').innerHTML=${hnpPhaseVal.late_mid};
																    	 document.getElementById('lateRow').innerHTML=${hnpPhaseVal.late};
																    	 document.getElementById('recoveredRow').innerHTML=${hnpPhaseVal.recovered};
																    	 document.getElementById('chronicRow').innerHTML=${hnpPhaseVal.chronic};
																    	 document.getElementById('consultDrRow').innerHTML=${hnpPhaseVal.consultme};
																      }
																      
																     
																      
																      
																  });
																    	
																 
																</script>

															<td id="row"
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.non_rad}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.rad}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.acute}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.early}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.early_mid}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.late_mid}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.late}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.recovered}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.chronic}</td>
															<td
																style="width: 50px; height: 30px; border: 1px solid black">${hnpPhaseVal.consultme}</td>
															<c:set var="boldRowCounter" value="${boldRowCounter+1}" />
															</tr>
														</c:forEach>

														<c:if test="${historyValueHnp ne null}">
															<script>
																 $(document).ready(function () {
																var acuteRow= document.getElementById('acuteRow').innerHTML;
																var earlyRow= document.getElementById('earlyRow').innerHTML; 
																var earlyMidRow= document.getElementById('earlyMidRow').innerHTML;
																var lateMidRow= document.getElementById('lateMidRow').innerHTML;
																var lateRow= document.getElementById('lateRow').innerHTML; 
																var recoveredRow= document.getElementById('recoveredRow').innerHTML;
																var chronicRow= document.getElementById('chronicRow').innerHTML;
																var consultDrRow= document.getElementById('consultDrRow').innerHTML;
																
																var historyacuteRow= document.getElementById('historyacuteRow').innerHTML;
																var historyearlyRow= document.getElementById('historyearlyRow').innerHTML; 
																var historyearlyMidRow= document.getElementById('historyearlyMidRow').innerHTML;
																var historylateMidRow= document.getElementById('historylateMidRow').innerHTML;
																var historylateRow= document.getElementById('historylateRow').innerHTML; 
																var historyrecoveredRow= document.getElementById('historyrecoveredRow').innerHTML;
																var historychronicRow= document.getElementById('historychronicRow').innerHTML;
																var historyconsultDrRow= document.getElementById('historyconsultDrRow').innerHTML;
																
																
																var multiAcute=acuteRow*historyacuteRow;
																multiAcute=multiAcute.toFixed(1);
																document.getElementById('finalacuteRow').innerHTML=multiAcute;
																
																var multiEarlyRow=earlyRow*historyearlyRow;
																multiEarlyRow=multiEarlyRow.toFixed(1);
																document.getElementById('finalearlyRow').innerHTML=multiEarlyRow;
																
																var multiEarlyRowMid=earlyMidRow*historyearlyMidRow;
																multiEarlyRowMid=multiEarlyRowMid.toFixed(1);
																document.getElementById('finalearlyMidRow').innerHTML=multiEarlyRowMid;
																
																var multilateMidRow=lateMidRow*historylateMidRow;
																multilateMidRow=multilateMidRow.toFixed(1);
																document.getElementById('finallateMidRow').innerHTML=multilateMidRow;
																
																var multilateRow=lateRow*historylateRow;
																multilateRow=multilateRow.toFixed(1);
																document.getElementById('finallateRow').innerHTML=multilateRow;
																
																var multirecoveredRow=lateRow*historylateRow;
																multirecoveredRow=multirecoveredRow.toFixed(1);
																document.getElementById('finalrecoveredRow').innerHTML=multirecoveredRow;
																
																var multichronicRow=chronicRow*historychronicRow;
																multichronicRow=multichronicRow.toFixed(1);
																document.getElementById('finalchronicRow').innerHTML=multichronicRow;
																
																var multiconsultDrRow=consultDrRow*historyconsultDrRow;
																multiconsultDrRow=multiconsultDrRow.toFixed(1);
																document.getElementById('finalconsultDrRow').innerHTML=multiconsultDrRow;
															
																 });


																</script>
														</c:if>




													</table>



												</td>
											</tr>

										</tbody>
									</table>
								</td>


							</tr>
						</tbody>


					</table> <jsp:include page="adminFooter.jsp" />
				</td>
			</tr>
		</tbody>
	</table>




</body>
</html>