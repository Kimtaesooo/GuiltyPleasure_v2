package dto;

import java.sql.Timestamp;
/**
 * 공지사항 dto 입니다.
 */
public class Notice {
	private String n_num;
	private String u_id;
	private String u_nickname;
	private String n_title;
	private String n_content;
	private String n_regdate;
	private int n_count;
	private char n_important;
	
	public String getN_num() {
		return n_num;
	}
	public void setN_num(String n_num) {
		this.n_num = n_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	public int getN_count() {
		return n_count;
	}
	public void setN_count(int n_count) {
		this.n_count = n_count;
	}
	public char getN_important() {
		return n_important;
	}
	public void setN_important(char n_important) {
		this.n_important = n_important;
	}
}
