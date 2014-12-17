package net.calba.backpain.model;

public class HistoryFactor {
	
	private String pain_type;
	private String first_occurance;
	private String last_occurance;
	private Integer code;
	
	private float acute;
	private float early;
	private float early_mid;
	private float late;
	private float late_mid;
	private float recovered;
	
	private float dd1;
	private float dd2;
	public String getPain_type() {
		return pain_type;
	}
	public void setPain_type(String pain_type) {
		this.pain_type = pain_type;
	}
	public String getFirst_occurance() {
		return first_occurance;
	}
	public void setFirst_occurance(String first_occurance) {
		this.first_occurance = first_occurance;
	}
	public String getLast_occurance() {
		return last_occurance;
	}
	public void setLast_occurance(String last_occurance) {
		this.last_occurance = last_occurance;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public float getAcute() {
		return acute;
	}
	public void setAcute(float acute) {
		this.acute = acute;
	}
	public float getEarly() {
		return early;
	}
	public void setEarly(float early) {
		this.early = early;
	}
	public float getEarly_mid() {
		return early_mid;
	}
	public void setEarly_mid(float early_mid) {
		this.early_mid = early_mid;
	}
	public float getLate() {
		return late;
	}
	public void setLate(float late) {
		this.late = late;
	}
	public float getLate_mid() {
		return late_mid;
	}
	public void setLate_mid(float late_mid) {
		this.late_mid = late_mid;
	}
	public float getRecovered() {
		return recovered;
	}
	public void setRecovered(float recovered) {
		this.recovered = recovered;
	}
	public float getDd1() {
		return dd1;
	}
	public void setDd1(float dd1) {
		this.dd1 = dd1;
	}
	public float getDd2() {
		return dd2;
	}
	public void setDd2(float dd2) {
		this.dd2 = dd2;
	}
	@Override
	public String toString() {
		return "HistoryFactor [pain_type=" + pain_type + ", first_occurance="
				+ first_occurance + ", last_occurance=" + last_occurance
				+ ", code=" + code + ", acute=" + acute + ", early=" + early
				+ ", early_mid=" + early_mid + ", late=" + late + ", late_mid="
				+ late_mid + ", recovered=" + recovered + ", dd1=" + dd1
				+ ", dd2=" + dd2 + "]";
	}
	
	
	
	

}
