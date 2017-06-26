package dto;

public class c_board {
	private String sc_num, u_id, sc_type, sc_title, sc_content,
	sc_regdate,sc_state,sc_answer;
	
	public String getSc_answer() {
		return sc_answer;
	}
	public void setSc_answer(String sc_answer) {
		this.sc_answer = sc_answer;
	}
	private String img;
	
	public String getSc_num() {
		return sc_num;
	}
	public void setSc_num(String sc_num) {
		this.sc_num = sc_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getSc_type() {
		return sc_type;
	}
	public void setSc_type(String sc_type) {
		this.sc_type = sc_type;
	}
	public String getSc_title() {
		return sc_title;
	}
	public void setSc_title(String sc_title) {
		this.sc_title = sc_title;
	}
	public String getSc_content() {
		return sc_content;
	}
	public void setSc_content(String sc_content) {
		this.sc_content = sc_content;
	}
	public String getSc_regdate() {
		return sc_regdate;
	}
	public void setSc_regdate(String sc_regdate) {
		this.sc_regdate = sc_regdate;
	}
	public String getSc_state() {
		return sc_state;
	}
	public void setSc_state(String sc_state) {
		this.sc_state = sc_state;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
