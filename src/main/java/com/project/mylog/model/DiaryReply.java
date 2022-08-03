package com.project.mylog.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DiaryReply {
	private int drnum;
	private int dnum;
	private String mid;
	private String drcontent;
	private int drgroup;
	private int drstep;
	private int drindent;
	private Timestamp drrdate;
	private String drip;
	
	private int startRow;
	private int endRow;
}