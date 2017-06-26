package dto;

public class U_Quiz {
	String uq_num;
	String u_id;
	String q_type;
	String uq_question;
	String uq_answer;
	String uq_wa_a;
	String uq_wa_b;
	String uq_wa_c;
	String uq_regdate;
	String uq_adopt;

	
	public String getUq_num() {
		return uq_num;
	}
	public void setUq_num(String uq_num) {
		this.uq_num = uq_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getUq_question() {
		return uq_question;
	}
	public void setUq_question(String uq_question) {
		this.uq_question = uq_question;
	}
	public String getUq_answer() {
		return uq_answer;
	}
	public void setUq_answer(String uq_answer) {
		this.uq_answer = uq_answer;
	}
	public String getUq_wa_a() {
		return uq_wa_a;
	}
	public void setUq_wa_a(String uq_wa_a) {
		this.uq_wa_a = uq_wa_a;
	}
	public String getUq_wa_b() {
		return uq_wa_b;
	}
	public void setUq_wa_b(String uq_wa_b) {
		this.uq_wa_b = uq_wa_b;
	}
	public String getUq_wa_c() {
		return uq_wa_c;
	}
	public void setUq_wa_c(String uq_wa_c) {
		this.uq_wa_c = uq_wa_c;
	}
	public String getUq_regdate() {
		return uq_regdate;
	}
	public void setUq_regdate(String uq_regdate) {
		this.uq_regdate = uq_regdate;
	}
	public String getUq_adopt() {
		return uq_adopt;
	}
	public void setUq_adopt(String uq_adopt) {
		this.uq_adopt = uq_adopt;
	}
	@Override
	public String toString() {
		return "U_Quiz [uq_num=" + uq_num + ", u_id=" + u_id + ", q_type=" + q_type + ", uq_question=" + uq_question
				+ ", uq_answer=" + uq_answer + ", uq_wa_a=" + uq_wa_a + ", uq_wa_b=" + uq_wa_b + ", uq_wa_c=" + uq_wa_c
				+ ", uq_regdate=" + uq_regdate + ", uq_adopt=" + uq_adopt + "]";
	}
	
	
}
