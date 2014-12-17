package net.calba.backpain.form;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.validator.constraints.NotEmpty;

public class BackPainForm extends BaseForm {
	
	
	public static final int QUESTION_19 = 19;
	public static final int QUESTION_120 = 120;
	public static final int QUESTION_121 = 121;
	public static final int QUESTION_122 = 122;
	public static final int QUESTION_123 = 123;
	public static final int QUESTION_124 = 124;
	
	
	private String[] painArray = {"No Pain", "Diffuse Pain",
			"Sharp, localised pain", "Shooting pain along clearly-defined track",
			"Burning pain","Other","Cannot remember"};
		
		
	private List<String> painTypes;
	
	
    private Integer clientId;
	
	@NotEmpty(message="Please provide answer")
	private String question15 = "";
	@NotEmpty(message="Please provide answer")
	private String question16 = "";
	@NotEmpty(message="Please provide answer")
	private String question17 = "";
	@NotEmpty(message="Please provide answer")
	private String question18 = "";
	private String []question19 = {};
	
	@NotEmpty(message="Please provide answer")
	private String question21 = "";
	
	/* Question 21  children  end */
	
	@NotEmpty(message="Please provide answer")
	private String question22 = "";
	
	/* Question 22  children  when value Yes */
	private String []question123 = {};	
	private String []question124 = {};
	/* Question 22  children  end */
	
	
	private String question24 = "";
	
	
	
	private String question28 = "";
	
	private String question29 = "";
	
	private String question30 = "";
	
	private String question31 = "";
	
	/* Q5 Do any of the following ease the pain ? ?  */
	private String question164 = "";
	private String question165 = "";
	private String question166 = "";
	private String question167 = "";
	private String question273 = "";
	private String question_currentlyHave = "";
	private String question_had = "";

	
	
	
	
	/* Form  Q 6 [A] */
	@NotEmpty(message="Please provide answer")
	private String question20 = "";
	
	/* Form  Q 6 [B] */
	private String question32 = "";
	
	/* Form  Q 6 [C] */
	private String question33 = "";
	
	/* Form  Q 6 [D] */
	private String question34 = "";
	
	/* Form  Q 6 [E] */	
	private String question35 = "";
	
	/* Form  Q 6 [F] */	
	private String question36 = "";
	
	/* Form  Q 6 [A]  part two when  Q 6 [A] question20 value Yes */	
	private String question37 = "";
	private String question38 = "";
	
	/* Form  Q 6 [B]  part two when  Q 6 [B] question32 value Yes */		
	private String question39 = "";
	private String question40 = "";
	
	/* Form  Q 6 [C]  part two when  Q 6 [C] question33 value Yes */		
	private String question41 = "";	
	private String question42 = "";
	private String question274 = "";	
	private String question275 = "";
	
	/* Form  Q 6 [D]  part two when  Q 6 [D] question34 value Yes */
	private String question43 = "";
	private String question44 = "";
	private String question276 = "";	
	private String question277 = "";
	private String question282 = "";
	private String question283 = "";
	private String question284 = "";
	private String question285 = "";
	private String question286 = "";
	private String question287 = "";
	private String question288 = "";
	private String question289 = "";
	private String question290 = "";
	
	/* Form  Q 6 [E]  part two when  Q 6 [E] question35 value Yes */
	private String question45 = "";
	private String question46 = "";	
	private String question278 = "";	
	private String question279 = "";
	
	/* Form  Q 6 [F]  part two when  Q 6 [F] question36 value Yes */
	private String question189 = "";
	private String question260 = "";
	private String question280 = "";	
	private String question281 = "";
	
	/* Form  Q 6 [D]  part three when  Q 6 [D] question34 value Yes */
	private String question261 = "";	
	private String question262 = "";
	
	/* Form  Q 6 [E]  part three when  Q 6 [E] question35 value Yes */
	private String question263 = "";
	private String question264 = "";
	
	/* Form  Q 6 [F]  part three when  Q 6 [F] question36 value Yes */
	private String question265 = "";
	private String question266 = "";
	private String question267 = "";
	private String question268 = "";
	private String question269 = "";
	private String question270 = "";
	private String question271 = "";
	private String question272 = "";
	
	/* Q7 when yes [A]  One the left side has there been loss of feeling or pins & needles at any of the following sites ?  */
	private String question191 = "";
	private String question192 = "";
	private String question193 = "";
	private String question194 = "";
	private String question195 = "";
	private String question196 = "";
	
	
	/*  Q7 when yes [B] One the right side has there been loss of feeling or pins & needles at any of the following sites ?   */
	
