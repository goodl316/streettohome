package egovframework.sth.global.common.message.domain;

public class MessageDTO {
	private String ms_title;
	private int ms_receiver;
	private int ms_sender;
	private String ms_ctnt;
	private int ms_read;
	private String ms_dt;
	private int ms_chk;
	
	public String getMs_title() {
		return ms_title;
	}
	public void setMs_title(String ms_title) {
		this.ms_title = ms_title;
	}
	public int getMs_receiver() {
		return ms_receiver;
	}
	public void setMs_receiver(int ms_receiver) {
		this.ms_receiver = ms_receiver;
	}
	public int getMs_sender() {
		return ms_sender;
	}
	public void setMs_sender(int ms_sender) {
		this.ms_sender = ms_sender;
	}
	public String getMs_ctnt() {
		return ms_ctnt;
	}
	public void setMs_ctnt(String ms_ctnt) {
		this.ms_ctnt = ms_ctnt;
	}
	public int getMs_read() {
		return ms_read;
	}
	public void setMs_read(int ms_read) {
		this.ms_read = ms_read;
	}
	public int getMs_chk() {
		return ms_chk;
	}
	public void setMs_chk(int ms_chk) {
		this.ms_chk = ms_chk;
	}
	public String getMs_dt() {
		return ms_dt;
	}
	
	
}
