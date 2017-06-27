package dto;

public class Battle_Chating {
	int c_number = 0;
	String u_id;
	String message;
	String battleroom = "zero";
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getBattleroom() {
		return battleroom;
	}
	public void setBattleroom(String battleroom) {
		this.battleroom = battleroom;
	}
	@Override
	public String toString() {
		return "Battle_Chating [c_number=" + c_number + ", u_id=" + u_id + ", message=" + message + ", battleroom="
				+ battleroom + "]";
	}
	
	
}
