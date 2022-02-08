package egovframework.sth.domain.admin.domain;

public class AdminMessageDTO {
	private String ms_title;
	private String ms_ctnt;
	private int ms_sender;
	private int[] ms_receiver;
	private int allChk;
	private String nickname;

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAllChk() {
		return allChk;
	}
	public void setAllChk(int allChk) {
		this.allChk = allChk;
	}
	public int getMs_sender() {
		return ms_sender;
	}
	public void setMs_sender(int ms_sender) {
		this.ms_sender = ms_sender;
	}
	public int[] getMs_receiver() {
		return ms_receiver;
	}
	public void setMs_receiver(int[] ms_receiver) {
		this.ms_receiver = ms_receiver;
	}
	public String getMs_title() {
		return ms_title;
	}
	public void setMs_title(String ms_title) {
		this.ms_title = ms_title;
	}
	public String getMs_ctnt() {
		return ms_ctnt;
	}
	public void setMs_ctnt(String ms_ctnt) {
		this.ms_ctnt = ms_ctnt;
	}
	
	
}
