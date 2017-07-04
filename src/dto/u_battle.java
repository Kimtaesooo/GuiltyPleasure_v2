package dto;
/**
 * 유저 배틀 게임 dto 입니다.
 */
public class u_battle {
	private String u_id, u_comment, u_nickname;
	private int u_win, u_lose, u_point;
	
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_comment() {
		return u_comment;
	}
	public void setU_comment(String u_comment) {
		this.u_comment = u_comment;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getU_win() {
		return u_win;
	}
	public void setU_win(int u_win) {
		this.u_win = u_win;
	}
	public int getU_lose() {
		return u_lose;
	}
	public void setU_lose(int u_lose) {
		this.u_lose = u_lose;
	}
}
