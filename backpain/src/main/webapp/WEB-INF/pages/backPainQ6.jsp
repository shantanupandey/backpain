<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<tr id="${parentId}_c" class="mh_hide">
	<td id="${parentId}_past" colspan="2"><span><span id="myspan">[i].</span> <fmt:message
				key="backpain.shooting.pain.last" />
	</span></td>
</tr>
<tr id="${parentId}_c" class="mh_hide">
	<td colspan="1" class="bp_style3"></td>
	<td id="${parentId}_past">
		<table>
			<tbody>
				<tr>
					<td>
						<table border="0">
							<tbody>
							
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="Past 2 weeks" /><label for="${lastTime}">Past 2 weeks
											</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="3-4 weeks ago" /><label for="${lastTime}">3-4
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="5-8 weeks ago" /><label for="${lastTime}">5-8
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="9-12 weeks ago" /><label for="${lastTime}">9-12
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="3-6 months ago" /><label for="${lastTime}">3-6
											months ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="7-9 months ago" /><label for="${lastTime}">7-9
											months ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="10-12 months ago" /><label for="${lastTime}">10-12
											months ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="1-2 years ago" /><label for="${lastTime}">1-2 years ago</label></td>
								</tr>
								
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="3-5 years ago" /><label for="${lastTime}">3-5 years ago</label></td>
								</tr>
								
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="More than 5 years ago" /><label for="${lastTime}">More than 5 years ago</label></td>
								</tr>
								
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="Cannot remember" /><label for="${lastTime}">Cannot
											remember</label></td>
								</tr>
							</tbody>
						</table>
					</td>
					
				</tr>
			</tbody>
		</table>
		<c:set var="cantRemember" value="${lastTime}" scope="request"/> 
	</td>
</tr>


<tr>
	<td colspan="2" id="${lastTime}_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
</tr>

<!-- start testing -->

<tr id="${parentId}_c1" class="mh_hide">
	<td id="${currentEpisode}_current" colspan="2"><span><span id="numbering2">[i].</span> <fmt:message
				key="backpain.shooting.pain.currentEpisode" />
	</span></td>
</tr>

<tr id="${parentId}_c1" class="mh_hide">
	<td colspan="1" class="bp_style3"></td>
	<td id="${currentEpisode}_current">
		<table>
			<tbody>
				<tr>
					<td>
						<table border="0">
							<tbody>
							
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="Past 2 weeks" /><label for="${currentEpisode}">Past 2 weeks
											</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="3-4 weeks ago" /><label for="${currentEpisode}">3-4
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="5-8 weeks ago" /><label for="${currentEpisode}">5-8
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="9-12 weeks ago" /><label for="${currentEpisode}">9-12
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="3-6 months ago" /><label for="${currentEpisode}">3-6
											months ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="7-9 months ago" /><label for="${currentEpisode}">7-9
											months ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="10-12 months ago" /><label for="${currentEpisode}">10-12
											months ago</label></td>
								</tr>
								

								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="1-2 years ago" /><label for="${currentEpisode}">1-2 years ago</label></td>
								</tr>
								
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="3-5 years ago" /><label for="${currentEpisode}">3-5 years ago</label></td>
								</tr>
								
								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="More than 5 years ago" /><label for="${currentEpisode}">More than 5 years ago</label></td>
								</tr>

								<tr>
									<td><form:radiobutton path="${currentEpisode}"
											value="Cannot remember" /><label for="${currentEpisode}">Cannot
											remember</label></td>
								</tr>
							</tbody>
						</table>
					</td>
					
				</tr>
			</tbody>
		</table>
		<c:set var="cantRemember" value="${currentEpisode}" scope="request"/>
	</td>
</tr>

<!--End Start Testing  -->




<tr>
	<td colspan="2" id="${currentEpisode}_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
</tr>
<tr id="${parentId}_c" class="mh_hide">
	<td colspan="2"><span><span id="numbering3">[ii].</span> <fmt:message
				key="backpain.shooting.pain.first" />
	</span></td>
