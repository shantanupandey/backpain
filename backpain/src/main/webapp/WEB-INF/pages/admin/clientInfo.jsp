<tr>
	<td colspan="2"><br/>
		<fieldset>
			<table>
				<tbody>
					<tr>
						<td width="100px"><b>Full Name :</b></td>
						<td><span>${client.foreName} ${client.surName}</span></td>
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
		</fieldset></td>
</tr>
<tr>
	<td colspan="2" align="right">
		<fieldset>
			<input onclick="window.location='${contextPath}/admin/${client.clientId}/recordReportList.html';" 	value="Back To Record List"	type="button">
		</fieldset>
	</td>
</tr>
