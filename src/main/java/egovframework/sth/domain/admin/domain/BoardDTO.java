package egovframework.sth.domain.admin.domain;

public class BoardDTO{
	
	private int b_no;
	private String b_title;
	private String b_ctnt;
	private String b_dt;
	private int b_hit;
	private int b_price;
	private String b_loc_sido;
	private String b_loc_gugun;
	private String b_tt;
	private String b_enddt;
	private String b_writer;
	private String searchTxt;
	private String an_type1;
	private int state;
	private String b_ok;
	
	
	public String getB_ok() {
		return b_ok;
	}
	public void setB_ok(String b_ok) {
		this.b_ok = b_ok;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public String getB_loc_sido() {
		return b_loc_sido;
	}
	public void setB_loc_sido(String b_loc_sido) {
		this.b_loc_sido = b_loc_sido;
	}
	public String getB_loc_gugun() {
		return b_loc_gugun;
	}
	public void setB_loc_gugun(String b_loc_gugun) {
		this.b_loc_gugun = b_loc_gugun;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	private int b_state;
	
	private int m_no;
	
	
	public int getB_state() {
		return b_state;
	}
	public void setB_state(int b_state) {
		this.b_state = b_state;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_ctnt() {
		return b_ctnt;
	}
	public void setB_ctnt(String b_ctnt) {
		this.b_ctnt = b_ctnt;
	}
	public String getB_dt() {
		return b_dt;
	}
	public void setB_dt(String b_dt) {
		this.b_dt = b_dt;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	
	public String getB_tt() {
		return b_tt;
	}
	public void setB_tt(String b_tt) {
		this.b_tt = b_tt;
	}
	public String getB_enddt() {
		return b_enddt;
	}
	public void setB_enddt(String b_enddt) {
		this.b_enddt = b_enddt;
	}
	
	public int getB_auth() {
		return b_auth;
	}
	public void setB_auth(int b_auth) {
		this.b_auth = b_auth;
	}
	public int getB_del() {
		return b_del;
	}
	public void setB_del(int b_del) {
		this.b_del = b_del;
	}
	public String getAn_type1() {
		return an_type1;
	}
	public void setAn_type1(String an_type1) {
		this.an_type1 = an_type1;
	}
	private int b_auth;
	private int b_del;
	
	

}