	private String question199 = "";
	private String question200  = "";
	private String question201  = "";
	private String question202  = "";
	private String question203  = "";
	private String question204  = "";
	
	/*  Q7 when yes [C] Has there been any loss of feeling or pins & needles in your:   */
	
	private String question206  = "";
	private String question207  = "";
	
	
	/* Q8 when yes [A]  In your left leg do you have any weakness or loss of power in the following areas ?  */
	private String question209 = "";
	private String question210 = "";
	private String question211 = "";
	private String question212 = "";

	/* Q8 when yes [B]  In your right leg do you have any weakness or loss of power in the following areas ? */
	private String question214 = "";
	private String question215 = "";
	private String question216 = "";
	private String question217 = "";
	
    /*Q6[H],Q6[I],Q6[J]*/
	private String question291 = "";
	private String question292 = "";
	private String question293 = "";
	private String question294 = "";
	private String question295 = "";
	private String question296 = "";
	private String question297 = "";
	private String question298 = "";
	private String question299 = "";
	private String question300 = "";
	private String question301 = "";
	private String question302 = "";
	private String question303 = "";
	private String question304 = "";
	private String question305 = "";
	private String question306 = "";
	private String question307 = "";
	private String question308 = "";
	private String question309 = "";
	private String question310 = "";
	private String question311 = "";
	
	private String question438 = "";
	private String sendMessage;

	
	

	public String getQuestion438() {
		return question438;
	}

	public void setQuestion438(String question438) {
		this.question438 = question438;
	}

	public BackPainForm() {
		this(0);	
		
	}

	public BackPainForm(Integer clientFormId) {
		super(clientFormId);
		painTypes = new ArrayList<String>();
		Collections.addAll(painTypes, painArray);
	}
	
	/**
	 * @return the clientId
	 */
	public final Integer getClientId() {
		return clientId;
	}

	/**
	 * @param clientId the clientId to set
	 */
	public final void setClientId(Integer clientId) {
		this.clientId = clientId;
	}	
	
	public List<String>  getPainTypes() {		
		return painTypes;
	}


	public String getQuestion15() {
		return question15;
	}

	public void setQuestion15(String question15) {
		this.question15 = question15;
	}

	public String getQuestion16() {
		return question16;
	}

	public void setQuestion16(String question16) {
		this.question16 = question16;
	}

	public String getQuestion17() {
		return question17;
	}

	public void setQuestion17(String question17) {
		this.question17 = question17;
	}

	public String getQuestion18() {
		return question18;
	}

	public void setQuestion18(String question18) {
		this.question18 = question18;
	}

	public String[] getQuestion19() {
		return question19;
	}

	public void setQuestion19(String[] question19) {
		this.question19 = question19;
	}

	public String getQuestion20() {
		return question20;
	}

	public void setQuestion20(String question20) {
		this.question20 = question20;
	}

	public String getQuestion21() {
		return question21;
	}

	public void setQuestion21(String question21) {
		this.question21 = question21;
	}

	public String getQuestion22() {
		return question22;
	}

	public void setQuestion22(String question22) {
		this.question22 = question22;
	}

	public String getQuestion24() {
		return question24;
	}

	public void setQuestion24(String question24) {
		this.question24 = question24;
	}

	

	public String getQuestion28() {
		return question28;
	}

	public void setQuestion28(String question28) {
		this.question28 = question28;
	}

	public String getQuestion29() {
		return question29;
	}

	public void setQuestion29(String question29) {
		this.question29 = question29;
	}

	public String getQuestion30() {
		return question30;
	}

	public void setQuestion30(String question30) {
		this.question30 = question30;
	}

	public String getQuestion31() {
		return question31;
	}

	public void setQuestion31(String question31) {
		this.question31 = question31;
	}

	public String getQuestion32() {
		return question32;
	}

	public void setQuestion32(String question32) {
		this.question32 = question32;
	}	

	public String getQuestion33() {
		return question33;
	}

	public void setQuestion33(String question33) {
		this.question33 = question33;
	}

	public String getQuestion34() {
		return question34;
	}

	public void setQuestion34(String question34) {
		this.question34 = question34;
	}

	public String getQuestion35() {
		return question35;
	}

	public void setQuestion35(String question35) {
		this.question35 = question35;
	}

	public String getQuestion36() {
		return question36;
	}

	public void setQuestion36(String question36) {
		this.question36 = question36;
	}

	public String getQuestion37() {
		return question37;
	}

	public void setQuestion37(String question37) {
		this.question37 = question37;
	}

	public String getQuestion38() {
		return question38;
	}

	public void setQuestion38(String question38) {
		this.question38 = question38;
	}

	public String getQuestion39() {
		return question39;
	}

