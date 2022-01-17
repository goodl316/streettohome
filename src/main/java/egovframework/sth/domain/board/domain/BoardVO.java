package egovframework.sth.domain.board.domain;

public class BoardVO extends BoardDTO{

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
	private int an_no;
	private int an_age;
	private String an_name;
	private String an_type1;
	private String an_type2;
	private String an_img;
	private int countBoard;
	

	public int getCountBoard() {
		return countBoard;
	}

	public void setCountBoard(int countBoard) {
		this.countBoard = countBoard;
	}

	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	public BoardVO() {
	}

	public BoardVO(int total, int nowPage,String an_type1, int cntPerPage,String b_loc_sido,String b_loc_gugun,String b_tt,String an_gender,int b_price, String an_type2) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		this.b_loc_sido = b_loc_sido;
		this.b_loc_gugun = b_loc_gugun;
		this.b_tt = b_tt;
		this.an_gender = an_gender;
		this.b_price = b_price;
		this.an_type1 = an_type1;
		this.an_type2 = an_type2;
		System.out.println(this.an_type1);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage);
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

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getSearchTxt() {
		return searchTxt;
	}

	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}

	public int getAn_no() {
		return an_no;
	}

	public void setAn_no(int an_no) {
		this.an_no = an_no;
	}

	public int getAn_age() {
		return an_age;
	}

	public void setAn_age(int an_age) {
		this.an_age = an_age;
	}

	public String getAn_name() {
		return an_name;
	}

	public void setAn_name(String an_name) {
		this.an_name = an_name;
	}

	public String getAn_type1() {
		return an_type1;
	}

	public void setAn_type1(String an_type1) {
		this.an_type1 = an_type1;
	}

	public String getAn_type2() {
		return an_type2;
	}

	public void setAn_type2(String an_type2) {
		this.an_type2 = an_type2;
	}

	public String getAn_img() {
		return an_img;
	}

	public void setAn_img(String an_img) {
		this.an_img = an_img;
	}

	public String getAn_ns() {
		return an_ns;
	}

	public void setAn_ns(String an_ns) {
		this.an_ns = an_ns;
	}

	public String getAn_gender() {
		return an_gender;
	}

	public void setAn_gender(String an_gender) {
		this.an_gender = an_gender;
	}

	private String an_ns;
	private String an_gender;

}
