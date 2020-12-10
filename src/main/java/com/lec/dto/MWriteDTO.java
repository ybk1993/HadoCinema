package com.lec.dto;

public class MWriteDTO {

	private int uid;
	private String name;
	private String director;
	private String date;
	private String time;
	private String actor;
	private String info;
	private String img;
	private int screens;
	private String showdate;
	private String showtime;
	
	public MWriteDTO() {
		// TODO Auto-generated constructor stub
	}

	public MWriteDTO(int uid, String name, String director, String date, String time, String actor, String info,
			String img, int screens, String showdate, String showtime) {
		super();
		this.uid = uid;
		this.name = name;
		this.director = director;
		this.date = date;
		this.time = time;
		this.actor = actor;
		this.info = info;
		this.img = img;
		this.screens = screens;
		this.showdate = showdate;
		this.showtime = showtime;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getScreens() {
		return screens;
	}

	public void setScreens(int screens) {
		this.screens = screens;
	}

	public String getShowdate() {
		return showdate;
	}

	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}

	public String getShowtime() {
		return showtime;
	}

	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}

	

	
	
	
}
