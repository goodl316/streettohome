package egovframework.sth.domain.admin.domain;

public class StatisticsDTO {
	private double today;
	private double week;
	private double month;
	private double year;
	
	public double getToday() {
		return today;
	}
	public void setToday(double today) {
		this.today = today;
	}
	public double getWeek() {
		return week;
	}
	public void setWeek(double week) {
		this.week = week;
	}
	public double getMonth() {
		return month;
	}
	public void setMonth(double month) {
		this.month = month;
	}
	public double getYear() {
		return year;
	}
	public void setYear(double year) {
		this.year = year;
	}
	
}