	public void setQuestion39(String question39) {
		this.question39 = question39;
	}

	public String getQuestion40() {
		return question40;
	}

	public void setQuestion40(String question40) {
		this.question40 = question40;
	}

	public String getQuestion41() {
		return question41;
	}

	public void setQuestion41(String question41) {
		this.question41 = question41;
	}

	public String getQuestion42() {
		return question42;
	}

	public void setQuestion42(String question42) {
		this.question42 = question42;
	}

	public String getQuestion43() {
		return question43;
	}

	public void setQuestion43(String question43) {
		this.question43 = question43;
	}

	public String getQuestion44() {
		return question44;
	}

	public void setQuestion44(String question44) {
		this.question44 = question44;
	}

	public String getQuestion45() {
		return question45;
	}

	public void setQuestion45(String question45) {
		this.question45 = question45;
	}

	public String getQuestion46() {
		return question46;
	}

	public void setQuestion46(String question46) {
		this.question46 = question46;
	}
	



	public String[] getQuestion123() {
		return question123;
	}

	public void setQuestion123(String[] question123) {
		this.question123 = question123;
	}

	public String[] getQuestion124() {
		return question124;
	}

	public void setQuestion124(String[] question124) {
		this.question124 = question124;
	}
	

	
	public String getQuestion274() {
		return question274;
	}

	public void setQuestion274(String question274) {
		this.question274 = question274;
	}

	public String getQuestion275() {
		return question275;
	}

	public void setQuestion275(String question275) {
		this.question275 = question275;
	}

	public String getQuestion276() {
		return question276;
	}

	public void setQuestion276(String question276) {
		this.question276 = question276;
	}

	public String getQuestion277() {
		return question277;
	}

	public void setQuestion277(String question277) {
		this.question277 = question277;
	}

	public String getQuestion278() {
		return question278;
	}

	public void setQuestion278(String question278) {
		this.question278 = question278;
	}

	public String getQuestion279() {
		return question279;
	}

	public void setQuestion279(String question279) {
		this.question279 = question279;
	}

	public String getQuestion280() {
		return question280;
	}

	public void setQuestion280(String question280) {
		this.question280 = question280;
	}

	public String getQuestion281() {
		return question281;
	}

	public void setQuestion281(String question281) {
		this.question281 = question281;
	}
	
	

	public String getQuestion282() {
		return question282;
	}

	public void setQuestion282(String question282) {
		this.question282 = question282;
	}

	public String getQuestion283() {
		return question283;
	}

	public void setQuestion283(String question283) {
		this.question283 = question283;
	}

	public String getQuestion284() {
		return question284;
	}

	public void setQuestion284(String question284) {
		this.question284 = question284;
	}
	
	

	public String getQuestion285() {
		return question285;
	}

	public void setQuestion285(String question285) {
		this.question285 = question285;
	}

	public String getQuestion286() {
		return question286;
	}

	public void setQuestion286(String question286) {
		this.question286 = question286;
	}

	public String getQuestion287() {
		return question287;
	}

	public void setQuestion287(String question287) {
		this.question287 = question287;
	}

	public String getQuestion288() {
		return question288;
	}

	public void setQuestion288(String question288) {
		this.question288 = question288;
	}

	public String getQuestion289() {
		return question289;
	}

	public void setQuestion289(String question289) {
		this.question289 = question289;
	}
	
	

	public String getQuestion290() {
		return question290;
	}

	public void setQuestion290(String question290) {
		this.question290 = question290;
	}

	
	
	public String getQuestion291() {
		return question291;
	}

	public void setQuestion291(String question291) {
		this.question291 = question291;
	}

	public String getQuestion292() {
		return question292;
	}

	public void setQuestion292(String question292) {
		this.question292 = question292;
	}

	public String getQuestion293() {
		return question293;
	}

	public void setQuestion293(String question293) {
		this.question293 = question293;
	}

	public String getQuestion294() {
		return question294;
	}

	public void setQuestion294(String question294) {
		this.question294 = question294;
	}

	public String getQuestion295() {
		return question295;
	}

	public void setQuestion295(String question295) {
		this.question295 = question295;
	}

	public String getQuestion296() {
		return question296;
	}

	public void setQuestion296(String question296) {
		this.question296 = question296;
	}

	public String getQuestion297() {
		return question297;
	}

	public void setQuestion297(String question297) {
		this.question297 = question297;
	}

	public String getQuestion298() {
		return question298;
	}

	public void setQuestion298(String question298) {
		this.question298 = question298;
	}

	public String getQuestion299() {
		return question299;
	}

	public void setQuestion299(String question299) {
		this.question299 = question299;
	}

