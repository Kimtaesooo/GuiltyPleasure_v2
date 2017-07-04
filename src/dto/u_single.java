package dto;
/**
 * 유저 싱글 게임 dto 입니다.
 */
public class u_single {
	private String u_id, u_comment, u_nickname, up_type;
	private int a_cnt, wa_cnt, u_point;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_comment() {
		return u_comment;
	}
	public void setU_comment(String u_comment) {
		this.u_comment = u_comment;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getUp_type() {
		return up_type;
	}
	public void setUp_type(String up_type) {
		this.up_type = up_type;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}
	public int getWa_cnt() {
		return wa_cnt;
	}
	public void setWa_cnt(int wa_cnt) {
		this.wa_cnt = wa_cnt;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	
}
