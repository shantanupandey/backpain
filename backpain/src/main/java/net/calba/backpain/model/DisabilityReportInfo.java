package net.calba.backpain.model;

import java.math.BigInteger;

public class DisabilityReportInfo {
	 private String date;
		private BigInteger score;
	    public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public BigInteger getScore() {
			return score;
		}
		public void setScore(BigInteger score) {
			this.score = score;
		}

}
