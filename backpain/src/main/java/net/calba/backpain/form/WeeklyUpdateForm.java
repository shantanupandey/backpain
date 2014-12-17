package net.calba.backpain.form;

import org.hibernate.validator.constraints.NotEmpty;

public class WeeklyUpdateForm extends BaseForm {
	
	public static final int QUESTION_87 = 87;
	public static final int QUESTION_439 = 439;
	public static final int QUESTION_440 = 440;
	public static final int QUESTION_441 = 441;
	
	public static final int QUESTION_449 = 449;
	public static final int QUESTION_450 = 450;
	public static final int QUESTION_451 = 451;
	
	public static final int QUESTION_458 = 458;
	public static final int QUESTION_459 = 459;
	public static final int QUESTION_460 = 460;
	
	private Integer clientId;
	
	private String question80 = "";
	private String question81 = "";
	private String question82 = "";
	private String question83 = "";
	private String question84 = "";
	/**
	 * child of question 84 
	 */
	private String question125 = "";
	private String question85 = "";
	private String question86 = "";
	private String[] question87= {};
	
	private String[] question439={};
	private String[] question440={};
	private String[] question441={};
	
	private String[] question449={};
	private String[] question450={};
	private String[] question451={};
	
	private String[] question458={};
	private String[] question459={};
	private String[] question460={};
	
	private String question88 = "";	
	private String question89 = "";
	private String question90 = "";
	private String question91 = "";
	private String question92 = "";
	private String question93 = "";
	private String question94 = "";
	private String question95 = "";
	private String question96 = "";
	/**
	 * child of question 96 
	 */
	private String question126 = "";
	private String question97 = "";
	private String question98 = "";	
	
	
	private String question442="";
	private String question443="";
	private String question444="";
	private String question445="";
	private String question446="";
	private String question447="";
	
	private String question448="";
	
	private String question452="";
	private String question453="";
	private String question454="";
	private String question455="";
	private String question456="";
	
	private String question457="";
	
	private String question461="";
	private String question462="";
	private String question463="";
	private String question464="";
	private String question465="";
	
	private String question466="";
	private String question467="";
	private String question468="";
	private String question469="";
	private String question470="";
	private String question472="";
	private String question473="";
	private String question474="";
	
	private String question475="";
	private String question476="";
	private String question477="";
	private String question478="";
	private String question479="";
	private String question480="";
	private String question481="";
	private String question482="";
	
	private String question483="";
	private String question484="";
	private String question485="";
	private String question486="";
	private String question487="";
	private String question488="";
	private String question489="";
	private String question490="";
	
	private String question491="";
	private String question492="";
	private String question493="";
	private String setFlag="";
	
	private String question494="";
	private String question495="";
	private String question496="";
	
	private String question511="";
	
	
	private String question14="";
	private String question18="";
	private String question23="";
	private String question27="";
	private String question25="";
	private String question50="";
	private String question56="";
	
	
	public String getQuestion14() {
		return question14;
	}

	public void setQuestion14(String question14) {
		this.question14 = question14;
	}

	public String getQuestion18() {
		return question18;
	}

	public void setQuestion18(String question18) {
		this.question18 = question18;
	}

	public String getQuestion23() {
		return question23;
	}

	public void setQuestion23(String question23) {
		this.question23 = question23;
	}

	public String getQuestion27() {
		return question27;
	}

	public void setQuestion27(String question27) {
		this.question27 = question27;
	}

	public String getQuestion25() {
		return question25;
	}

	public void setQuestion25(String question25) {
		this.question25 = question25;
	}

	public String getQuestion50() {
		return question50;
	}

	public void setQuestion50(String question50) {
		this.question50 = question50;
	}

	public String getQuestion56() {
		return question56;
	}

	public void setQuestion56(String question56) {
		this.question56 = question56;
	}

	public String getQuestion511() {
		return question511;
	}

	public void setQuestion511(String question511) {
		this.question511 = question511;
	}

	public String getQuestion494() {
		return question494;
	}

	public void setQuestion494(String question494) {
		this.question494 = question494;
	}

	public String getQuestion495() {
		return question495;
	}

	public void setQuestion495(String question495) {
		this.question495 = question495;
	}

	public String getQuestion496() {
		return question496;
	}

	public void setQuestion496(String question496) {
		this.question496 = question496;
	}

	public String getSetFlag() {
		return setFlag;
	}

	public void setSetFlag(String setFlag) {
		this.setFlag = setFlag;
	}

	public String[] getQuestion439() {
		return question439;
	}

	public void setQuestion439(String[] question439) {
		this.question439 = question439;
	}

	public String[] getQuestion440() {
		return question440;
	}

	public void setQuestion440(String[] question440) {
		this.question440 = question440;
	}

	public String[] getQuestion441() {
		return question441;
	}

