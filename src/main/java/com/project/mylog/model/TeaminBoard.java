package com.project.mylog.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeaminBoard {
	private int tinum;
	private int tno;
	private int tmno;
	private String tititle;
	private String ticontent;
	private String tifilename;
	private int tihit;
	private Timestamp tirdate;
	private int tigroup;
	private int tistep;
	private int tiindent;
	private String tiip;

	private String mid;
	
	private int startRow;
	private int endRow;
	
}
