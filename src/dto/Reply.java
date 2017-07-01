package dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
	private String r_reply;
	private String b_num;
	private String u_id;
	private String r_content;
	private String r_regdate;
	
	public String getR_reply() {
		return r_reply;
	}
	public void setR_reply(String r_reply) {
		this.r_reply = r_reply;
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
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_regdate() {
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(r_regdate);
			r_regdate = new SimpleDateFormat("yy/MM/dd HH:mm").format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return r_regdate;
	}
	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}
	
}
