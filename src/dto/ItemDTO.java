package dto;

public class ItemDTO {
	private String buy_code;
	private String id;
	private String item_code;
	private String item_name;
	private String buy_date;
	private String item_limit;
	private int price;
	
	public String getBuy_code() {
		return buy_code;
	}
	public void setBuy_code(String buy_code) {
		this.buy_code = buy_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public String getItem_limit() {
		return item_limit;
	}
	public void setItem_limit(String item_limit) {
		this.item_limit = item_limit;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
