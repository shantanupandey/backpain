<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<tr id="${parentId}_S1" class="mh_hide">
	<td colspan="2"><span>[iv]. <fmt:message
				key="backpain.type.pain" />
	</span></td>
</tr>

<tr id="${parentId}_S2" class="mh_hide">
	<td colspan="1" class="bp_style3"><br /> <br /> <br /></td>
	<td>
		<table>
			<tbody>



				<c:if test="${parentId == 'question34'}">
				
				<%-- <tr id="singleSidePain01" class="mh_hide">
						<td>
					    <form:select path="question282">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						
						</td>
						<td></td>
						<td></td>
					</tr> --%>
					
					<!-- For both side pain  -->
					<tr id="bothSidePain01" class="mh_hide">
						
						<td colspan="2">Left Side Pain: &nbsp;&nbsp;
						     <form:select path="question261">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select>
							</td>
						<td></td>
						<td></td>
					</tr>
						
						<tr id="bothSidePain02" class="mh_hide">
						<td colspan="2">Right Side Pain:
					    <form:select path="question262">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						</td>
						<td></td>
						<td></td>
					    </tr>
				
					<%-- <tr>
						<td colspan="1">Buttock</td>
						<td><form:select path="question261">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td><span></span></td>
					</tr>
 --%>
<%--  <tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><form:radiobutton path= "question282"
											value="No Pain" /><label for="question282">No Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question282"
											value="Diffuse Pain" /><label for="question282">Diffuse Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question282"
											value="Sharp, localised pain" /><label for="question282">Sharp, localised pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question282"
											value="Shooting pain along clearly-defined track" /><label for="question282">Shooting pain along clearly-defined track</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question282"
											value="Burning pain" /><label for="question282">Burning pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question282"
											value="Other" /><label for="question282">Other</label></td>
								</tr>
								<tr id="cannotRemember1">
									<td><form:radiobutton path="question282"
											value="Cannot Remember" /><label for="question282">Cannot Remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr> --%>

				</c:if>

				<c:if test="${parentId == 'question35'}">
				
				<%-- <tr id="singleSidePain02" class="mh_hide">
						<td>
					    <form:select path="question283">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						
						</td>
						<td></td>
						<td></td>
					</tr> --%>
					
					<!-- For both side pain  -->
					<tr id="bothSidePain03" class="mh_hide">
						
						<td colspan="2">Left Side Pain: &nbsp;&nbsp;<form:select path="question263">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
						
						<tr id="bothSidePain04" class="mh_hide">
						<td colspan="2">Right Side Pain:
					    <form:select path="question264">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						</td>
						<td></td>
						<td></td>
					    </tr>
				
					<%-- <tr>
						<td colspan="1">Groin</td>
						<td><form:select path="question263">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr> --%>
					
					<%-- <tr>
					<td>
						<table>
							<tbody>
							
								<tr>
									<td><form:radiobutton path= "question283"
											value="No Pain" /><label for="question283">No Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question283"
											value="Diffuse Pain" /><label for="question283">Diffuse Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question283"
											value="Sharp, localised pain" /><label for="question283">Sharp, localised pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question283"
											value="Shooting pain along clearly-defined track" /><label for="question283">Shooting pain along clearly-defined track</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question283"
											value="Burning pain" /><label for="question283">Burning pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question283"
											value="Other" /><label for="question283">Other</label></td>
								</tr>
								 <tr>
									<td id="cannotRemember2" class="mh_hide"><form:radiobutton path="question283"
											value="Cannot Remember" /><label for="question283">Cannot Remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr> --%>

				</c:if>

				<c:if test="${parentId == 'question36'}">
					<%-- <tr id="singleSidePain1" class="mh_hide">
						<td>
					    <form:select path="question284">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						
						</td>
						<td></td>
						<td></td>
					</tr> --%>
					
					<!-- For both side pain  -->
					<tr id="bothSidePain1" class="mh_hide">
						
						<td colspan="2">Left Side Pain: &nbsp;&nbsp;<form:select path="question265">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
						
						<tr id="bothSidePain2" class="mh_hide">
						<td colspan="2">Right Side Pain:
					    <form:select path="question269">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						</td>
						<td></td>
						<td></td>
					    </tr>
					
					<!-- End For both side of pain  -->
					
					<%--
					<tr>
						<td colspan="1">Back Of Thigh</td>
						<td><form:select path="question266">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="1">Shin or Calf</td>
						<td><form:select path="question267">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="1">Foot or Ankle</td>
						<td><form:select path="question268">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
 --%>
 <%-- <tr>
					<td>
						<table>
							<tbody>
								
								<tr>
									<td><form:radiobutton path= "question284"
											value="No Pain" /><label for="question284">No Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question284"
											value="Diffuse Pain" /><label for="question284">Diffuse Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question284"
											value="Sharp, localised pain" /><label for="question284">Sharp, localised pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question284"
											value="Shooting pain along clearly-defined track" /><label for="question284">Shooting pain along clearly-defined track</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question284"
											value="Burning pain" /><label for="question284">Burning pain</label></td>
								</tr>
								<tr>
									<td  id="cannotRemember3" class="mh_hide"><form:radiobutton path="question284"
											value="Cannot Remember" /><label for="question284">Cannot Remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr> --%>

				</c:if>
				
				<!-- Q6[H],Q6[I],Q6[J] -->
				
				<c:if test="${parentId == 'question291'}">
					 <%-- <tr id="singleSidePain2" class="mh_hide">
						<td>
						<form:select path="question306">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						
						
						</td>
						<td></td>
						<td></td>
					</tr> --%>
					
					<!-- For both side pain  -->
					<tr id="bothSidePain3" class="mh_hide">
						<td colspan="2">Left Side Pain: &nbsp;&nbsp;<form:select path="question266">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
						
						<tr id="bothSidePain4" class="mh_hide">
						<td colspan="2">Right Side Pain:<form:select path="question270">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						</td>
						<td></td>
						<td></td>
					    </tr>
					
					<!-- End For both side of pain  -->
					
					<%-- <tr>
					<td>
						<table>
							<tbody>
							
								<tr>
									<td><form:radiobutton path= "question306"
											value="No Pain" /><label for="question306">No Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question306"
											value="Diffuse Pain" /><label for="question306">Diffuse Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question306"
											value="Sharp, localised pain" /><label for="question306">Sharp, localised pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question306"
											value="Shooting pain along clearly-defined track" /><label for="question306">Shooting pain along clearly-defined track</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question306"
											value="Burning pain" /><label for="question306">Burning pain</label></td>
								</tr>
								 <tr>
									<td id="cannotRemember4" class="mh_hide"><form:radiobutton path="question306"
											value="Cannot Remember" /><label for="question306">Cannot Remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr> --%>

				</c:if>
				
				<c:if test="${parentId == 'question292'}">
					<%-- <tr id="singleSidePain3" class="mh_hide">
						
						<td>
						 <form:select path="question307">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select>
						
							</td>
						<td></td>
						<td></td>
					</tr>  --%>
					
					<!-- For both side pain  -->
					<tr id="bothSidePain5" class="mh_hide">
						<td colspan="2">Left Side Pain: &nbsp;&nbsp;<form:select path="question267">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
						
						<tr id="bothSidePain6" class="mh_hide">
						<td colspan="2">Right Side Pain:<form:select path="question271">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						</td>
						<td></td>
						<td></td>
					    </tr>
					
					<!-- End For both side of pain  -->
					
					<%-- <tr>
					<td>
						<table>
							<tbody>
							
								<tr>
									<td><form:radiobutton path= "question307"
											value="No Pain" /><label for="question307">No Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question307"
											value="Diffuse Pain" /><label for="question307">Diffuse Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question307"
											value="Sharp, localised pain" /><label for="question307">Sharp, localised pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question307"
											value="Shooting pain along clearly-defined track" /><label for="question307">Shooting pain along clearly-defined track</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question307"
											value="Burning pain" /><label for="question307">Burning pain</label></td>
								</tr>
								 <tr>
									<td id="cannotRemember5" class="mh_hide"><form:radiobutton path="question307"
											value="Cannot Remember" /><label for="question307">Cannot Remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr> --%>

				</c:if>
				
				<c:if test="${parentId == 'question293'}">
					 <%-- <tr id="singleSidePain4" class="mh_hide">
						
						<td>
						<form:select path="question308">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						
						</td>
						<td></td>
						<td></td>
					</tr> --%>
					
					<!-- For both side pain  -->
					<tr id="bothSidePain7" class="mh_hide">
						<td colspan="2">Left Side Pain: &nbsp;&nbsp;<form:select path="question268">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
							</form:select></td>
						<td></td>
						<td></td>
					</tr>
						
						<tr id="bothSidePain8" class="mh_hide">
						<td colspan="2">Right Side Pain:<form:select path="question272">
								<form:option value="0" label="Select an Option" />
								<form:options items="${form.painTypes}" />
						</form:select> 
						</td>
						<td></td>
						<td></td>
					    </tr>
					
					<!-- End For both side of pain  -->
					
					<%-- <tr>
					<td>
						<table>
							<tbody>
							
								<tr>
									<td><form:radiobutton path= "question308"
											value="No Pain" /><label for="question308">No Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question308"
											value="Diffuse Pain" /><label for="question308">Diffuse Pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question308"
											value="Sharp, localised pain" /><label for="question308">Sharp, localised pain</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question308"
											value="Shooting pain along clearly-defined track" /><label for="question308">Shooting pain along clearly-defined track</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="question308"
											value="Burning pain" /><label for="question308">Burning pain</label></td>
								</tr>
								 <tr>
									<td id="cannotRemember6" class="mh_hide"><form:radiobutton path="question308"
											value="Cannot Remember" /><label for="question308">Cannot Remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr> --%>

				</c:if>
				
				<!--End Q6[H],Q6[I],Q6[J]  -->

				<tr>
					<td  colspan="2" id="${parentId}_1_error" class="mh_hide"><span class="errors" style="margin-left: -137px;">Please provide answer.</span></td>
				</tr>
				
				
			</tbody>
		</table>

	</td>
</tr>
