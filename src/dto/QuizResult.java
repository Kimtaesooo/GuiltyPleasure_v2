package dto;

public class QuizResult {
	String u_id;
	String q_code;
	int q_ca_count = 0;
	int q_wa_count = 0;
	int ca_sum = 0;
	int wa_sum= 0;
	String q_type;
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getQ_code() {
		return q_code;
	}
	public int getCa_sum() {
		return ca_sum;
	}
	public int getWa_sum() {
		return wa_sum;
	}
	public void setQ_code(String q_code) {
		this.q_code = q_code;
	}
	public int getQ_ca_count() {
		return q_ca_count;
	}
	public void setQ_ca_count(int q_ca_count) {
		this.q_ca_count = q_ca_count;
		this.ca_sum = q_ca_count;
	}
	public int getQ_wa_count() {
		return q_wa_count;
	}
	public void setQ_wa_count(int q_wa_count) {
		this.q_wa_count = q_wa_count;
		this.wa_sum = q_wa_count;
	}
	@Override
	public String toString() {
		return "QuizResult [u_id=" + u_id + ", q_ca_count=" + q_ca_count + ", q_wa_count=" + q_wa_count + "]";
	}
	
	
}
