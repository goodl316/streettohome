package egovframework.sth.domain.pay.domain;

public class TranHistoryDTO {
	
	private int b_no;
	private int th_buyer;
	private int th_seller;
	private int th_price;
	private int th_fee;
	private String th_dt;
	private String b_title;
	private String nickname;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getTh_buyer() {
		return th_buyer;
	}
	public void setTh_buyer(int th_buyer) {
		this.th_buyer = th_buyer;
	}
	public int getTh_seller() {
		return th_seller;
	}
	public void setTh_seller(int th_seller) {
		this.th_seller = th_seller;
	}
	public int getTh_price() {
		return th_price;
	}
	public void setTh_price(int th_price) {
		this.th_price = th_price;
	}
	public int getTh_fee() {
		return th_fee;
	}
	public void setTh_fee(int th_fee) {
		this.th_fee = th_fee;
	}
	public String getTh_dt() {
		return th_dt;
	}
	public void setTh_dt(String th_dt) {
		this.th_dt = th_dt;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