	public String getQuestion300() {
		return question300;
	}

	public void setQuestion300(String question300) {
		this.question300 = question300;
	}

	public String getQuestion301() {
		return question301;
	}

	public void setQuestion301(String question301) {
		this.question301 = question301;
	}

	public String getQuestion302() {
		return question302;
	}

	public void setQuestion302(String question302) {
		this.question302 = question302;
	}

	public String getQuestion303() {
		return question303;
	}

	public void setQuestion303(String question303) {
		this.question303 = question303;
	}

	public String getQuestion304() {
		return question304;
	}

	public void setQuestion304(String question304) {
		this.question304 = question304;
	}

	public String getQuestion305() {
		return question305;
	}

	public void setQuestion305(String question305) {
		this.question305 = question305;
	}

	public String getQuestion306() {
		return question306;
	}

	public void setQuestion306(String question306) {
		this.question306 = question306;
	}

	public String getQuestion307() {
		return question307;
	}

	public void setQuestion307(String question307) {
		this.question307 = question307;
	}

	public String getQuestion308() {
		return question308;
	}

	public void setQuestion308(String question308) {
		this.question308 = question308;
	}

	public String getQuestion309() {
		return question309;
	}

	public void setQuestion309(String question309) {
		this.question309 = question309;
	}

	public String getQuestion310() {
		return question310;
	}

	public void setQuestion310(String question310) {
		this.question310 = question310;
	}

	public String getQuestion311() {
		return question311;
	}

	public void setQuestion311(String question311) {
		this.question311 = question311;
	}

	/**
	 * @return the question189
	 */
	public final String getQuestion189() {
		return question189;
	}

	/**
	 * @param question189 the question189 to set
	 */
	public final void setQuestion189(String question189) {
		this.question189 = question189;
	}	

	/**
	 * @return the question260
	 */
	public final String getQuestion260() {
		return question260;
	}

	/**
	 * @param question260 the question260 to set
	 */
	public final void setQuestion260(String question260) {
		this.question260 = question260;
	}
	
	
	/**
	 * @return the question261
	 */
	public final String getQuestion261() {
		return question261;
	}

	/**
	 * @param question261 the question261 to set
	 */
	public final void setQuestion261(String question261) {
		this.question261 = question261;
	}

	/**
	 * @return the question262
	 */
	public final String getQuestion262() {
		return question262;
	}

	/**
	 * @param question262 the question262 to set
	 */
	public final void setQuestion262(String question262) {
		this.question262 = question262;
	}

	/**
	 * @return the question263
	 */
	public final String getQuestion263() {
		return question263;
	}

	/**
	 * @param question263 the question263 to set
	 */
	public final void setQuestion263(String question263) {
		this.question263 = question263;
	}

	/**
	 * @return the question264
	 */
	public final String getQuestion264() {
		return question264;
	}

	/**
	 * @param question264 the question264 to set
	 */
	public final void setQuestion264(String question264) {
		this.question264 = question264;
	}

	/**
	 * @return the question265
	 */
	public final String getQuestion265() {
		return question265;
	}

	/**
	 * @param question265 the question265 to set
	 */
	public final void setQuestion265(String question265) {
		this.question265 = question265;
	}

	/**
	 * @return the question266
	 */
	public final String getQuestion266() {
		return question266;
	}

	/**
	 * @param question266 the question266 to set
	 */
	public final void setQuestion266(String question266) {
		this.question266 = question266;
	}

	/**
	 * @return the question267
	 */
	public final String getQuestion267() {
		return question267;
	}

	/**
	 * @param question267 the question267 to set
	 */
	public final void setQuestion267(String question267) {
		this.question267 = question267;
	}

	/**
	 * @return the question268
	 */
	public final String getQuestion268() {
		return question268;
	}

	/**
	 * @param question268 the question268 to set
	 */
	public final void setQuestion268(String question268) {
		this.question268 = question268;
	}

	/**
	 * @return the question269
	 */
	public final String getQuestion269() {
		return question269;
	}

	/**
	 * @param question269 the question269 to set
	 */
	public final void setQuestion269(String question269) {
		this.question269 = question269;
	}

	/**
	 * @return the question270
	 */
	public final String getQuestion270() {
		return question270;
	}

	/**
	 * @param question270 the question270 to set
	 */
	public final void setQuestion270(String question270) {
		this.question270 = question270;
	}

	/**
	 * @return the question271
	 */
	public final String getQuestion271() {
		return question271;
	}

	/**
	 * @param question271 the question271 to set
	 */
	public final void setQuestion271(String question271) {
		this.question271 = question271;
	}

