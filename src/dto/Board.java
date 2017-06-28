package dto;

public class Board {
	private String b_num;
	private String u_id;
	private String u_nickname;
	private String b_title;
	private String b_content;
	private String b_regdate;
	private int b_count;
	private String b_reply;
	private String prevnum;
	private String nextnum;
	private String prevtitle;
	private String nexttitle;
	
	public String getPrevtitle() {
		return prevtitle;
	}
	public void setPrevtitle(String prevtitle) {
		this.prevtitle = prevtitle;
	}
	public String getNexttitle() {
		return nexttitle;
	}
	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	public String getPrevnum() {
		return prevnum;
	}
	public void setPrevnum(String prevnum) {
		this.prevnum = prevnum;
	}
	public String getNextnum() {
		return nextnum;
	}
	public void setNextnum(String nextnum) {
		this.nextnum = nextnum;
	}
	public String getB_num() {
		return b_num;
	}
	public void setB_num(String b_num) {
		this.b_num = b_num;
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
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_reply() {
		return b_reply;
	}
	public void setB_reply(String b_reply) {
		this.b_reply = b_reply;
	}
}
