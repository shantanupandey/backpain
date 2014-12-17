package net.calba.backpain.model;

public class QuestionScore {

	private Integer questionId;
	private Integer score;
	private String answertext;
	private Integer max_score;
	private Integer questionoptionid;
	public Integer getQuestionoptionid() {
		return questionoptionid;
	}
	public void setQuestionoptionid(Integer questionoptionid) {
		this.questionoptionid = questionoptionid;
	}
	public Integer getMax_score() {
		return max_score;
	}
	public void setMax_score(Integer max_score) {
		this.max_score = max_score;
	}
	public String getAnswertext() {
		return answertext;
	}
	public void setAnswertext(String answertext) {
		this.answertext = answertext;
	}
	/**
	 * @return the questionId
	 */
	public final Integer getQuestionId() {
		return questionId;
	}
	/**
	 * @param questionId the questionId to set
	 */
	public final void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	/**
	 * @return the score
	 */
	public final Integer getScore() {
		return score;
	}
	/**
	 * @param score the score to set
	 */
	public final void setScore(Integer score) {
		this.score = score;
	}
	
	
	
}