	/**
	 * @return the question272
	 */
	public final String getQuestion272() {
		return question272;
	}

	/**
	 * @param question272 the question272 to set
	 */
	public final void setQuestion272(String question272) {
		this.question272 = question272;
	}
	
	

	/**
	 * @return the question191
	 */
	public final String getQuestion191() {
		return question191;
	}

	/**
	 * @param question191 the question191 to set
	 */
	public final void setQuestion191(String question191) {
		this.question191 = question191;
	}

	/**
	 * @return the question192
	 */
	public final String getQuestion192() {
		return question192;
	}

	/**
	 * @param question192 the question192 to set
	 */
	public final void setQuestion192(String question192) {
		this.question192 = question192;
	}

	/**
	 * @return the question193
	 */
	public final String getQuestion193() {
		return question193;
	}

	/**
	 * @param question193 the question193 to set
	 */
	public final void setQuestion193(String question193) {
		this.question193 = question193;
	}

	/**
	 * @return the question194
	 */
	public final String getQuestion194() {
		return question194;
	}

	/**
	 * @param question194 the question194 to set
	 */
	public final void setQuestion194(String question194) {
		this.question194 = question194;
	}

	/**
	 * @return the question195
	 */
	public final String getQuestion195() {
		return question195;
	}

	/**
	 * @param question195 the question195 to set
	 */
	public final void setQuestion195(String question195) {
		this.question195 = question195;
	}

	/**
	 * @return the question196
	 */
	public final String getQuestion196() {
		return question196;
	}

	/**
	 * @param question196 the question196 to set
	 */
	public final void setQuestion196(String question196) {
		this.question196 = question196;
	}

	/**
	 * @return the question199
	 */
	public final String getQuestion199() {
		return question199;
	}

	/**
	 * @param question199 the question199 to set
	 */
	public final void setQuestion199(String question199) {
		this.question199 = question199;
	}

	/**
	 * @return the question200
	 */
	public final String getQuestion200() {
		return question200;
	}

	/**
	 * @param question200 the question200 to set
	 */
	public final void setQuestion200(String question200) {
		this.question200 = question200;
	}

	/**
	 * @return the question201
	 */
	public final String getQuestion201() {
		return question201;
	}

	/**
	 * @param question201 the question201 to set
	 */
	public final void setQuestion201(String question201) {
		this.question201 = question201;
	}

	/**
	 * @return the question202
	 */
	public final String getQuestion202() {
		return question202;
	}

	/**
	 * @param question202 the question202 to set
	 */
	public final void setQuestion202(String question202) {
		this.question202 = question202;
	}

	/**
	 * @return the question203
	 */
	public final String getQuestion203() {
		return question203;
	}

	/**
	 * @param question203 the question203 to set
	 */
	public final void setQuestion203(String question203) {
		this.question203 = question203;
	}

	/**
	 * @return the question204
	 */
	public final String getQuestion204() {
		return question204;
	}

	/**
	 * @param question204 the question204 to set
	 */
	public final void setQuestion204(String question204) {
		this.question204 = question204;
	}

	/**
	 * @return the question206
	 */
	public final String getQuestion206() {
		return question206;
	}

	/**
	 * @param question206 the question206 to set
	 */
	public final void setQuestion206(String question206) {
		this.question206 = question206;
	}

	/**
	 * @return the question207
	 */
	public final String getQuestion207() {
		return question207;
	}

	/**
	 * @param question207 the question207 to set
	 */
	public final void setQuestion207(String question207) {
		this.question207 = question207;
	}
	
	
	/**
	 * @return the question209
	 */
	public final String getQuestion209() {
		return question209;
	}

	/**
	 * @param question209 the question209 to set
	 */
	public final void setQuestion209(String question209) {
		this.question209 = question209;
	}

	
	/**
	 * @return the question210
	 */
	public final String getQuestion210() {
		return question210;
	}

	/**
	 * @param question210 the question210 to set
	 */
	public final void setQuestion210(String question210) {
		this.question210 = question210;
	}
	
	
	/**
	 * @return the question211
	 */
	public final String getQuestion211() {
		return question211;
	}

	/**
	 * @param question211 the question211 to set
	 */
	public final void setQuestion211(String question211) {
		this.question211 = question211;
	}
	
	
	/**
	 * @return the question212
	 */
	public final String getQuestion212() {
		return question212;
	}

	/**
	 * @param question212 the question212 to set
	 */
	public final void setQuestion212(String question212) {
		this.question212 = question212;
	}
	
	
	/**
	 * @return the question214
	 */
	public final String getQuestion214() {
		return question214;
	}

