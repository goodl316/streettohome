package egovframework.sth.domain.message.domain;

public class MessageDTO {
	private String ms_title;
	private int ms_receiver;
	private int ms_sender;
	private String ms_ctnt;
	private int ms_read;
	private String ms_dt;
	private int ms_chk;
	private int ms_no;
	
	private String receiver;
	private String sender;
	
	private int[] checkVal;
	
	public int[] getCheckVal() {
		return checkVal;
	}
	public void setCheckVal(int[] checkVal) {
		this.checkVal = checkVal;
	}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
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