	public void setQuestion441(String[] question441) {
		this.question441 = question441;
	}

	public String[] getQuestion449() {
		return question449;
	}

	public void setQuestion449(String[] question449) {
		this.question449 = question449;
	}

	public String[] getQuestion450() {
		return question450;
	}

	public void setQuestion450(String[] question450) {
		this.question450 = question450;
	}

	public String[] getQuestion451() {
		return question451;
	}

	public void setQuestion451(String[] question451) {
		this.question451 = question451;
	}

	public String[] getQuestion458() {
		return question458;
	}

	public void setQuestion458(String[] question458) {
		this.question458 = question458;
	}

	public String[] getQuestion459() {
		return question459;
	}

	public void setQuestion459(String[] question459) {
		this.question459 = question459;
	}

	public String[] getQuestion460() {
		return question460;
	}

	public void setQuestion460(String[] question460) {
		this.question460 = question460;
	}

	public String getQuestion492() {
		return question492;
	}

	public void setQuestion492(String question492) {
		this.question492 = question492;
	}

	public String getQuestion493() {
		return question493;
	}

	public void setQuestion493(String question493) {
		this.question493 = question493;
	}

	public String getQuestion491() {
		return question491;
	}

	public void setQuestion491(String question491) {
		this.question491 = question491;
	}

	public String getQuestion448() {
		return question448;
	}

	public void setQuestion448(String question448) {
		this.question448 = question448;
	}

	

	public String getQuestion452() {
		return question452;
	}

	public void setQuestion452(String question452) {
		this.question452 = question452;
	}

	public String getQuestion453() {
		return question453;
	}

	public void setQuestion453(String question453) {
		this.question453 = question453;
	}

	public String getQuestion454() {
		return question454;
	}

	public void setQuestion454(String question454) {
		this.question454 = question454;
	}

	public String getQuestion455() {
		return question455;
	}

	public void setQuestion455(String question455) {
		this.question455 = question455;
	}

	public String getQuestion456() {
		return question456;
	}

	public void setQuestion456(String question456) {
		this.question456 = question456;
	}

	public String getQuestion457() {
		return question457;
	}

	public void setQuestion457(String question457) {
		this.question457 = question457;
	}

	

	public String getQuestion461() {
		return question461;
	}

	public void setQuestion461(String question461) {
		this.question461 = question461;
	}

	public String getQuestion462() {
		return question462;
	}

	public void setQuestion462(String question462) {
		this.question462 = question462;
	}

	public String getQuestion463() {
		return question463;
	}

	public void setQuestion463(String question463) {
		this.question463 = question463;
	}

	public String getQuestion464() {
		return question464;
	}

	public void setQuestion464(String question464) {
		this.question464 = question464;
	}

	public String getQuestion465() {
		return question465;
	}

	public void setQuestion465(String question465) {
		this.question465 = question465;
	}

	public String getQuestion447() {
		return question447;
	}

	public void setQuestion447(String question447) {
		this.question447 = question447;
	}

	
	public String getQuestion442() {
		return question442;
	}

	public void setQuestion442(String question442) {
		this.question442 = question442;
	}

	public String getQuestion443() {
		return question443;
	}

	public void setQuestion443(String question443) {
		this.question443 = question443;
	}

	public String getQuestion444() {
		return question444;
	}

	public void setQuestion444(String question444) {
		this.question444 = question444;
	}

	public String getQuestion445() {
		return question445;
	}

	public void setQuestion445(String question445) {
		this.question445 = question445;
	}

	public String getQuestion446() {
		return question446;
	}

	public void setQuestion446(String question446) {
		this.question446 = question446;
	}

	public WeeklyUpdateForm() {
		super();
	}
	
	public WeeklyUpdateForm(Integer clientFormId) {
		super(clientFormId);	
	}

	public String getQuestion80() {
		return question80;
	}

	public void setQuestion80(String question80) {
		this.question80 = question80;
	}

	public String getQuestion81() {
		return question81;
	}

	public void setQuestion81(String question81) {
		this.question81 = question81;
	}

	public String getQuestion82() {
		return question82;
	}

	public void setQuestion82(String question82) {
		this.question82 = question82;
	}

	public String getQuestion83() {
		return question83;
	}

	public void setQuestion83(String question83) {
		this.question83 = question83;
	}

	public String getQuestion84() {
		return question84;
	}

	public void setQuestion84(String question84) {
		this.question84 = question84;
	}

	public String getQuestion85() {
		return question85;
	}

	public void setQuestion85(String question85) {
		this.question85 = question85;
	}

	public String getQuestion86() {
		return question86;
	}

	public void setQuestion86(String question86) {
		this.question86 = question86;
	}

	public String[] getQuestion87() {
		return question87;
	}

	public void setQuestion87(String[] question87) {
		this.question87 = question87;
	}

