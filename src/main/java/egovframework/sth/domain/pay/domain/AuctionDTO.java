package egovframework.sth.domain.pay.domain;

public class AuctionDTO {
	
	private int b_no;
	private String b_title;
	private int price;
	private String b_tt;
	private int b_auth;
	private String b_state;
	
	private String writer;
	private String winner;

	private int m_no;
	private int ac_cur_winner;
	private int ac_price;
	private int ac_startprice;
	private String ac_enddt;
	
	private final int fee = 5;
	
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getB_tt() {
		return b_tt;
	}
	public void setB_tt(String b_tt) {
		this.b_tt = b_tt;
	}
	public int getB_auth() {
		return b_auth;
	}
	public void setB_auth(int b_auth) {
		this.b_auth = b_auth;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}
	public int getFee() {
		return fee;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getAc_cur_winner() {
		return ac_cur_winner;
	}
	public void setAc_cur_winner(int ac_cur_winner) {
		this.ac_cur_winner = ac_cur_winner;
	}
	public int getAc_price() {
		return ac_price;
	}
	public void setAc_price(int ac_price) {
		this.ac_price = ac_price;
	}
	public int getAc_startprice() {
		return ac_startprice;
	}
	public void setAc_startprice(int ac_startprice) {
		this.ac_startprice = ac_startprice;
	}
	public String getAc_enddt() {
		return ac_enddt;
	}
	public void setAc_enddt(String ac_enddt) {
		this.ac_enddt = ac_enddt;
	}
	
	
}
