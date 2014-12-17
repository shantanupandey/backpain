<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tr id="${parentId}_c1" class="mh_hide">
	<td colspan="2"><span>[i]. <fmt:message
				key="backpain.shooting.pain.last" />
	</span></td>
</tr>
<tr id="${parentId}_c2" class="mh_hide">
	<td colspan="1" class="bp_style3"></td>
	<td>
		<table>
			<tbody>
				<tr>
					<td>
						<table border="0">
							<tbody>

								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="Past 2 weeks" /><label for="${lastTime}">Past
											2 weeks </label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="3-4 weeks ago" /><label for="${lastTime}">3-4
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="5-6 weeks ago" /><label for="${lastTime}">5-6
											weeks ago</label></td>
								</tr>
								<tr>
									<td><form:radiobutton path="${lastTime}"
											value="7-8 weeks ago" /><label for="${lastTime}">7-8
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
											value="More than a year ago" /><label for="${lastTime}">More
											than a year ago</label></td>
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
	</td>
</tr>
<tr>
<tr id="${parentId}_cab" class="mh_hide">

	<td colspan="2"><span id="">[C] <fmt:message
				key="question33" />
	</span></td>
</tr>

<tr id="${parentId}_cba">
	<td colspan="1" id="question273_a1" class="mh_hide">&nbsp;</td>
	<td class="mh_hide" id="question273_b">
		<table>
			<tbody>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><form:radiobutton path="question33" value="Yes I have" />
										<label for="question33">Yes I currently have it</label></td>
									<td><form:radiobutton path="question33" value="Yes I had" />
										<label for="question33">Yes I had it in the past</label></td>
									<td><form:radiobutton path="question33" value="No" /> <label
										for="question33">No I have never had any</label></td>

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
	<td id="question33_error" class="mh_hide"><span class="errors">Please
			provide answer.</span></td>
</tr>
<c:set var="parentId" value="question33" scope="request" />
<c:set var="lastTime" value="question41" scope="request" />
<c:set var="firstTime" value="question42" scope="request" />
<jsp:include page="backPainQ6.jsp" />



<!-- Testing of question start-->



<!-- end testing of question -->


<tr>
	<td colspan="2" class="mh_hide" id="question273_c"><span id="">[D]
			<fmt:message key="question34" />
	</span></td>
</tr>
<tr>
	<td colspan="1" id="question273_a2" class="mh_hide">&nbsp;</td>
	<td class="mh_hide" id="question273_d">
		<table>
			<tbody>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><form:radiobutton path="question34" value="Yes I have" />
										<label for="question34">Yes I currently have it</label></td>
									<td><form:radiobutton path="question34" value="Yes I had" />
										<label for="question34">Yes I had it in the past</label></td>
									<td><form:radiobutton path="question34" value="No" /> <label
										for="question34">No I have never had any</label></td>

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
	<td id="question34_error" class="mh_hide"><span class="errors">Please
			provide answer.</span></td>
</tr>
<c:set var="parentId" value="question34" scope="request" />
<c:set var="lastTime" value="question43" scope="request" />
<c:set var="firstTime" value="question44" scope="request" />
<jsp:include page="backPainQ6.jsp" />


<tr>
	<td colspan="2" class="mh_hide" id="question273_e"><span id="">[E]
			<fmt:message key="question35" />
	</span></td>
</tr>
<tr>
	<td colspan="1" id="question273_a3" class="mh_hide">&nbsp;</td>
	<td class="mh_hide" id="question273_f">
		<table>
			<tbody>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><form:radiobutton path="question35" value="Yes I have" />
										<label for="question35">Yes I currently have it</label></td>
									<td><form:radiobutton path="question35" value="Yes I had" />
										<label for="question35">Yes I had it in the past</label></td>
									<td><form:radiobutton path="question35" value="No" /> <label
										for="question35">No I have never had any</label></td>

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
	<td id="question35_error" class="mh_hide"><span class="errors">Please
			provide answer.</span></td>
</tr>
<c:set var="parentId" value="question35" scope="request" />
<c:set var="lastTime" value="question45" scope="request" />
<c:set var="firstTime" value="question46" scope="request" />
<jsp:include page="backPainQ6.jsp" />



<tr>
	<td colspan="2" class="mh_hide" id="question273_g"><span id="">[F]
			<fmt:message key="question36" />
	</span></td>
</tr>
<tr>
	<td colspan="1" id="question273_a4" class="mh_hide">&nbsp;</td>
	<td class="mh_hide" id="question273_h">
		<table>
			<tbody>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><form:radiobutton path="question36" value="Yes I have" />
										<label for="question36">Yes I currently have it</label></td>
									<td><form:radiobutton path="question36" value="Yes I had" />
										<label for="question36">Yes I had it in the past</label></td>
									<td><form:radiobutton path="question36" value="No" /> <label
										for="question36">No I have never had any</label></td>

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
	<td id="question36_error" class="mh_hide"><span class="errors">Please
			provide answer.</span></td>
</tr>


<c:set var="parentId" value="question36" scope="request" />
<c:set var="lastTime" value="question189" scope="request" />
<c:set var="firstTime" value="question260" scope="request" />
<jsp:include page="backPainQ6.jsp" />

</tbody>