	public String getQuestion88() {
		return question88;
	}

	public void setQuestion88(String question88) {
		this.question88 = question88;
	}

	public String getQuestion89() {
		return question89;
	}

	public void setQuestion89(String question89) {
		this.question89 = question89;
	}

	public String getQuestion90() {
		return question90;
	}

	public void setQuestion90(String question90) {
		this.question90 = question90;
	}

	public String getQuestion91() {
		return question91;
	}

	public void setQuestion91(String question91) {
		this.question91 = question91;
	}

	public String getQuestion92() {
		return question92;
	}

	public void setQuestion92(String question92) {
		this.question92 = question92;
	}

	public String getQuestion93() {
		return question93;
	}

	public void setQuestion93(String question93) {
		this.question93 = question93;
	}

	public String getQuestion94() {
		return question94;
	}

	public void setQuestion94(String question94) {
		this.question94 = question94;
	}

	public String getQuestion95() {
		return question95;
	}

	public void setQuestion95(String question95) {
		this.question95 = question95;
	}

	public String getQuestion96() {
		return question96;
	}

	public void setQuestion96(String question96) {
		this.question96 = question96;
	}

	public String getQuestion97() {
		return question97;
	}

	public void setQuestion97(String question97) {
		this.question97 = question97;
	}

	public String getQuestion98() {
		return question98;
	}

	public void setQuestion98(String question98) {
		this.question98 = question98;
	}

	public String getQuestion125() {
		return question125;
	}

	public void setQuestion125(String question125) {
		this.question125 = question125;
	}

	public String getQuestion126() {
		return question126;
	}

	public void setQuestion126(String question126) {
		this.question126 = question126;
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

	
	public String getQuestion466() {
		return question466;
	}

	public void setQuestion466(String question466) {
		this.question466 = question466;
	}

	public String getQuestion467() {
		return question467;
	}

	public void setQuestion467(String question467) {
		this.question467 = question467;
	}

	public String getQuestion468() {
		return question468;
	}

	public void setQuestion468(String question468) {
		this.question468 = question468;
	}

	public String getQuestion469() {
		return question469;
	}

	public void setQuestion469(String question469) {
		this.question469 = question469;
	}

	public String getQuestion470() {
		return question470;
	}

	public void setQuestion470(String question470) {
		this.question470 = question470;
	}

	public String getQuestion472() {
		return question472;
	}

	public void setQuestion472(String question472) {
		this.question472 = question472;
	}

	public String getQuestion473() {
		return question473;
	}

	public void setQuestion473(String question473) {
		this.question473 = question473;
	}

	public String getQuestion474() {
		return question474;
	}

	public void setQuestion474(String question474) {
		this.question474 = question474;
	}

	public String getQuestion475() {
		return question475;
	}

	public void setQuestion475(String question475) {
		this.question475 = question475;
	}

	public String getQuestion476() {
		return question476;
	}

	public void setQuestion476(String question476) {
		this.question476 = question476;
	}

	public String getQuestion477() {
		return question477;
	}

	public void setQuestion477(String question477) {
		this.question477 = question477;
	}

	public String getQuestion478() {
		return question478;
	}

	public void setQuestion478(String question478) {
		this.question478 = question478;
	}

	public String getQuestion479() {
		return question479;
	}

	public void setQuestion479(String question479) {
		this.question479 = question479;
	}

	public String getQuestion480() {
		return question480;
	}

	public void setQuestion480(String question480) {
		this.question480 = question480;
	}

	public String getQuestion481() {
		return question481;
	}

	public void setQuestion481(String question481) {
		this.question481 = question481;
	}

	public String getQuestion482() {
		return question482;
	}

	public void setQuestion482(String question482) {
		this.question482 = question482;
	}

	public String getQuestion483() {
		return question483;
	}

	public void setQuestion483(String question483) {
		this.question483 = question483;
	}

	public String getQuestion484() {
		return question484;
	}

	public void setQuestion484(String question484) {
		this.question484 = question484;
	}

	public String getQuestion485() {
		return question485;
	}

	public void setQuestion485(String question485) {
		this.question485 = question485;
	}

	public String getQuestion486() {
		return question486;
	}

	public void setQuestion486(String question486) {
		this.question486 = question486;
	}

	public String getQuestion487() {
		return question487;
	}

	public void setQuestion487(String question487) {
		this.question487 = question487;
	}

	public String getQuestion488() {
		return question488;
	}

	public void setQuestion488(String question488) {
		this.question488 = question488;
	}

	public String getQuestion489() {
		return question489;
	}

	public void setQuestion489(String question489) {
		this.question489 = question489;
	}

	public String getQuestion490() {
		return question490;
	}

	public void setQuestion490(String question490) {
		this.question490 = question490;
	}
	
	
	
	
	 
	

}
