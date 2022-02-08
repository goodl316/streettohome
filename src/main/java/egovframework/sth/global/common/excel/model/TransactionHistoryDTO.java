package egovframework.sth.global.common.excel.model;

public class TransactionHistoryDTO {
	private int b_no;
	private String th_buyer;
	private String th_seller;
	private int th_price;
	private int th_fee;
	private String th_dt;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getTh_buyer() {
		return th_buyer;
	}
	public void setTh_buyer(String th_buyer) {
		this.th_buyer = th_buyer;
	}
	public String getTh_seller() {
		return th_seller;
	}
	public void setTh_seller(String th_seller) {
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
}
