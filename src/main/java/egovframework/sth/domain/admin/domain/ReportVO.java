package egovframework.sth.domain.admin.domain;

public class ReportVO {
	private int rp_no;
	private int b_no;
	private String wr_no;
	private String name;
	public String getWr_no() {
		return wr_no;
	}
	public void setWr_no(String wr_no) {
		this.wr_no = wr_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String rp_ctnt;
	private String b_title;
	private String an_type1;
	
	public int getRp_no() {
		return rp_no;
	}
	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	
	
	public String getRp_ctnt() {
		return rp_ctnt;
	}
	public void setRp_ctnt(String rp_ctnt) {
		this.rp_ctnt = rp_ctnt;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getAn_type1() {
		return an_type1;
	}
	public void setAn_type1(String an_type1) {
		this.an_type1 = an_type1;
	}
	
	
}
