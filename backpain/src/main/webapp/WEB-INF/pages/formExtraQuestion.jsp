<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>




												<c:if test="${setFormVal eq 1}">
								               
								                <c:if test="${flagsValue[1].flag eq 1}">
								                <tr>
													<td colspan="2">1.<fmt:message key="questionMoniter1" />
													</td>
												</tr>
												
												<tr>
												<td style="padding-left: 72px;">Lower back:</td>
											
												<td><form:radiobutton path="question466" value="1"/>
																		<label for="sex">Yes</label>
												<form:radiobutton path="question466" value=""/>
																		<label for="sex">No</label></td>
												
												</tr>
												<tr id="question466_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												
												
												<tr>
												<td style="padding-left: 72px;width: 176px;">Groin , buttock ,leg or foot</td>
												<td><form:radiobutton path="question467" value="1" onclick="showQuestion();"/>
																		<label for="sex">Yes</label>
												<form:radiobutton path="question467" value="" onclick="showQuestion();"/>
																		<label for="sex">No</label></td>
												</tr>
												
												
												
												<tr id="question_id_439" class="mh_hide">
													<td colspan="1" class="style3"></td>
													
													<td>
												
													
													<table>
													<tbody>
													<tr>
													<td><form:checkbox path="question439" value="1" /><label>Groin</label></td></tr>
													<tr><td><form:checkbox path="question439" value="2" /><label>Left buttock</label></td>
													<td><form:checkbox path="question439" value="3" /><label>Right buttock </label></td></tr>
													
													<tr><td><form:checkbox path="question439" value="4" /><label>Front of left thigh</label></td>
													<td><form:checkbox path="question439" value="5" /><label>Front of right thigh</label></td></tr>
													
													<tr><td><form:checkbox path="question439" value="6" /><label>Back of left thigh</label></td>
													<td><form:checkbox path="question439" value="7" /><label>Back of right thigh</label></td></tr>
													
													<tr><td><form:checkbox path="question439" value="8" /><label>Left shin or calf</label></td>
													<td><form:checkbox path="question439" value="9" /><label>Right shin or calf</label></td></tr>
													
													<tr><td><form:checkbox path="question439" value="10" /><label>Left foot</label></td>
													<td><form:checkbox path="question439" value="11" /><label>Right foot</label></td>
													</tr></tbody></table>
														
														
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question439" cssClass="errors" />
								                    </td>
								                </tr>
								                <tr id="question439_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												</c:if>

												<c:if test="${flagsValue[2].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														2. <fmt:message key="questionMoniter2" />
													</td>
												</tr>
												
													
												<tr>
												<td style="padding-left: 72px;">Groin, buttock , leg</td>
												<td><form:radiobutton path="question470" value="1" onclick="showQuestion1();"/>
																		<label for="sex">Yes</label>
												<form:radiobutton path="question470" value="" onclick="showQuestion1();"/>
																		<label for="sex">No</label></td>
											
												</tr>
												<tr id="question470_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												
												
												
												
												<tr id="question_id_440" class="mh_hide">
													<td class="style3" colspan="1"></td>
													<td>
													
													
														
													<table>
													<tbody>
													<tr>
													<td><form:checkbox path="question440" value="1" /><label>Groin</label></td></tr>
													<tr><td><form:checkbox path="question440" value="2" /><label>Left buttock</label></td>
													<td><form:checkbox path="question440" value="3" /><label>Right buttock </label></td></tr>
													
													<tr><td><form:checkbox path="question440" value="4" /><label>Front of left thigh</label></td>
													<td><form:checkbox path="question440" value="5" /><label>Front of right thigh</label></td></tr>
													
													<tr><td><form:checkbox path="question440" value="6" /><label>Back of left thigh</label></td>
													<td><form:checkbox path="question440" value="7" /><label>Back of right thigh</label></td></tr>
													
													<tr><td><form:checkbox path="question440" value="8" /><label>Left shin or calf</label></td>
													<td><form:checkbox path="question440" value="9" /><label>Right shin or calf</label></td></tr>
													
													<tr><td><form:checkbox path="question440" value="10" /><label>Left foot</label></td>
													<td><form:checkbox path="question440" value="11" /><label>Right foot</label></td>
													</tr></tbody></table>
														
														
														
														
														</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question440" cssClass="errors" />
								                    </td>
								                </tr>
								                <tr id="question440_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												<c:if test="${flagsValue[3].flag eq 1}">
												
												<tr>
													<td  colspan="2" style="border-top: dotted 1px black;">
													3. <fmt:message key="questionMoniter3" />
													</td>
												</tr>
												
																									
												<tr>
												<td style="padding-left: 72px;">Left or right leg:</td>
												
												<td><form:radiobutton path="question474" value="1" onclick="showQuestion2();"/>
																		<label for="sex">Yes</label>
												<form:radiobutton path="question474" value="" onclick="showQuestion2();"/>
																		<label for="sex">No</label></td>
												</tr>
												
												<tr id="question474_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												
												<tr id="question_id_441" class="mh_hide">
													<td class="style4" colspan="1"></td>
													<td>
											
														
													<table>
													<tbody>
													<tr><td><form:checkbox path="question441" value="1" /><label>Left thigh</label></td>
													<td><form:checkbox path="question441" value="2" /><label>Right thigh</label></td></tr>
													
													<tr><td><form:checkbox path="question441" value="3" /><label>Left shin or calf</label></td>
													<td><form:checkbox path="question441" value="4" /><label>Right shin or calf</label></td></tr>
													
													<tr><td><form:checkbox path="question441" value="5" /><label>Left foot or ankle</label></td>
													<td><form:checkbox path="question441" value="6" /><label>Right foot or ankle</label></td>
													</tr></tbody></table>
														
														
														
														
														</td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question441" cssClass="errors" />
								                    </td>
								                </tr>
								                <tr id="question441_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												<c:if test="${flagsValue[4].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														4. <fmt:message key="questionMoniter4" />
													</td>
												</tr>
												<tr>
													<td class="style3" colspan="1"></td>
													<td><form:select path="question442"
															cssStyle="width:250px;">
															<form:option value="0" label="Select an option" />
															<form:option value="Less than a quarter of the way up" />
															<form:option value="About a quarter of the way up" />
															<form:option value="About half way up" />
															<form:option value="More than half way up" />
														</form:select></td>
												</tr>
												 <tr>
								                    <td colspan="2">
								                    	<form:errors path="question442" cssClass="errors" />
								                    </td>
								                </tr>
								                <tr id="question442_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
													<fmt:message key="questionMoniter4.1" />
													</td>
												</tr>
												
												<tr>
													<td class="style3" colspan="1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	
																	<td><form:select path="question446"
																	cssStyle="width:250px;">
																	<form:option value="0" label="Select an option" />
																	<form:option value="Less than a quarter of the way up" />
																	<form:option value="About a quarter of the way up" />
																	<form:option value="About half way up" />
																	<form:option value="More than half way up" />
																	</form:select></td>
																	</td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
								                    <td colspan="2">
								                    	<form:errors path="question446" cssClass="errors" />
								                    </td>
								                </tr>
												<tr>
													<td class="style3" colspan="1"></td>
													<td id="question84_WU" class="mh_hide"><form:textarea
															path="question125" rows="2" cols="20"
															cssStyle="height:60px;width:352px;" /></td>
												</tr>
												<tr id="question446_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												<c:if test="${flagsValue[0].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														5. <fmt:message key="questionMoniter5" />
													</td>
												</tr>
												<tr>
													<td class="style3" colspan="1"></td>
													<td><form:select path="question443"
															cssStyle="width:250px;" onchange="newLegQuestion1();">
															<form:option value="0" label="Select an option" />
															<form:option value="1" label="Leg/Foot" />
															<form:option value="2" label="Lower back" />
														
														</form:select></td>
												</tr>
												<tr>
								                    <td colspan="2">
								                    	<form:errors path="question443" cssClass="errors" />
								                    </td>
								                </tr>
								                <tr id="question443_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												
												
												<!--New leg question  -->
												<tr>
												<td colspan="2" id="subLegQuestion" class="mh_hide">
												<fmt:message key="newLegQuestion"/></td>
												</tr>
												
												
												<tr>
													<td class="style3" colspan="1"></td>
													<td id="subLegQuestion_answer" class="mh_hide"><form:select path="question494"
															cssStyle="width:250px;">
															<form:option value="" label="Select an option" />
															<form:option value=">3/4" label="Worse for more than 3/4 of the time" />
															<form:option value="1/2" label="Worse for about 1/2 the time" />
															<form:option value="<1/4" label="Worse for less than 1/4 of the time" />
															<form:option value="0" label="Never worse" />
														
														</form:select></td>
												</tr>
												<!--End new leg question -->
												
												</c:if>

												<c:if test="${flagsValue[6].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														6. <fmt:message key="questionMoniter6" />
													</td>
												</tr>
												<tr>
													<td class="style3" colspan="1"></td>
													<td><form:select path="question447"
															cssStyle="width:250px;">
															<form:option value="0" label="Select an option" />
															<form:option value="1" label="None" />
															<form:option value="2" label="Less than 4" />
															<form:option value="3" label="4 - 8" />
															<form:option value="4" label="8 - 12" />
															<form:option value="5" label="More than 12" />
														</form:select></td>
												</tr>
												<tr>
								                    <td colspan="2">
								                    	<form:errors path="question447" cssClass="errors" />
								                    </td>
								                </tr>
								                 <tr id="question447_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												<c:if test="${flagsValue[7].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														7. <fmt:message key="questionMoniter7" />
													</td>
												</tr>
												<tr>
													<td class="style3" colspan="1"></td>
													
													<td><form:radiobutton path="question444" value="1" onclick="showQuestion3();"/>
																		<label for="sex">Yes</label>
												<form:radiobutton path="question444" value="" onclick="showQuestion3();"/>
																		<label for="sex">No</label></td>
												
												</tr>
												<tr id="yogaTime" class="mh_hide">
												<td style="padding-left: 1px;">
												About how long was your yoga session (in minutes)?
												</td>
												<td><form:textarea path="question491" cols="5"
																	rows="1" onkeypress="return isNumberKey(event);"/>
												
												
												</td>
												</tr>
												<tr>
								                    <td colspan="2">
								                    	<form:errors path="question444" cssClass="errors" />
								                    </td>
								                </tr>
								                 <tr id="question444_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
								                <tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												<c:if test="${flagsValue[8].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														8. <fmt:message key="questionMoniter8" />
													</td>
												</tr>
												<tr>
													<td class="style3" colspan="1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:textarea path="question445" cols="20"
																	rows="2" cssStyle="height:76px;width:401px;" />
															 		<span id="question87_other_error" class="errors mh_hide">Please provide detail</span></td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
								                    <td colspan="2">
								                    	<form:errors path="question445" cssClass="errors" />
								                    </td>
								                </tr>
								                 <tr id="question445_error" class="mh_hide">								                 
								                    <td colspan="2">
								                    	<span class="errors">Please provide detail</span>
								                    </td>								               
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												
												
												
												<%-- <!-- New questions -->
												
												<c:if test="${flagsValue[9].flag eq 1}">
												 <tr>
								                    <td colspan="2" style="border-top: dotted 1px black;">
								                        9. <fmt:message key="question14"/>
								                    </td>
								                </tr>
								                <tr>
								                    <td colspan="1" class="mh_style4">
								                    </td>
								                    <td>
								                     <form:select path="question14" cssStyle="width:200px;">
								                    	<form:option value=""/>
								                    	<form:option value="No"/>
								                        <form:option value="Bladder Only"/>
								                    	<form:option value="Bowel Only"/>
											            <form:option value="Bladder & Bowel"/>
								                    </form:select>               
								                       
								                    </td>
								                </tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												
												<c:if test="${flagsValue[10].flag eq 1}">
												<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		10. <fmt:message key="question18" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question18"
																											value="335" /><label for="question18">Yes</label></td>
																									<td><form:radiobutton path="question18"
																											value="334" /><label for="question18">No</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td>&nbsp;</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												</c:if>
												
												
												<c:if test="${flagsValue[11].flag eq 1}">
												<tr>
																	<td colspan="3" style="border-top: dotted 1px black;">
																		11. <fmt:message key="question23" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question23"
																											value="328" /><label
																										for="question23">I could touch my feet
																											or ankles</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question23"
																											value="329" /><label
																										for="question23">I could touch my mid
																											calf with the tips of my fingers</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question23"
																											value="330" /><label
																										for="question23">I could touch my knees
																											with the tips of my fingers</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question23"
																											value="331" /><label
																										for="question23">I couldn't bend
																											forward at all</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td><span></span></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
												</c:if>
												
												
												<c:if test="${flagsValue[12].flag eq 1}">
												<tr>
																	<td colspan="2" style="border-top: dotted 1px black;">
																		12. <fmt:message key="question27" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="340" onclick="updateTextValue();"/><label for="question27">Pain
																											did not prevent me walking any distance</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="341" onclick="updateTextValue();"/><label for="question27">Pain
																											did not prevent me walking more than 1 mile</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="342" onclick="updateTextValue();"/><label for="question27">Pain
																											did not prevent me walking more than 1/2 mile</label></td>
																								</tr>
																								
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="343" onclick="updateTextValue();"/><label for="question27">Pain did not prevent me from walking up to 1/2 mile</label></td>
																								</tr>
																								
																								
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="344" onclick="updateTextValue();"/><label for="question27">I
																											could walk but less than 1/4 of a mile</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question27"
																											value="512" onclick="updateTextValue();"/><label for="question27">I
																											was unable to walk at all</label></td>
																								</tr>
																								 <input type="hidden" id="question505" name="question505" value=""/>
																							</tbody>
																						</table>
																					</td>
																					<td><span></span></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>

												</c:if>
												
												<c:if test="${flagsValue[13].flag eq 1}">
												<tr>
																	<td colspan="2">
																		13. <fmt:message key="question25" />
																	</td>
																</tr>
																<tr>
																	<td colspan="1" class="bp_style3"></td>
																	<td>
																		<table>
																			<tbody>
																				<tr>
																					<td>
																						<table id="question25_RadioButton" border="0">
																							<tbody>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="322" /><label for="question25">I
																											was able to sit in any chair for as long as I
																											liked</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="323" /><label for="question25">I
																											could only sit in my favorite chair as long
																											as I liked</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="324" /><label for="question25">Pain
																											prevented me from sitting more than 1 hour</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="325" /><label for="question25">Pain
																											prevented me from sitting more than 30
																											minutes</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="326" /><label for="question25">Pain
																											prevented me from sitting more than 15
																											minutes</label></td>
																								</tr>
																								<tr>
																									<td><form:radiobutton path="question25"
																											value="327" /><label for="question25">Pain
																											prevented me from sitting at all</label></td>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																					<td></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
												
												</c:if>
												
												<c:if test="${flagsValue[14].flag eq 1}">
												<tr>
													<td colspan="2">14. <fmt:message key="question50" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td><form:select path="question50">
															<form:option value="" />
															<form:option value="315"
																label="I can lift weights without pain" />
															<form:option value="316"
																label="I can lift weights without additional pain" />
															<form:option value="317"
																label="I can lift heavy weights but it causes extra pain" />
															<form:option value="318"
																label="Pain stops me lifting heavy weights off the floor but I can manage if they are conveniently positioned" />
															<form:option value="319"
																label="Pain stops me lifting heavy weights but I can manage light to medium weights if they are conveniently positioned" />
															<form:option value="320"
																label="I can lift only very light weights" />
															<form:option value="321"
																label="I cannt left or carry anything" />
														</form:select></td>
												</tr>
												</c:if>
												
												<c:if test="${flagsValue[15].flag eq 1}">
												<tr>
													<td colspan="2" style="border-top: dotted 1px black;">
														15. <fmt:message key="question56" />
													</td>
												</tr>
												<tr>
													<td colspan="1" class="style1"></td>
													<td>
														<table>
															<tbody>
																<tr>
																	<td><form:radiobutton path="question56"
																			value="333" /> <label for="question56">Yes</label></td>
																	<td><form:radiobutton path="question56" value="332" />
																		<label for="question56">No</label></td>

																</tr>
															</tbody>
														</table>
													</td>
												</tr>

												</c:if>
												
												<!--End new questions  --> --%>
												
												
												
												</c:if>