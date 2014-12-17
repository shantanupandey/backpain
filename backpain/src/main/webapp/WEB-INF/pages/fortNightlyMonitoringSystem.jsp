<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${setFormVal eq 3}">

	<c:if test="${flagsValue[1].flag eq 1}">
		<tr>
			<td colspan="2">1. <fmt:message
					key="questionFortnightlyMoniter1" />
			</td>
		</tr>

		<tr>
			<td style="padding-left: 72px;">Lower back:</td>

			<td><form:radiobutton path="question483" value="1" /> <label
				for="sex">Yes</label> <form:radiobutton path="question483" value="" />
				<label for="sex">No</label></td>

		</tr>
		<tr id="question483_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>

		<tr>
			<td style="padding-left: 72px; width: 176px;">Groin , buttock
				,leg or foot</td>
			<td><form:radiobutton path="question484" value="1"
					onclick="fortNightQuestion();" /> <label for="sex">Yes</label> <form:radiobutton
					path="question484" value="" onclick="fortNightQuestion();" /> <label
				for="sex">No</label></td>
		</tr>
		<tr id="question484_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>


		<tr id="question_id_458" class="mh_hide">
			<td colspan="1" class="style3"></td>
			<td>



				<table>
					<tbody>
						<tr>
							<td><form:checkbox path="question458" value="1" /><label>Groin</label></td>
						</tr>
						<tr>
							<td><form:checkbox path="question458" value="2" /><label>Left
									buttock</label></td>
							<td><form:checkbox path="question458" value="3" /><label>Right
									buttock </label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question458" value="4" /><label>Front
									of left thigh</label></td>
							<td><form:checkbox path="question458" value="5" /><label>Front
									of right thigh</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question458" value="6" /><label>Back
									of left thigh</label></td>
							<td><form:checkbox path="question458" value="7" /><label>Back
									of right thigh</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question458" value="8" /><label>Left
									shin or calf</label></td>
							<td><form:checkbox path="question458" value="9" /><label>Right
									shin or calf</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question458" value="10" /><label>Left
									foot</label></td>
							<td><form:checkbox path="question458" value="11" /><label>Right
									foot</label></td>
						</tr>
					</tbody>
				</table>



			</td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question458"
					cssClass="errors" /></td>
		</tr>
		<tr id="question458_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
	</c:if>

	<c:if test="${flagsValue[2].flag eq 1}">

		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">2. <fmt:message
					key="questionFortnightlyMoniter2" />
			</td>
		</tr>


		<tr>
			<td style="padding-left: 72px;">Groin, buttock , leg</td>
			<td><form:radiobutton path="question487" value="1"
					onclick="fortNightQuestion1();" /> <label for="sex">Yes</label> <form:radiobutton
					path="question487" value="" onclick="fortNightQuestion1();" /> <label
				for="sex">No</label></td>
		</tr>
		<tr id="question487_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>




		<tr id="question_id_459" class="mh_hide">
			<td class="style3" colspan="1"></td>
			<td>



				<table>
					<tbody>
						<tr>
							<td><form:checkbox path="question459" value="1" /><label>Groin</label></td>
						</tr>
						<tr>
							<td><form:checkbox path="question459" value="2" /><label>Left
									buttock</label></td>
							<td><form:checkbox path="question459" value="3" /><label>Right
									buttock </label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question459" value="4" /><label>Front
									of left thigh</label></td>
							<td><form:checkbox path="question459" value="5" /><label>Front
									of right thigh</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question459" value="6" /><label>Back
									of left thigh</label></td>
							<td><form:checkbox path="question459" value="7" /><label>Back
									of right thigh</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question459" value="8" /><label>Left
									shin or calf</label></td>
							<td><form:checkbox path="question459" value="9" /><label>Right
									shin or calf</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question459" value="10" /><label>Left
									foot</label></td>
							<td><form:checkbox path="question459" value="11" /><label>Right
									foot</label></td>
						</tr>
					</tbody>
				</table>



			</td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question459"
					cssClass="errors" /></td>
		</tr>
		<tr id="question459_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</c:if>

	<c:if test="${flagsValue[3].flag eq 1}">
		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">3. <fmt:message
					key="questionFortnightlyMoniter3" />
			</td>
		</tr>

		<tr>
			<td style="padding-left: 72px;">Left or right leg:</td>
			<td><form:radiobutton path="question490" value="1"
					onclick="fortNightQuestion2();" /> <label for="sex">Yes</label> <form:radiobutton
					path="question490" value="" onclick="fortNightQuestion2();" /> <label
				for="sex">No</label></td>
		</tr>
		<tr id="question490_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>


		<tr id="question_id_460" class="mh_hide">
			<td class="style4" colspan="1"></td>
			<td>


				<table>
					<tbody>
						<tr>
							<td><form:checkbox path="question460" value="1" /><label>Left
									thigh</label></td>
							<td><form:checkbox path="question460" value="2" /><label>Right
									thigh</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question460" value="3" /><label>Left
									shin or calf</label></td>
							<td><form:checkbox path="question460" value="4" /><label>Right
									shin or calf</label></td>
						</tr>

						<tr>
							<td><form:checkbox path="question460" value="5" /><label>Left
									foot or ankle</label></td>
							<td><form:checkbox path="question460" value="6" /><label>Right
									foot or ankle</label></td>
						</tr>
					</tbody>
				</table>



			</td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question460"
					cssClass="errors" /></td>
		</tr>
		<tr id="question460_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</c:if>

	<c:if test="${flagsValue[4].flag eq 1}">
		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">4. <fmt:message
					key="questionFortnightlyMoniter4" />
			</td>
		</tr>
		<tr>
			<td class="style3" colspan="1"></td>
			<td><form:select path="question461" cssStyle="width:250px;">
					<form:option value="0" label="Select an option" />
					<form:option value="Less than a quarter of the way up" />
					<form:option value="About a quarter of the way up" />
					<form:option value="About half way up" />
					<form:option value="More than half way up" />
				</form:select></td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question461"
					cssClass="errors" /></td>
		</tr>
		<tr id="question461_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td colspan="2" style="border-top: dotted 1px black;"><fmt:message
					key="questionFortnightlyMoniter4.1" /></td>
		</tr>

		<tr>
			<td class="style3" colspan="1"></td>
			<td>
				<table>
					<tbody>
						<tr>

							<td><form:select path="question462" cssStyle="width:250px;">
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
			<td colspan="2"><form:errors path="question462"
					cssClass="errors" /></td>
		</tr>
		<tr>
			<td class="style3" colspan="1"></td>
			<td id="question84_WU" class="mh_hide"><form:textarea
					path="question125" rows="2" cols="20"
					cssStyle="height:60px;width:352px;" /></td>
		</tr>
		<tr id="question462_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</c:if>

	<c:if test="${flagsValue[0].flag eq 1}">

		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">5. <fmt:message
					key="questionFortnightlyMoniter5" />
			</td>
		</tr>
		<tr>
			<td class="style3" colspan="1"></td>
			<td><form:select path="question457" cssStyle="width:250px;"
					onchange="newLegQuestion3();">
					<form:option value="0" label="Select an option" />
					<form:option value="1" label="Leg/Foot" />
					<form:option value="2" label="Lower back" />

				</form:select></td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question457"
					cssClass="errors" /></td>
		</tr>
		<tr id="question457_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>

		<!--New leg question  -->
		<tr>
			<td colspan="2" id="subLegQuestion" class="mh_hide"><fmt:message
					key="newLegQuestion" /></td>
		</tr>


		<tr>
			<td class="style3" colspan="1"></td>
			<td id="subLegQuestion_answer" class="mh_hide"><form:select
					path="question496" cssStyle="width:250px;">
					<form:option value="" label="Select an option" />
					<form:option value=">3/4"
						label="Worse for more than 3/4 of the time" />
					<form:option value="1/2" label="Worse for about 1/2 the time" />
					<form:option value="<1/4"
						label="Worse for less than 1/4 of the time" />
					<form:option value="0" label="Never worse" />

				</form:select></td>
		</tr>
		<!--End new leg question -->
	</c:if>

	<c:if test="${flagsValue[6].flag eq 1}">

		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">6. <fmt:message
					key="questionFortnightlyMoniter6" />
			</td>
		</tr>
		<tr>
			<td class="style3" colspan="1"></td>
			<td><form:select path="question463" cssStyle="width:250px;">
					<form:option value="0" label="Select an option" />
					<form:option value="1" label="None" />
					<form:option value="2" label="Less than 4" />
					<form:option value="3" label="4 - 8" />
					<form:option value="4" label="8 - 12" />
					<form:option value="5" label="More than 12" />
				</form:select></td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question463"
					cssClass="errors" /></td>
		</tr>
		<tr id="question463_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</c:if>

	<c:if test="${flagsValue[7].flag eq 1}">

		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">7. <fmt:message
					key="questionFortnightlyMoniter7" />
			</td>
		</tr>
		<tr>
			<td class="style3" colspan="1"></td>
			<td><form:radiobutton path="question464" value="1"
					onclick="fortNightQuestion3();" /> <label for="sex">Yes</label> <form:radiobutton
					path="question464" value="" onclick="fortNightQuestion3();" /> <label
				for="sex">No</label></td>
		</tr>

		<tr id="yogaTimeFortnighly" class="mh_hide">
			<td style="padding-left: 1px;">About how long was it?</td>
			<td><form:textarea path="question493" cols="5" rows="1"
					onkeypress="return isNumberKey(event);" /></td>
		</tr>

		<tr>
			<td colspan="2"><form:errors path="question464"
					cssClass="errors" /></td>
		</tr>
		<tr id="question464_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</c:if>

	<c:if test="${flagsValue[8].flag eq 1}">

		<tr>
			<td colspan="2" style="border-top: dotted 1px black;">8. <fmt:message
					key="questionFortnightlyMoniter8" />
			</td>
		</tr>
		<tr>
			<td class="style3" colspan="1"></td>
			<td>
				<table>
					<tbody>
						<tr>
							<td><form:textarea path="question465" cols="20" rows="2"
									cssStyle="height:76px;width:401px;" /> <span
								id="question87_other_error" class="errors mh_hide">Please
									provide detail</span></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2"><form:errors path="question465"
					cssClass="errors" /></td>
		</tr>
		<tr id="question465_error" class="mh_hide">
			<td colspan="2"><span class="errors">Please provide
					detail</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</c:if>
</c:if>