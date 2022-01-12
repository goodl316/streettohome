package egovframework.sth.domain.board.domain;

public class BoardAuctionDTO {
	private int m_no;
	private int b_no;
	private String ac_price;
	private String ac_startprice;
	private int ac_cur_winner;
	
	
	public String getAc_price() {
		return ac_price;
	}
	public void setAc_price(String ac_price) {
		this.ac_price = ac_price;
	}
	public String getAc_startprice() {
		return ac_startprice;
	}
	public void setAc_startprice(String ac_startprice) {
		this.ac_startprice = ac_startprice;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getAc_cur_winner() {
		return ac_cur_winner;
	}
	public void setAc_cur_winner(int ac_cur_winner) {
		this.ac_cur_winner = ac_cur_winner;
	}
	
	
}