</tr>
<tr id="${parentId}_c" class="mh_hide">
	<td colspan="1" class="bp_style3"></td>
	<td>
		<table>
			<tbody>
				<tr>
					<td>
						<table id="question46_RadioButton" border="0">
							<tbody>
								<tr>
									<td><form:radiobutton path="${firstTime}"
											value="Past year" /><label for="${firstTime}">Past
											year</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${firstTime}"
											value="1-2 years ago" /><label for="${firstTime}">1-2
											years ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${firstTime}"
											value="3-5 years ago" /><label for="${firstTime}">3-5
											years ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${firstTime}"
											value="More than 5 years ago" /><label for="${firstTime}">More
											than 5 years ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${firstTime}"
											value="Cannot remember" /><label for="${firstTime}">Cannot
											remember</label></td>
								</tr>
							</tbody>
						</table>
					</td>					
				</tr>
			</tbody>
		</table>
	</td>
</tr>
<tr>
	<td  colspan="2" id="${firstTime}_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
</tr>


<c:if test="${parentId == 'question33' || parentId == 'question34' || parentId == 'question35' || parentId == 'question36' || parentId == 'question291' || parentId == 'question292' || parentId == 'question293'}">


<!-- Testing starts here -->

<tr id="${parentId}_c5" class="mh_hide">
	<td colspan="2" id="${parentId}_qc4"><span><span id="numbering4">[iii].</span> <fmt:message
				key="backpain.shooting.pain.currently" />
	</span></td>
</tr>
<tr id="${parentId}_c" class="mh_hide">
	<td colspan="1" class="bp_style3"></td>
	<td>
		<table>
			<tbody>
				<tr>
					<td id="${parentId}_qc5">
						<table id="question_RadioButton" border="0">
							<tbody>
								<tr>
									<td><form:radiobutton path= "${have}"
											value="Left side" /><label for="question_currentlyHave">Left side</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${have}"
											value="Right side" /><label for="question_currentlyHave">Right side</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${have}"
											value="Both side" /><label for="question_currentlyHave">Both sides</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr>
			</tbody>
		</table>
	</td>
</tr>
<tr>
	<td  colspan="2" id="${have}_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
</tr>

<tr id="${parentId}_c" class="mh_hide">
	<td colspan="2" id="${parentId}_qc6"><span>[iii]. <fmt:message
				key="backpain.shooting.pain.past" />
	</span></td>
</tr>
<tr id="${parentId}_c8" class="mh_hide">
	<td colspan="1" class="bp_style3"></td>
	<td id="${parentId}_qc7">
		<table>
			<tbody>
				<tr>
					<td>
						<table id="question_RadioButton" border="0">
							<tbody>
								<tr>
									<td><form:radiobutton path= "${had}"
											value="Left side" /><label for="question_had">Left side</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${had}"
											value="Right side" /><label for="question_had">Right side</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${had}"
											value="Both side" /><label for="question_had">Both sides</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${had}"
											value="Cannot remember" /><label for="question_had">Cannot remember</label></td>
								</tr>
								
							</tbody>
						</table>
					</td>					
				</tr>
			</tbody>
		</table>
	</td>
</tr>
<tr>
	<td  colspan="2" id="${had}_error" class="mh_hide"><span class="errors" >Please provide answer.</span></td>
</tr>

<!-- end testing here  -->

</c:if>

<c:if test="${parentId == 'question34' || parentId == 'question35' || parentId == 'question36' || parentId == 'question291' || parentId == 'question292' || parentId == 'question293'}">

 <jsp:include page="backPainQ6Sub.jsp" />
	
</c:if>
<!-- <tr>
	<td colspan="2">&nbsp;</td>
</tr> -->
<tr>
	<td id="table_data_row" colspan="2" style="border-top: dotted 1px black;" class="mh_hide"></td>
</tr>