	/**
	 * @param question214 the question214 to set
	 */
	public final void setQuestion214(String question214) {
		this.question214 = question214;
	}
	
	
	/**
	 * @return the question215
	 */
	public final String getQuestion215() {
		return question215;
	}

	/**
	 * @param question215 the question215 to set
	 */
	public final void setQuestion215(String question215) {
		this.question215 = question215;
	}
	
	
	/**
	 * @return the question216
	 */
	public final String getQuestion216() {
		return question216;
	}

	/**
	 * @param question216 the question216 to set
	 */
	public final void setQuestion216(String question216) {
		this.question216 = question216;
	}

	/**
	 * @return the question217
	 */
	public final String getQuestion217() {
		return question217;
	}

	/**
	 * @param question217 the question217 to set
	 */
	public final void setQuestion217(String question217) {
		this.question217 = question217;
	}
	
	
	/**
	 * @return the question164
	 */
	public final String getQuestion164() {
		return question164;
	}

	/**
	 * @param question164 the question164 to set
	 */
	public final void setQuestion164(String question164) {
		this.question164 = question164;
	}
	
	/**
	 * @return the question165
	 */
	public final String getQuestion165() {
		return question165;
	}

	/**
	 * @param question165 the question165 to set
	 */
	public final void setQuestion165(String question165) {
		this.question165 = question165;
	}
	
	/**
	 * @return the question166
	 */
	public final String getQuestion166() {
		return question166;
	}

	/**
	 * @param question166 the question166 to set
	 */
	public final void setQuestion166(String question166) {
		this.question166 = question166;
	}
	
	/**
	 * @return the question167
	 */
	public final String getQuestion167() {
		return question167;
	}
	
	/**
	 * 
	 * @return the question273
	 */
	public String getQuestion273() {
		return question273;
	}

	/**
	 * 
	 * @param question273 the question273 to set
	 */
	public void setQuestion273(String question273) {
		this.question273 = question273;
	}
	
	
	/**
	 * 
	 * @return the question_currentlyHave
	 */

	public String getQuestion_currentlyHave() {
		return question_currentlyHave;
	}
	
	
	/**
	 * 
	 * @param question_currentlyHave the question_currentlyHave to set
	 */
	public void setQuestion_currentlyHave(String question_currentlyHave) {
		this.question_currentlyHave = question_currentlyHave;
	}
	
	/**
	 * 
	 * @return the question_had
	 */
	
	public String getQuestion_had() {
		return question_had;
	}

	/**
	 * 
	 * @param question_had the question_had to set
	 */
	public void setQuestion_had(String question_had) {
		this.question_had = question_had;
	}

	/**
	 * @param question167 the question167 to set
	 */
	
	public final void setQuestion167(String question167) {
		this.question167 = question167;
	}

	
	public String[] getPainArray() {
		return painArray;
	}

	public void setPainArray(String[] painArray) {
		this.painArray = painArray;
	}

	public static int getQuestion120() {
		return QUESTION_120;
	}

	public static int getQuestion121() {
		return QUESTION_121;
	}

	public static int getQuestion122() {
		return QUESTION_122;
	}

	public void setPainTypes(List<String> painTypes) {
		this.painTypes = painTypes;
	}

	
	
	public String getSendMessage() {
		return sendMessage;
	}

	public void setSendMessage(String sendMessage) {
		this.sendMessage = sendMessage;
	}

