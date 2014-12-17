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

       							 <div id="assessment">
            
            						<table width="727" border="0" cellpadding="0" cellspacing="0" class="tbl_Grid" id="orignal">
										
																			
										   <c:set var="clientId" value="${questionId}"/>
										   	<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    															
																<th scope="col" style="border: 1px solid black;border-top-color:#990000" colspan="2"></th>
																
										    </tr>								
										
											<!-- Write content here -->
											<tr><%-- <td colspan="2" align="center" style="width: 86px;"><b>User Name :</b>&nbsp;&nbsp;${userId}	</td> --%>
											<td colspan="2" align="left" style="width: 86px;"><p align="center"><b>ASSESSMENT REPORT FOR &nbsp <upper>${fname}&nbsp;${lname}</upper></b></p>
											<p><textarea name="comment1" id="comment1" style="width: 111px; height: 17px;">${comment1} </textarea>
											 <script>
									            CKEDITOR.replace( 'comment1' );
									        </script>
									        </P>
									        
									        <p><b><center>Precautions</center></b></p>
									        <P>   
									         <textarea id="comment2" name="comment2" style="width: 111px; height: 17px;">${comment2} </textarea>
									          <script>
									            CKEDITOR.replace( 'comment2' );
									        </script></P>
									        
									        <p><b><center>Exercises</center></b></p>
											<p><textarea id="comment3" name="comment3" style="width: 111px; height: 17px;">${comment3} </textarea>
											 <script>
									            CKEDITOR.replace( 'comment3' );
									        </script>
											</p>
											
											<p><b><center>Tracking</center></b></p>
											<P><textarea id="comment4" name="comment4" style="width: 111px; height: 17px;">${comment4}</textarea>
											 <script>
									            CKEDITOR.replace( 'comment4' );
									            editor.resize( '100%', '350', true )
									         </script>
									            </p>
									            
											<p><b><center>CALBA</center></b></p>
											<p>We hope that this assessment, and advice on what to do, is useful to you.  Only CALBA provides this service.<br>CALBA is based on many years of clinical experience and research, and has been created largely by voluntary work without external funding. The continuation and further development of this service are dependent upon donations. We invite you to help support this work. </p>
											<br>
											<!-- <p>With best wishes</p> -->
											
											<%-- <p><center>The CALBA Team</center> --%>
											</p>
											<%-- <p>Email:  <input type="email" id="comment5" style="width: 180px; height: 17px;" value="${comment5}"></input> </p>
											<a href="www.CALBA.net">www.CALBA.net</a> --%>
											
											<p><center><a href="#">Click here to make a Donation</a></center></p>
											<p>If you prefer not to make a donation just now, then: </p>
											<p><center><a href="#">Click here to skip Donations page</a></center></p>
											
											
											</td>
											</tr>
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<input type="hidden" value="${userId}" id="user"/>									
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<!-- <tr><td>
											<textarea id="careComments" rows="7" cols="50" style="margin-left: 183px;">											</textarea>
											</td>
											</tr> -->
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<tr>
											<td colspan="2" align="middle">
											<input type="button" value="assign" align="middle" onclick="assignAssessmentSystem();"/>
											<input type="button" value="preview" align="middle" onclick="checkPreview();"/>
											</td>
											
											</tr>
											
											<!--End write content here  -->
											
											
											
										</tr>
									</table>
									
									 </div>
			
									
									<!-- Preview  -->
									<div id="printableArea">
									<table width="727" border="0" cellpadding="0" cellspacing="0" class="mh_hide" bgcolor="#fff4d1" id="printView">
										
										<tr	style="color: White; background-color: #990000; font-weight: bold;">
															    															
																<th scope="col" style="border: 1px solid black;border-top-color:#990000" colspan="2"></th>
																
										</tr>
										
										   										
										
											<!-- Write content here -->
											<tr>
											<td colspan="2" align="left" style="width: 86px;"><p align="center"><b>ASSESSMENT REPORT FOR &nbsp <upper>${fname}&nbsp;${lname}</upper></b></p>
											<p><label id="hidecomment1"></label></p>
											
											<p><b><center>Precautions</center></b></p>
                                            <P><label id="hidecomment2"></label></p>
                                            
                                            <p><b><center>Exercises</center></b></p>
											<p><label id="hidecomment3"></label>
											
											<p><b><center>Tracking</center></b></p>
											<p><label id="hidecomment4"></label></p>
											</p>
											

											<p><b><center>CALBA</center></b></p>
											<p>We hope that this assessment, and advice on what to do, is useful to you.  Only CALBA provides this service.<br>CALBA is based on many years of clinical experience and research, and has been created largely by voluntary work without external funding. The continuation and further development of this service are dependent upon donations. We invite you to help support this work. </p>
											<br>
											<%-- <p>With best wishes</p>
											
											<p><center>The CALBA Team</center> --%>
											</p>
											<!-- <p>Email:  <label id="hidecomment5"></label><br>
											<a href="www.CALBA.net">www.CALBA.net</a></td> -->
											<p><center><a href="#">Click here to make a Donation</a></center></p>
											<p>If you prefer not to make a donation just now, then: </p>
											<p><center><a href="#">Click here to skip Donations page</a></center></p>
											
											</tr>
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<input type="hidden" value="${userId}" id="user"/>									
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<!-- <tr><td>
											<textarea id="careComments" rows="7" cols="50" style="margin-left: 183px;">											</textarea>
											</td>
											</tr> -->
											<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
											<tr>
											
											<td colspan="2" align="middle">
										    <input type="button" value="back" align="middle" onclick="backOriginal();"/>
											</td>
											
											
											</tr>
											
											<!--End write content here  -->
											
											
											
										</tr>
									</table>
									</div>
									<!-- End Preview -->
									
									
									
									<table>
									<tr><div  style="display: none;text-align: center;" align="center" id="waitImage">
									      <img title="wait" style="align-self:center;float:none!important;" align="center" src="<%=request.getContextPath()%>/images/spinner.gif" alt="Wait"/><font color="green">Please wait</font></div></tr>
									<tr><div id="message" style="display:none" align="center"><font color="green" size="3px">Updated Successfully.</font></div></tr>
								    </table>
								    <table>
								           
											
									</table>
											
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<jsp:include page="adminFooter.jsp" />
		</tbody>
	</table></table>

</body>
</html>