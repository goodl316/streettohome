package egovframework.sth.domain.pay.domain;

public class PayDTO {

	private int b_no;
	private int b_price;
	private int b_auth;
	private String b_title;
	private String b_state;
	
	private int m_no;
	private int buyer;
	private int seller;
	
	private final int fee = 5;
	
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public String getB_state() {
		return b_state;
	}

	public int getBuyer() {
		return buyer;
	}
	public void setBuyer(int buyer) {
		this.buyer = buyer;
	}
	public int getSeller() {
		return seller;
	}
	public void setSeller(int seller) {
		this.seller = seller;
	}
	public int getFee() {
		return fee;
	}
	public int getB_auth() {
		return b_auth;
	}
	public void setB_auth(int b_auth) {
		this.b_auth = b_auth;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	
	
}