	@Override
	public String toString() {
		return "BackPainForm [painArray=" + Arrays.toString(painArray)
				+ ", painTypes=" + painTypes + ", clientId=" + clientId
				+ ", question15=" + question15 + ", question16=" + question16
				+ ", question17=" + question17 + ", question18=" + question18
				+ ", question19=" + Arrays.toString(question19)
				+ ", question21=" + question21 + ", question22=" + question22
				+ ", question123=" + Arrays.toString(question123)
				+ ", question124=" + Arrays.toString(question124)
				+ ", question24=" + question24 + ", question28=" + question28
				+ ", question29=" + question29 + ", question30=" + question30
				+ ", question31=" + question31 + ", question164=" + question164
				+ ", question165=" + question165 + ", question166="
				+ question166 + ", question167=" + question167
				+ ", question273=" + question273 + ", question_currentlyHave="
				+ question_currentlyHave + ", question_had=" + question_had
				+ ", question20=" + question20 + ", question32=" + question32
				+ ", question33=" + question33 + ", question34=" + question34
				+ ", question35=" + question35 + ", question36=" + question36
				+ ", question37=" + question37 + ", question38=" + question38
				+ ", question39=" + question39 + ", question40=" + question40
				+ ", question41=" + question41 + ", question42=" + question42
				+ ", question274=" + question274 + ", question275="
				+ question275 + ", question43=" + question43 + ", question44="
				+ question44 + ", question276=" + question276
				+ ", question277=" + question277 + ", question282="
				+ question282 + ", question283=" + question283
				+ ", question284=" + question284 + ", question285="
				+ question285 + ", question286=" + question286
				+ ", question287=" + question287 + ", question288="
				+ question288 + ", question289=" + question289
				+ ", question290=" + question290 + ", question45=" + question45
				+ ", question46=" + question46 + ", question278=" + question278
				+ ", question279=" + question279 + ", question189="
				+ question189 + ", question260=" + question260
				+ ", question280=" + question280 + ", question281="
				+ question281 + ", question261=" + question261
				+ ", question262=" + question262 + ", question263="
				+ question263 + ", question264=" + question264
				+ ", question265=" + question265 + ", question266="
				+ question266 + ", question267=" + question267
				+ ", question268=" + question268 + ", question269="
				+ question269 + ", question270=" + question270
				+ ", question271=" + question271 + ", question272="
				+ question272 + ", question191=" + question191
				+ ", question192=" + question192 + ", question193="
				+ question193 + ", question194=" + question194
				+ ", question195=" + question195 + ", question196="
				+ question196 + ", question199=" + question199
				+ ", question200=" + question200 + ", question201="
				+ question201 + ", question202=" + question202
				+ ", question203=" + question203 + ", question204="
				+ question204 + ", question206=" + question206
				+ ", question207=" + question207 + ", question209="
				+ question209 + ", question210=" + question210
				+ ", question211=" + question211 + ", question212="
				+ question212 + ", question214=" + question214
				+ ", question215=" + question215 + ", question216="
				+ question216 + ", question217=" + question217
				+ ", question291=" + question291 + ", question292="
				+ question292 + ", question293=" + question293
				+ ", question294=" + question294 + ", question295="
				+ question295 + ", question296=" + question296
				+ ", question297=" + question297 + ", question298="
				+ question298 + ", question299=" + question299
				+ ", question300=" + question300 + ", question301="
				+ question301 + ", question302=" + question302
				+ ", question303=" + question303 + ", question304="
				+ question304 + ", question305=" + question305
				+ ", question306=" + question306 + ", question307="
				+ question307 + ", question308=" + question308
				+ ", question309=" + question309 + ", question310="
				+ question310 + ", question311=" + question311
				+ ", question438=" + question438 + ", clientFormId="
				+ clientFormId + ", getQuestion438()=" + getQuestion438()
				+ ", getClientId()=" + getClientId() + ", getPainTypes()="
				+ getPainTypes() + ", getQuestion15()=" + getQuestion15()
				+ ", getQuestion16()=" + getQuestion16() + ", getQuestion17()="
				+ getQuestion17() + ", getQuestion18()=" + getQuestion18()
				+ ", getQuestion19()=" + Arrays.toString(getQuestion19())
				+ ", getQuestion20()=" + getQuestion20() + ", getQuestion21()="
				+ getQuestion21() + ", getQuestion22()=" + getQuestion22()
				+ ", getQuestion24()=" + getQuestion24() + ", getQuestion28()="
				+ getQuestion28() + ", getQuestion29()=" + getQuestion29()
				+ ", getQuestion30()=" + getQuestion30() + ", getQuestion31()="
				+ getQuestion31() + ", getQuestion32()=" + getQuestion32()
				+ ", getQuestion33()=" + getQuestion33() + ", getQuestion34()="
				+ getQuestion34() + ", getQuestion35()=" + getQuestion35()
				+ ", getQuestion36()=" + getQuestion36() + ", getQuestion37()="
				+ getQuestion37() + ", getQuestion38()=" + getQuestion38()
				+ ", getQuestion39()=" + getQuestion39() + ", getQuestion40()="
				+ getQuestion40() + ", getQuestion41()=" + getQuestion41()
				+ ", getQuestion42()=" + getQuestion42() + ", getQuestion43()="
				+ getQuestion43() + ", getQuestion44()=" + getQuestion44()
				+ ", getQuestion45()=" + getQuestion45() + ", getQuestion46()="
				+ getQuestion46() + ", getQuestion123()="
				+ Arrays.toString(getQuestion123()) + ", getQuestion124()="
				+ Arrays.toString(getQuestion124()) + ", getQuestion274()="
				+ getQuestion274() + ", getQuestion275()=" + getQuestion275()
				+ ", getQuestion276()=" + getQuestion276()
				+ ", getQuestion277()=" + getQuestion277()
				+ ", getQuestion278()=" + getQuestion278()
				+ ", getQuestion279()=" + getQuestion279()
				+ ", getQuestion280()=" + getQuestion280()
				+ ", getQuestion281()=" + getQuestion281()
				+ ", getQuestion282()=" + getQuestion282()
				+ ", getQuestion283()=" + getQuestion283()
				+ ", getQuestion284()=" + getQuestion284()
				+ ", getQuestion285()=" + getQuestion285()
				+ ", getQuestion286()=" + getQuestion286()
				+ ", getQuestion287()=" + getQuestion287()
				+ ", getQuestion288()=" + getQuestion288()
				+ ", getQuestion289()=" + getQuestion289()
				+ ", getQuestion290()=" + getQuestion290()
				+ ", getQuestion291()=" + getQuestion291()
				+ ", getQuestion292()=" + getQuestion292()
				+ ", getQuestion293()=" + getQuestion293()
				+ ", getQuestion294()=" + getQuestion294()
				+ ", getQuestion295()=" + getQuestion295()
				+ ", getQuestion296()=" + getQuestion296()
				+ ", getQuestion297()=" + getQuestion297()
				+ ", getQuestion298()=" + getQuestion298()
				+ ", getQuestion299()=" + getQuestion299()
				+ ", getQuestion300()=" + getQuestion300()
				+ ", getQuestion301()=" + getQuestion301()
				+ ", getQuestion302()=" + getQuestion302()
				+ ", getQuestion303()=" + getQuestion303()
				+ ", getQuestion304()=" + getQuestion304()
				+ ", getQuestion305()=" + getQuestion305()
				+ ", getQuestion306()=" + getQuestion306()
				+ ", getQuestion307()=" + getQuestion307()
				+ ", getQuestion308()=" + getQuestion308()
				+ ", getQuestion309()=" + getQuestion309()
				+ ", getQuestion310()=" + getQuestion310()
				+ ", getQuestion311()=" + getQuestion311()
				+ ", getQuestion189()=" + getQuestion189()
				+ ", getQuestion260()=" + getQuestion260()
				+ ", getQuestion261()=" + getQuestion261()
				+ ", getQuestion262()=" + getQuestion262()
				+ ", getQuestion263()=" + getQuestion263()
				+ ", getQuestion264()=" + getQuestion264()
				+ ", getQuestion265()=" + getQuestion265()
				+ ", getQuestion266()=" + getQuestion266()
				+ ", getQuestion267()=" + getQuestion267()
				+ ", getQuestion268()=" + getQuestion268()
				+ ", getQuestion269()=" + getQuestion269()
				+ ", getQuestion270()=" + getQuestion270()
				+ ", getQuestion271()=" + getQuestion271()
				+ ", getQuestion272()=" + getQuestion272()
				+ ", getQuestion191()=" + getQuestion191()
				+ ", getQuestion192()=" + getQuestion192()
				+ ", getQuestion193()=" + getQuestion193()
				+ ", getQuestion194()=" + getQuestion194()
				+ ", getQuestion195()=" + getQuestion195()
				+ ", getQuestion196()=" + getQuestion196()
				+ ", getQuestion199()=" + getQuestion199()
				+ ", getQuestion200()=" + getQuestion200()
				+ ", getQuestion201()=" + getQuestion201()
				+ ", getQuestion202()=" + getQuestion202()
				+ ", getQuestion203()=" + getQuestion203()
				+ ", getQuestion204()=" + getQuestion204()
				+ ", getQuestion206()=" + getQuestion206()
				+ ", getQuestion207()=" + getQuestion207()
				+ ", getQuestion209()=" + getQuestion209()
				+ ", getQuestion210()=" + getQuestion210()
				+ ", getQuestion211()=" + getQuestion211()
				+ ", getQuestion212()=" + getQuestion212()
				+ ", getQuestion214()=" + getQuestion214()
				+ ", getQuestion215()=" + getQuestion215()
				+ ", getQuestion216()=" + getQuestion216()
				+ ", getQuestion217()=" + getQuestion217()
				+ ", getQuestion164()=" + getQuestion164()
				+ ", getQuestion165()=" + getQuestion165()
				+ ", getQuestion166()=" + getQuestion166()
				+ ", getQuestion167()=" + getQuestion167()
				+ ", getQuestion273()=" + getQuestion273()
				+ ", getQuestion_currentlyHave()="
				+ getQuestion_currentlyHave() + ", getQuestion_had()="
				+ getQuestion_had() + ", getPainArray()="
				+ Arrays.toString(getPainArray()) + ", getClientFormId()="
				+ getClientFormId() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	
	
	
	
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */

	

	
	

	
	
}
