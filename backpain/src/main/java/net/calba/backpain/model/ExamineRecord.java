package net.calba.backpain.model;

public class ExamineRecord {
	
	    private Integer id;
	    private Integer score;
	    private Integer userId;
	    private Integer selfExamineSeqId;
	    public Integer getSelfExamineSeqId() {
			return selfExamineSeqId;
		}
		public void setSelfExamineSeqId(Integer selfExamineSeqId) {
			this.selfExamineSeqId = selfExamineSeqId;
		}
		private String date;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Integer getScore() {
			return score;
		}
		public void setScore(Integer score) {
			this.score = score;
		}
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
	    
	    
	    

	

}
